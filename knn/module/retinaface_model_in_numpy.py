# -*- coding:utf-8 -*-
import numpy as np
from utils.torch_nn_in_numpy import *
#from collections import OrderedDict

class FPN(object):
    def __init__(self,cfg):
        leaky = 0
        super(FPN, self).__init__()
        self.output1 = Conv_bn_in_numpy(cfg["output1"], leaky=leaky)
        self.output2 = Conv_bn_in_numpy(cfg["output2"], leaky=leaky)
        self.output3 = Conv_bn_in_numpy(cfg["output3"], leaky=leaky)
        self.merge1 = Conv_bn_in_numpy(cfg["merge1"],stride=1,padding=1,leaky=leaky)
        self.merge2 = Conv_bn_in_numpy(cfg["merge2"], stride=1, padding=1,leaky=leaky)
        
    def __call__(self,input):
        input = list(input.values())
        output1 = self.output1(input[0])
        output2 = self.output2(input[1])
        output3 = self.output3(input[2])

        up_3t2 = interpolate_in_numpy(output3,size = [output2.shape[2],output2.shape[3]])
        output2 = self.merge2(output2+up_3t2)

        up_2t1 = interpolate_in_numpy(output2, size=[output1.shape[2], output1.shape[3]])
        output1 = self.merge1(output1 + up_2t1)

        return [output1,output2,output3]

class SSH(object):
    def __init__(self,cfg):
        super(SSH, self).__init__()
        leaky = 0
        self.conv3_3 = Conv_bn_no_relu_in_numpy(cfg["conv3_3"], stride=1, padding=1)
        self.conv5_5 = Conv_bn_in_numpy(cfg["conv5_5"], stride=1, padding=2,leaky=leaky)
        self.conv5_5_2 = Conv_bn_no_relu_in_numpy(cfg["conv5_5_2"], stride=1, padding=2)
        self.conv7_7 = Conv_bn_in_numpy(cfg["conv7_7"], stride=1, padding=3,leaky=leaky)
        self.conv7_7_2 = Conv_bn_no_relu_in_numpy(cfg["conv7_7_2"], stride=1, padding=3)

    def __call__(self,input):
        conv3_3 = self.conv3_3(input)

        conv5_5 = self.conv5_5(input)
        conv5_5_1 = self.conv5_5_2(conv5_5)

        conv7_7 = self.conv7_7(input)
        conv7_7_1 = self.conv7_7_2(conv7_7)

        out = np.concatenate([conv3_3,conv5_5_1,conv7_7_1],axis=1)
        out = np.maximum(out, 0)
        return out

class MobileNetV1(object):
    def __init__(self, cfg):
        super(MobileNetV1, self).__init__()
        self.stage1 = []
        self.stage1.append(Conv_bn_in_numpy(cfg["stage1.0"], stride=2, leaky=0.1))
        self.stage1.append(conv_dw_in_numpy(cfg["stage1.1"], stride=1, groups=8))
        self.stage1.append(conv_dw_in_numpy(cfg["stage1.2"], stride=2, groups=16))
        self.stage1.append(conv_dw_in_numpy(cfg["stage1.3"], stride=1, groups=32))
        self.stage1.append(conv_dw_in_numpy(cfg["stage1.4"], stride=2, groups=32))
        self.stage1.append(conv_dw_in_numpy(cfg["stage1.5"], stride=1, groups=64))

        self.stage2 = []
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.0"], stride=2, groups=64))
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.1"], stride=1, groups=128))
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.2"], stride=1, groups=128))
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.3"], stride=1, groups=128))
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.4"], stride=1, groups=128))
        self.stage2.append(conv_dw_in_numpy(cfg["stage2.5"], stride=1, groups=128))

        self.stage3 = []
        self.stage3.append(conv_dw_in_numpy(cfg["stage3.0"], stride=2,groups=128))
        self.stage3.append(conv_dw_in_numpy(cfg["stage3.1"], stride=1, groups=256))

    def __call__(self, x):
        out = {}
        for model in self.stage1:
            x = model(x)
        out['stage1'] = x
        for model in self.stage2:
            x = model(x)
        out['stage2'] = x
        for model in self.stage3:
            x = model(x)
        out['stage3'] = x
        return out

class ClassHead(object):
    def __init__(self,cfg):
        super(ClassHead, self).__init__()
        self.conv1_1 = Conv2d_in_numpy(cfg["weight"], cfg["bias"],padding=0)

    def __call__(self,x):
        out = self.conv1_1(x)
        out = np.transpose(out, (0, 2, 3, 1)).copy()
        return out.reshape((out.shape[0], -1, 2))

