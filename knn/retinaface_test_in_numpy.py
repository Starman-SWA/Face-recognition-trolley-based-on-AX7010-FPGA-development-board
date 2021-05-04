from __future__ import print_function
import os
import argparse
import numpy as np
from module.retinaface_function_in_numpy import PriorBox_in_numpy
from utils.retinaface_tool_in_numpy import py_cpu_nms_in_numpy, decode_in_numpy, decode_landm_in_numpy
import cv2
from module.retinaface_model_in_numpy import RetinaFace
from hyperparams import Hyperparams


def get_retinaface_net():
    '''
        be used to get class net
        :param para:
        :return:
        '''
    print('Loading network...')
    cfg = np.load("E:/py_file/temFace/temFace/data/retinate.npy", allow_pickle=True)
    cfg = cfg.item()
    # print(cfg)
    net = RetinaFace(cfg)
    return net

def face_detection(net,img_raw):
    cfg = Hyperparams().cfg_mnet
    img = np.float32(img_raw)
    # testing scale
    target_size = 1600
    max_size = 2150
    im_shape = img.shape
    im_size_min = np.min(im_shape[0:2])
    im_size_max = np.max(im_shape[0:2])
    resize = float(target_size) / float(im_size_min)
    # prevent bigger axis from being more than max_size:防止超过最大尺寸
    if np.round(resize * im_size_max) > max_size:
        resize = float(max_size) / float(im_size_max)
    if True:
        resize = 1
    if resize != 1:
        img = cv2.resize(img, None, None, fx=resize, fy=resize, interpolation=cv2.INTER_LINEAR)
    im_height, im_width, _ = img.shape
    scale = np.array([img.shape[1], img.shape[0], img.shape[1], img.shape[0]]).astype(np.float64)

    img -= (104, 117, 123)  # 单通道
    img = img.transpose(2, 0, 1)  # 转置
    img = np.expand_dims(img,0)

    loc, conf, landms, test_size = net(img)
    # 面框
    priorbox = PriorBox_in_numpy(cfg, image_size=(im_height, im_width), test_size=test_size)
    priors = priorbox.forward()

    #prior_data = priors.data
    prior_data = priors

    boxes = decode_in_numpy(loc.squeeze(0), prior_data, cfg['variance'])
    boxes = boxes * scale / resize

    scores = conf.squeeze(0)[:, 1]
    landms = decode_landm_in_numpy(landms.squeeze(0), prior_data, cfg['variance'])
    scale1 = np.array([img.shape[3], img.shape[2], img.shape[3], img.shape[2],
                           img.shape[3], img.shape[2], img.shape[3], img.shape[2],
                           img.shape[3], img.shape[2]]).astype(np.float64)
    landms = landms * scale1 / resize

    # ignore low scores
    inds = np.where(scores > 0.02)[0]
    boxes = boxes[inds]
    landms = landms[inds]
    scores = scores[inds]

    # keep top-K before NMS
    order = scores.argsort()[::-1]  # 返回的是从小到大排序的索引
    #if len(order) > 10:
    #    order = order[:10]
    # order = scores.argsort()[::-1][:args.top_k]
    boxes = boxes[order]
    landms = landms[order]
    scores = scores[order]

    # do NMS
    dets = np.hstack((boxes, scores[:, np.newaxis])).astype(np.float32, copy=False)
    #print("pre:{}".format(dets.shape))
    keep = py_cpu_nms_in_numpy(dets, 0.4)
    # keep = nms(dets, args.nms_threshold,force_cpu=args.cpu)
    dets = dets[keep, :]
    #print("back:{}".format(dets.shape))
    landms = landms[keep]

    # keep top-K faster NMS
    # dets = dets[:args.keep_top_k, :]
    # landms = landms[:args.keep_top_k, :]

    dets = np.concatenate((dets, landms), axis=1)  # 连接
    faces = []
    for b in dets:
        if b[4] < 0.5:
            continue
        # text = "{:.4f}".format(b[4])
        b = list(map(int, b))
        #cv2.rectangle(img_raw, (b[0], b[1]), (b[2], b[3]), (0, 0, 255), 2)
        faces.append(b)
    #print("facesnum:{}".format(len(faces)))
    return faces

if __name__ == '__main__':
   get_retinaface_net()