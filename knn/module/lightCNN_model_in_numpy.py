import numpy as np
from utils.torch_nn_in_numpy import *

class MFM(object):
    def __init__(self,type,weight, bias, stride=1,padding=1):
        super(MFM, self).__init__()
        if type == 1:
            self.layer = Conv2d_in_numpy(weight, bias, stride=stride,padding=padding)
        else:
            self.layer = Linear_in_numpy(weight, bias)

    def __call__(self, x):
        x = self.layer(x)
        x1,x2 = np.split(x, 2, 1)
        return np.maximum(x1,x2)

class LightCNN9_in_numpy(object):
    def __init__(self,cfg):
        super(LightCNN9_in_numpy, self).__init__()
        self.MFM0 = MFM(1, cfg['weight0'], cfg['bias0'], 1, 2)
        self.MaxPool2d1 = MaxPool2d_in_numpy(2)
        self.MFM2 = MFM(1, cfg['weight1'], cfg['bias1'], 1, 0)
        self.MFM3 = MFM(1, cfg['weight2'], cfg['bias2'], 1, 1)
        self.MaxPool2d4 = MaxPool2d_in_numpy(2)
        self.MFM5 = MFM(1, cfg['weight3'], cfg['bias3'], 1, 0)
        self.MFM6 = MFM(1, cfg['weight4'], cfg['bias4'], 1, 1)
        self.MaxPool2d7 = MaxPool2d_in_numpy(2)
        self.MFM8 = MFM(1, cfg['weight5'], cfg['bias5'], 1, 0)
        self.MFM9 = MFM(1, cfg['weight6'], cfg['bias6'], 1, 1)
        self.MFM10 = MFM(1, cfg['weight7'], cfg['bias7'], 1, 0)
        self.MFM11 = MFM(1, cfg['weight8'], cfg['bias8'], 1, 1)
        self.MaxPool2d12 = MaxPool2d_in_numpy(2)
        self.MFM13 = MFM(0, cfg['weight9'], cfg['bias9'])

    def __call__(self, x):
        x = self.MFM0(x)
        x = self.MaxPool2d1(x)
        x = self.MFM2(x)
        x = self.MFM3(x)
        x = self.MaxPool2d4(x)
        x = self.MFM5(x)
        x = self.MFM6(x)
        x = self.MaxPool2d7(x)
        x = self.MFM8(x)
        x = self.MFM9(x)
        x = self.MFM10(x)
        x = self.MFM11(x)
        x = self.MaxPool2d12(x)
        x = x.reshape([1,-1])
        x = self.MFM13(x)
        return x

if __name__ == '__main__':
    print('Loading network...')
    cfg = np.load("G:\pycharmproject\Face_Recognition\data\lightCNN_pretrain0.npy", allow_pickle=True)
    cfg = cfg.item()
    net = LightCNN9_in_numpy(cfg)
    data = np.arange(37632).reshape([-1, 3, 112, 112])
    data = net(data)
    data = data.reshape(-1, data.shape[0], data.shape[1])