class BboxHead(object):
    def __init__(self,cfg):
        super(BboxHead, self).__init__()
        self.conv1_1 = Conv2d_in_numpy(cfg["weight"], cfg["bias"],padding=0)

    def __call__(self,x):
        out = self.conv1_1(x)
        out = np.transpose(out, (0, 2, 3, 1)).copy()
        return out.reshape((out.shape[0], -1, 4))

class LandmarkHead(object):
    def __init__(self, cfg):
        super(LandmarkHead, self).__init__()
        self.conv1_1 = Conv2d_in_numpy(cfg["weight"], cfg["bias"],padding=0)

    def __call__(self,x):
        out = self.conv1_1(x)
        out = np.transpose(out, (0, 2, 3, 1)).copy()
        return out.reshape((out.shape[0], -1, 10))

class make_class_head(object):
    def __init__(self, cfg):
        super(make_class_head, self).__init__()
        self.class1 = ClassHead(cfg["0"])
        self.class2 = ClassHead(cfg["1"])
        self.class3 = ClassHead(cfg["2"])

    def __call__(self,input):
        out1 = self.class1(input[0])
        out2 = self.class2(input[1])
        out3 = self.class3(input[2])
        out = np.concatenate([out1, out2, out3], axis=1)
        return out

class make_bbox_head(object):
    def __init__(self, cfg):
        super(make_bbox_head, self).__init__()
        self.class1 = BboxHead(cfg["0"])
        self.class2 = BboxHead(cfg["1"])
        self.class3 = BboxHead(cfg["2"])

    def __call__(self,input):
        out1 = self.class1(input[0])
        out2 = self.class2(input[1])
        out3 = self.class3(input[2])
        out = np.concatenate([out1, out2, out3],axis=1)
        return out
class make_landmark_head(object):
    def __init__(self, cfg):
        super(make_landmark_head, self).__init__()
        self.class1 = LandmarkHead(cfg["0"])
        self.class2 = LandmarkHead(cfg["1"])
        self.class3 = LandmarkHead(cfg["2"])

    def __call__(self,input):
        out1 = self.class1(input[0])
        out2 = self.class2(input[1])
        out3 = self.class3(input[2])
        out = np.concatenate([out1, out2, out3], axis=1)
        return out

class RetinaFace(object):
    def __init__(self,cfg = None,if_training = True):
        super(RetinaFace, self).__init__()
        self.if_training = if_training
        #backbone = None
        #if cfg['name'] == 'mobilenet0.25':
        #backbone = MobileNetV1()
        #if cfg['pretrain']:
        #    cheakpoing = torch.load("./11.pth")
        #    new_state_dict = OrderedDict()
        #    for k,v in cheakpoing['state_dict'].items():
        #        name = k[7:]
        #        new_state_dict[name] = v
        #    backbone.load_state_dict(new_state_dict)
        # elif cfg['name'] == 'Resnet50':
        #    backbone = models.resnet50(pretrained=cfg['pretrain'])
        self.bottom_to_top = MobileNetV1(cfg["bottom_to_top"]) #_utils.IntermediateLayerGetter(backbone,cfg['return_layers'])

        in_channels_stage2 = 32
        in_channels_list = [in_channels_stage2*2,
                            in_channels_stage2*4,
                            in_channels_stage2*8]
        out_channels = 64
        self.fpn = FPN(cfg["fpn"])


        self.ssh1 = SSH(cfg["ssh1"])
        self.ssh2 = SSH(cfg["ssh2"])
        self.ssh3 = SSH(cfg["ssh3"])

        self.ClassHead = make_class_head(cfg["ClassHead"])
        self.BboxHead = make_bbox_head(cfg["BboxHead"])
        self.LandmarkHead = make_landmark_head(cfg["LandmarkHead"])

    def __call__(self, inputs):
        out = self.bottom_to_top(inputs)
        test_size = [[i.shape[2],i.shape[3]] for i in out.values()]
        # FPN
        fpn = self.fpn(out)

        # SSH
        feature1 = self.ssh1(fpn[0])
        feature2 = self.ssh2(fpn[1])
        feature3 = self.ssh3(fpn[2])

        features = [feature1, feature2, feature3]

        bbox_regressions = self.BboxHead(features)
        classifications = self.ClassHead(features)
        ldm_regressions = self.LandmarkHead(features)

        output = (bbox_regressions, softmax_in_numpy(classifications, dim=-1), ldm_regressions,test_size)
        return output
