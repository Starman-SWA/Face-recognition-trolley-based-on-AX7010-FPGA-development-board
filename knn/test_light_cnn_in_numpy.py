import os
import numpy as np
import cv2

from module.lightCNN_model_in_numpy import LightCNN9_in_numpy

def get_net(path):
    '''
    be used to get class net
    :param para:
    :return:
    '''
    print('Loading network...')
    cfg = np.load(path, allow_pickle=True)
    cfg = cfg.item()
    net = LightCNN9_in_numpy(cfg)
    return net

def get_feature(net, data,length2=0):
    data = net(data)
    data = data.reshape(-1, data.shape[0], data.shape[1])
    return data

if __name__ == '__main__':
    get_net()