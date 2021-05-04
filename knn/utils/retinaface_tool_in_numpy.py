import numpy as np
import cv2

def py_cpu_nms_in_numpy(dets, thresh):
    """Pure Python NMS baseline."""
    # 所有图片的坐标信息，字典形式储存
    x1 = dets[:, 0]
    y1 = dets[:, 1]
    x2 = dets[:, 2]
    y2 = dets[:, 3]
    scores = dets[:, 4]##bbox打分
    # 计算出所有图片的面积
    areas = (x2 - x1 + 1) * (y2 - y1 + 1)
    # 打分从大到小排列，取index
    order = scores.argsort()[::-1]

    keep = [] # 用来存放最后保留的图片的相应评分
    while order.size > 0:
        # order[0]是当前分数最大的窗口，肯定保留
        i = order[0]
        keep.append(i)# 保留改图片的值
        # 计算窗口i与其他所有窗口的交叠部分的面积
        xx1 = np.maximum(x1[i], x1[order[1:]])
        yy1 = np.maximum(y1[i], y1[order[1:]])
        xx2 = np.minimum(x2[i], x2[order[1:]])
        yy2 = np.minimum(y2[i], y2[order[1:]])
        # 计算出各个相交矩形的面积
        w = np.maximum(0.0, xx2 - xx1 + 1)
        h = np.maximum(0.0, yy2 - yy1 + 1)
        inter = w * h
        # 交/并得到iou值
        ovr = inter / (areas[i] + areas[order[1:]] - inter)
        # inds为所有与窗口i的iou值小于threshold值的窗口的index，其他窗口此次都被窗口i吸收
        inds = np.where(ovr <= thresh)[0]
        # order里面只保留与窗口i交叠面积小于threshold的那些窗口，由于ovr长度比order长度少1(不包含i)，所以inds+1对应到保留的窗口
        order = order[inds + 1]

    return keep

def point_form(boxes):
    """ Convert prior_boxes to (xmin, ymin, xmax, ymax)
    representation for comparison to point form ground truth data.
    Args:
        boxes: (tensor) center-size default boxes from priorbox layers.
    Return:
        boxes: (tensor) Converted xmin, ymin, xmax, ymax form of boxes.
    """
    """
    将以前的方框转换为（xmin、ymin、xmax、ymax）
	用于与点格式地面真实数据进行比较的表示。
	参数：
	box:（tensor）中心大小priorbox层的默认框。
	返回：
	盒子：（张量）转换成盒子的xmin，ymin，xmax，ymax形式。
    """
    return np.concatenate((boxes[:, :2] - boxes[:, 2:]/2,     # xmin, ymin
                     boxes[:, :2] + boxes[:, 2:]/2), 1)  # xmax, ymax

def center_size(boxes):
    """ Convert prior_boxes to (cx, cy, w, h)
    representation for comparison to center-size form ground truth data.
    Args:
        boxes: (tensor) point_form boxes
    Return:
        boxes: (tensor) Converted xmin, ymin, xmax, ymax form of boxes.
    """
    return np.concatenate(((boxes[:, 2:] + boxes[:, :2])/2, boxes[:, 2:] - boxes[:, :2]), 1) # cx, cy # w, h

def intersect(box_a, box_b):
    """ We resize both tensors to [A,B,2] without new malloc:
    [A,2] -> [A,1,2] -> [A,B,2]
    [B,2] -> [1,B,2] -> [A,B,2]
    Then we compute the area of intersect between box_a and box_b.
    Args:
      box_a: (tensor) bounding boxes, Shape: [A,4].
      box_b: (tensor) bounding boxes, Shape: [B,4].
    Return:
      (tensor) intersection area, Shape: [A,B].
      将以前的方框转换为（cx，cy，w，h）
	用于与地面真值数据中心大小进行比较的表示。
	参数：
	方块：（张量）点式方块
	返回：
	box:（张量）转换成xmin，ymin，xmax，ymax形式的box
    """
    box_a = box_a.cpu()
    box_b = box_b.cpu()
    A = box_a.size(0)
    B = box_b.size(0)
    max_xy = np.min(box_a[:, 2:].unsqueeze(1).expand(A, B, 2),
                       box_b[:, 2:].unsqueeze(0).expand(A, B, 2))
    min_xy = np.max(box_a[:, :2].unsqueeze(1).expand(A, B, 2),
                       box_b[:, :2].unsqueeze(0).expand(A, B, 2))
    inter = np.clip((max_xy - min_xy), min=0)
    return inter[:, :, 0] * inter[:, :, 1]

