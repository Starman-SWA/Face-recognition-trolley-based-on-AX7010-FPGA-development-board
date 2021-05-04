from itertools import product as product
import numpy as np
from math import ceil

#生成先验框
class PriorBox_in_numpy(object):
    def __init__(self, cfg, image_size=None, phase='train',test_size=[]):
        super(PriorBox_in_numpy, self).__init__()
        self.min_sizes = cfg['min_sizes']
        self.steps = cfg['steps']
        self.clip = cfg['clip']
        self.image_size = image_size
        if len(test_size) == 0:
            self.feature_maps = [[ceil(self.image_size[0]/step), ceil(self.image_size[1]/step)] for step in self.steps]
        else:
            self.feature_maps = test_size
        self.name = "s"

    # 遍历多尺度的 特征图
    def forward(self):
        anchors = []
        for k, f in enumerate(self.feature_maps):
            min_sizes = self.min_sizes[k]
            # 遍历每个像素
            for i, j in product(range(f[0]), range(f[1])):
                for min_size in min_sizes:
                    # feature map 大小
                    s_kx = min_size / self.image_size[1]
                    s_ky = min_size / self.image_size[0]
                     # 每个框的中心坐标
                    dense_cx = [x * self.steps[k] / self.image_size[1] for x in [j + 0.5]]
                    dense_cy = [y * self.steps[k] / self.image_size[0] for y in [i + 0.5]]

                    for cy, cx in product(dense_cy, dense_cx):
                        anchors += [cx, cy, s_kx, s_ky]
        # back to torch land
        # 转化为 torch的Tensor
        output = np.array(anchors).astype(np.float64).reshape(-1, 4)
        # 归一化，把输出设置在 [0,1]
        if self.clip:
            output = np.clip(output, max=1, min=0)
        return output
