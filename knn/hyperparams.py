
# coding: utf-8

# In[ ]:


#!/usr/bin/env python

import math
class Hyperparams(object):
    '''Hyperparameters'''
    def __init__(self):

        # data
        self.source_train = 'corpora/train.tags.de-en.de'
        self.target_train = 'corpora/train.tags.de-en.en'
        self.source_test = 'corpora/IWSLT16.TED.tst2014.de-en.de.xml'
        self.target_test = 'corpora/IWSLT16.TED.tst2014.de-en.en.xml'
        self.trains_batch = 2000

        # training
        self.batch_size = 32  # alias = N
        self.eval_size = 12
        self.LR = 1e-5
        self.epoch = 5
        #self.lr = 0.0001  # learning rate. In paper, learning rate is adjusted to the global step.
        logdir = 'logdir'  # log directory
        self.save_path = "model_save/"

        # img
        self.img_size = (112,112)  # 用来检测的图像的默认大小
        self.eye_site = [0.33,0.42]  # 用于对齐数据
        self.eye_width = 0.7

        self.cfg_mnet = {
                'name': 'mobilenet0.25',
                'min_sizes': [[16, 32], [64, 128], [256, 512]],
                'steps': [8, 16, 32],  ##步幅与论文中有所不同
                'variance': [0.1, 0.2],  ##方差
                'clip': False,  ##梯度消失和梯度爆炸
                'loc_weight': 2.0,
                'gpu_train': True,
                'batch_size': 16,  # 批大小
                'ngpu': 1,
                'epoch': 20,  # 单次epoch的迭代次数减少，提高运行速度。（单次epoch=(全部训练样本/batchsize)/iteration=1）
                'decay1': 15,
                'decay2': 18,  # 衰变
                'image_size': 640,
                'pretrain': False,
                'return_layers': {'stage1': 1, 'stage2': 2, 'stage3': 3},
                'in_channel': 32,  # 输入通道
                'out_channel': 64  # 输出通道
            }

        self.cfg_re50 = {
                'name': 'Resnet50',
                'min_sizes': [[16, 32], [64, 128], [256, 512]],
                'steps': [8, 16, 32],
                'variance': [0.1, 0.2],
                'clip': False,
                'loc_weight': 2.0,
                'gpu_train': True,
                'batch_size': 24,
                'ngpu': 4,
                'epoch': 100,
                'decay1': 70,
                'decay2': 90,
                'image_size': 840,
                'pretrain': True,
                'return_layers': {'layer2': 1, 'layer3': 2, 'layer4': 3},
                'in_channel': 256,
                'out_channel': 256
            }

        self.cfg_light_cnn9 = {
            'name': 'light_cnn9',
            'min_sizes': [[16, 32], [64, 128], [256, 512]],
            'steps': [8, 16, 32],  ##步幅与论文中有所不同
            'variance': [0.1, 0.2],  ##方差
            'clip': False,  ##梯度消失和梯度爆炸
            'loc_weight': 2.0,
            'gpu_train': True,
            'batch_size': 64,  # 批大小
            'ngpu': 1,
            'epoch': 20,  # 单次epoch的迭代次数减少，提高运行速度。（单次epoch=(全部训练样本/batchsize)/iteration=1）
            'decay1': 15,
            'decay2': 18,  # 衰变
            'image_size': [112,112],
            'pretrain': False,
            'in_channel': 3,  # 输入通道
            'out_channel': 64,  # 输出通道
            'num_classes':4998  # 标签类别总数 max:85164 3804847
        }

        self.cfg_light_cnn9_tem_train = {
            'name': 'light_cnn9',
            'min_sizes': [[16, 32], [64, 128], [256, 512]],
            'steps': [8, 16, 32],  ##步幅与论文中有所不同
            'variance': [0.1, 0.2],  ##方差
            'clip': False,  ##梯度消失和梯度爆炸
            'loc_weight': 2.0,
            'gpu_train': True,
            'batch_size': 32,  # 批大小
            'ngpu': 1,
            'epoch': 20,  # 单次epoch的迭代次数减少，提高运行速度。（单次epoch=(全部训练样本/batchsize)/iteration=1）
            'decay1': 15,
            'decay2': 18,  # 衰变
            'image_size': self.img_size,
            'pretrain': False,
            'in_channel': 3,  # 输入通道
            'out_channel': 64,  # 输出通道
            'num_classes': 1  # 标签类别总数 max:85164 3804847
        }

    def get_lr(self, epoch):
        # if (epoch+1) % 10 == 0 and self.LR > 1e-4:
        #     self.LR*=0.1
        # print("epoch {}: learning rate {}".format(epoch, self.LR))
        return self.LR * math.pow(0.5, epoch)