def jaccard(box_a, box_b):
    """Compute the jaccard overlap of two sets of boxes.  The jaccard overlap
    is simply the intersection over union of two boxes.  Here we operate on
    ground truth boxes and default boxes.
    E.g.:
        A ∩ B / A ∪ B = A ∩ B / (area(A) + area(B) - A ∩ B)
    Args:
        box_a: (tensor) Ground truth bounding boxes, Shape: [num_objects,4]
        box_b: (tensor) Prior boxes from priorbox layers, Shape: [num_priors,4]
    Return:
        jaccard overlap: (tensor) Shape: [box_a.size(0), box_b.size(0)]
 	计算两组盒子的重叠相似系数。

重叠相似只是两个框的并集上的交集。

在这里，我们操作地面真相框和默认框。

例如。：

A∩B/A∪B=A∩B/（面积（A）+面积（B）-A∩B）

参数：

box_a:（张量）地面真值边界框，形状：[num_aobjects，4]

box_b:（张量）来自priorbox层的先前盒，形状：[num_priors，4]

返回：

重叠相似：（张量）形状：[框a.尺寸（0），框b.尺寸（0）]
    """
    inter = intersect(box_a, box_b)
    area_a = ((box_a[:, 2]-box_a[:, 0]) *
              (box_a[:, 3]-box_a[:, 1])).unsqueeze(1).expand_as(inter)  # [A,B]
    area_b = ((box_b[:, 2]-box_b[:, 0]) *
              (box_b[:, 3]-box_b[:, 1])).unsqueeze(0).expand_as(inter)  # [A,B]
    union = area_a + area_b - inter
    return inter / union  # [A,B]

def matrix_iou(a, b):
    """
    return iou of a and b, numpy version for data augenmentation
    返回a和b的iou，numpy版本进行数据补充
    """
    lt = np.maximum(a[:, np.newaxis, :2], b[:, :2])
    rb = np.minimum(a[:, np.newaxis, 2:], b[:, 2:])

    area_i = (np.prod(rb - lt, axis=2) * (lt < rb)).all(axis=2)
    area_a = np.prod(a[:, 2:] - a[:, :2], axis=1)
    area_b = np.prod(b[:, 2:] - b[:, :2], axis=1)
    return area_i / (area_a[:, np.newaxis] + area_b - area_i)

def matrix_iof(a, b):
    """
    matrix_iof 的意思是裁剪后的roi除以boxes,有全覆盖的则留下。
    return iof of a and b, numpy version for data augenmentation
    返回a和b的iof，numpy版本进行数据补充
    """
    lt = np.maximum(a[:, np.newaxis, :2], b[:, :2])#x1 y1 最大值
    rb = np.minimum(a[:, np.newaxis, 2:], b[:, 2:])# x2 y2 最小值

    area_i = (np.prod(rb - lt, axis=2) * (lt < rb)).all(axis=2)#连乘 即面积
    area_a = np.prod(a[:, 2:] - a[:, :2], axis=1)
    return area_i / np.maximum(area_a[:, np.newaxis], 1)

def match(threshold, truths, priors, variances, labels, landms, loc_t, conf_t, landm_t, idx):
    """Match each prior box with the ground truth box of the highest jaccard
    overlap, encode the bounding boxes, then return the matched indices
    corresponding to both confidence and location preds.
    Args:
        threshold: (float) The overlap threshold used when mathing boxes.
        truths: (tensor) Ground truth boxes, Shape: [num_obj, 4].
        priors: (tensor) Prior boxes from priorbox layers, Shape: [n_priors,4].
        variances: (tensor) Variances corresponding to each prior coord,
            Shape: [num_priors, 4].
        labels: (tensor) All the class labels for the image, Shape: [num_obj].
        landms: (tensor) Ground truth landms, Shape [num_obj, 10].
        loc_t: (tensor) Tensor to be filled w/ endcoded location targets.
        conf_t: (tensor) Tensor to be filled w/ matched indices for conf preds.
        landm_t: (tensor) Tensor to be filled w/ endcoded landm targets.
        idx: (int) current batch index
    Return:
        The matched indices corresponding to 1)location 2)confidence 3)landm preds.
    """
    # jaccard index
    # # 第1步,计算IOU
    overlaps = jaccard(
        truths,
        point_form(priors)
    )
    # (Bipartite Matching)
    # [1,num_objects] best prior for each ground truth
    # 第2步,为每个真实框匹配一个IOU最大的锚点框,GT框->锚点框
    # best_prior_overlap为每个真实框的最大IOU值,shape[num_objects,1]
    # best_prior_idx为对应的最大IOU的先验锚点框的Index,其元素值的范围为[0,num_priors]
    best_prior_overlap, best_prior_idx = overlaps.max(1, keepdim=True)

    # ignore hard gt
    valid_gt_idx = best_prior_overlap[:, 0] >= 0.2
    best_prior_idx_filter = best_prior_idx[valid_gt_idx, :]
    if best_prior_idx_filter.shape[0] <= 0:
        loc_t[idx] = 0
        conf_t[idx] = 0
        return

    # [1,num_priors] best ground truth for each prior
    # 第3步,若先验锚点框与GT框的IOU>阈值,也将这些锚点框匹配上,锚点框->GT框
    # best_truth_overlap为每个先验锚点框对应其中一个真实框的最大IOU,shape[1,num_priors]
    # best_truth_idx为每个先验锚点框对应的真实框的index,其元素值的范围为[0,num_objects]

    best_truth_overlap, best_truth_idx = overlaps.max(0, keepdim=True)
    best_truth_idx.squeeze_(0)
    best_truth_overlap.squeeze_(0)
    best_prior_idx.squeeze_(1)
    best_prior_idx_filter.squeeze_(1)
    best_prior_overlap.squeeze_(1)
    # 第4步
    # index_fill_(self, dim: _int, index: Tensor, value: Number)对第dim行的index使用value进行填充
    # best_truth_overlap为第一步匹配的结果,需要使用到,使用best_prior_idx是第二步的结果,也是需要使用上的
    # 所以在best_truth_overlap上进行填充,表明选出来的正例
    # 使用2进行填充,是因为,IOU值的范围是[0,1],只要使用大于1的值填充,就表明肯定能被选出来
    best_truth_overlap.index_fill_(0, best_prior_idx_filter, 2)  # ensure best prior
    # TODO refactor: index  best_prior_idx with long tensor
    # ensure every gt matches with its prior of max overlap
    # 确保每个GT框都能匹配上最大IOU的先验锚点框
    # 得到每个先验锚点框都能有一个匹配上的数字
    # best_prior_idx的元素值的范围是[0,num_priors],长度为num_objects
    for j in range(best_prior_idx.size(0)):     # 判别此anchor是预测哪一个boxes
        best_truth_idx[best_prior_idx[j]] = j
    #box
    matches = truths[best_truth_idx]            # 取出最佳匹配的GT框,Shape: [num_priors,4]
    conf = labels[best_truth_idx]                # Shape: [num_priors],0为背景,
    conf[best_truth_overlap < threshold] = 0     # 置信度小于阈值的label设置为0
    loc = encode(matches, priors, variances)    # 进行位置编码

    #landm
    matches_landm = landms[best_truth_idx]      # 取出最佳匹配的landm
    landm = encode_landm(matches_landm, priors, variances)# 进行位置编码
    loc_t[idx] = loc    # [num_priors,4] encoded offsets to learn应该学习的编码偏差
    conf_t[idx] = conf  # [num_priors] top class label for each prior每个锚点框的label
    landm_t[idx] = landm #应该学习的编码偏差

def encode(matched, priors, variances):
    """Encode the variances from the priorbox layers into the ground truth boxes
    we have matched (based on jaccard overlap) with the prior boxes.
    Args:
        matched: (tensor) Coords of ground truth for each prior in point-form
            Shape: [num_priors, 4].
        priors: (tensor) Prior boxes in center-offset form
            Shape: [num_priors,4].
        variances: (list[float]) Variances of priorboxes
    Return:
        encoded boxes (tensor), Shape: [num_priors, 4]
        对坐标进行编码
        利用GT框和先验锚点框,计算偏差,用于回归
    """

    # dist b/t match center and prior's center
    g_cxcy = (matched[:, :2] + matched[:, 2:])/2 - priors[:, :2] # 计算GT框与锚点框中心点的距离
    # encode variance
    g_cxcy /= (variances[0] * priors[:, 2:])
    # match wh / prior wh
    g_wh = (matched[:, 2:] - matched[:, :2]) / priors[:, 2:]
    g_wh = np.log(g_wh) / variances[1]
    # return target for smooth_l1_loss
    return np.concatenate([g_cxcy, g_wh], 1)  # [num_priors,4]

def encode_landm(matched, priors, variances):

    """Encode the variances from the priorbox layers into the ground truth boxes
    we have matched (based on jaccard overlap) with the prior boxes.
    Args:
        matched: (tensor) Coords of ground truth for each prior in point-form
            Shape: [num_priors, 10].
        priors: (tensor) Prior boxes in center-offset form
            Shape: [num_priors,4].
        variances: (list[float]) Variances of priorboxes
    Return:
        encoded landm (tensor), Shape: [num_priors, 10]
    对landm坐标进行编码
    """

    # dist b/t match center and prior's center
    matched = np.reshape(matched, (matched.size(0), 5, 2))
    priors_cx = priors[:, 0].unsqueeze(1).expand(matched.size(0), 5).unsqueeze(2)
    priors_cy = priors[:, 1].unsqueeze(1).expand(matched.size(0), 5).unsqueeze(2)
    priors_w = priors[:, 2].unsqueeze(1).expand(matched.size(0), 5).unsqueeze(2)
    priors_h = priors[:, 3].unsqueeze(1).expand(matched.size(0), 5).unsqueeze(2)
    priors = np.concatenate([priors_cx, priors_cy, priors_w, priors_h], 2)
    g_cxcy = matched[:, :, :2] - priors[:, :, :2]
    # encode variance
    g_cxcy /= (variances[0] * priors[:, :, 2:])
    # g_cxcy /= priors[:, :, 2:]
    g_cxcy = g_cxcy.reshape(g_cxcy.size(0), -1)
    # return target for smooth_l1_loss
    return g_cxcy

# Adapted from https://github.com/Hakuyume/chainer-ssd
def decode_in_numpy(loc, priors, variances):
    """Decode locations from predictions using priors to undo
    the encoding we did for offset regression at train time.
    Args:
        loc (tensor): location predictions for loc layers,
            Shape: [num_priors,4]网络预测的锚点框偏差信息
        priors (tensor): Prior boxes in center-offset form.
            Shape: [num_priors,4].先验锚点框
        variances: (list[float]) Variances of priorboxes预测框的坐标
    Return:
        decoded bounding box predictions
    对编码的坐标进行解码,返回预测框的坐标
    """
    # [中心点x,中心点y,宽,高]
    boxes = np.concatenate((
        priors[:, :2] + loc[:, :2] * variances[0] * priors[:, 2:],
        priors[:, 2:] * np.exp(loc[:, 2:] * variances[1])), 1)

    boxes[:, :2] -= boxes[:, 2:] / 2 # xmin,ymin
    boxes[:, 2:] += boxes[:, :2] # xmax,ymax
    return boxes

def decode_landm_in_numpy(pre, priors, variances):
    """Decode landm from predictions using priors to undo
    the encoding we did for offset regression at train time.
    Args:
        pre (tensor): landm predictions for loc layers,
            Shape: [num_priors,10]
        priors (tensor): Prior boxes in center-offset form.
            Shape: [num_priors,4].
        variances: (list[float]) Variances of priorboxes
    Return:
        decoded landm predictions
    """
    landms = np.concatenate((priors[:, :2] + pre[:, :2] * variances[0] * priors[:, 2:],
                        priors[:, :2] + pre[:, 2:4] * variances[0] * priors[:, 2:],
                        priors[:, :2] + pre[:, 4:6] * variances[0] * priors[:, 2:],
                        priors[:, :2] + pre[:, 6:8] * variances[0] * priors[:, 2:],
                        priors[:, :2] + pre[:, 8:10] * variances[0] * priors[:, 2:],
                        ), axis=1)#五个特征点
    return landms
def log_sum_exp(x):
    """Utility function for computing log_sum_exp while determining
    This will be used to determine unaveraged confidence loss across
    all examples in a batch.
    Args:
        x (Variable(tensor)): conf_preds from conf layers
    确定时用于计算的实用函数（log_sum_exp）

这将用于确定批处理中所有示例的不可用信心损失。

参数：

x（变量（张量）：来自conf层的conf preds
    """
    x_max = x.data.max()
    return np.log(np.sum(np.exp(x-x_max), 1, keepdims=True)) + x_max


def shift_img(img,dx,dy,fill_with =0):
    '''
    平移图片
    :param img: 需要操作的图片
    :param dx: 向右平移多少
    :param dy: 向下平移多少
    :param fill_with: 多的部分用什么填充
    :return:img 操作之后的图片
    '''
    M = np.array([[1,0,dx],[0,1,dy]])
    shifted = cv2.warpAffine(img, M, (img.shape[1], img.shape[0]))
    return shifted

def rotate_img(img,angle,circle):
    '''
    旋转图片
    :param img:需要操作的图片
    :param angle: 旋转角度
    :param circle: 旋转圆心
    :return: 操作之后的图片
    '''
    M = cv2.getRotationMatrix2D((circle[0], circle[1]), angle, 1)
    rotate = cv2.warpAffine(img, M, (img.shape[1], img.shape[0]))
    return rotate