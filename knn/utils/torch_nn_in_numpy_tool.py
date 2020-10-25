import numpy as np
import torch

def pth_to_npy(pthPath, npyPath):
    # Load
    state_dict = torch.load(pthPath)
    new_state_dict = {}
    for kkk in state_dict.keys():
        print(kkk)
    for k, v in state_dict.items():
        if k == "SE.0.layer.weight":
            name = "weight0"
        elif k == "SE.0.layer.bias":
            name = "bias0"
        elif k == "SE.2.0.layer.weight":
            name = "weight1"
        elif k == "SE.2.0.layer.bias":
            name = "bias1"
        elif k == "SE.2.1.layer.weight":
            name = "weight2"
        elif k == "SE.2.1.layer.bias":
            name = "bias2"
        elif k == "SE.4.0.layer.weight":
            name = "weight3"
        elif k == "SE.4.0.layer.bias":
            name = "bias3"
        elif k == "SE.4.1.layer.weight":
            name = "weight4"
        elif k == "SE.4.1.layer.bias":
            name = "bias4"
        elif k == "SE.6.0.layer.weight":
            name = "weight5"
        elif k == "SE.6.0.layer.bias":
            name = "bias5"
        elif k == "SE.6.1.layer.weight":
            name = "weight6"
        elif k == "SE.6.1.layer.bias":
            name = "bias6"
        elif k == "SE.7.0.layer.weight":
            name = "weight7"
        elif k == "SE.7.0.layer.bias":
            name = "bias7"
        elif k == "SE.7.1.layer.weight":
            name = "weight8"
        elif k == "SE.7.1.layer.bias":
            name = "bias8"
        elif k == "lastMFM.layer.weight":
            name = "weight9"
        elif k == "lastMFM.layer.bias":
            name = "bias9"
        else:
            continue
        new_state_dict[name] = v.cpu().numpy()
    # Save
    np.save(npyPath, new_state_dict)

if __name__ == '__main__':
    pthPath = "G:/pycharmproject/Face_Recognition/lightcnn_model_save/light_cnn9_epoch_4998_19.pth"
    npyPath = 'G:\pycharmproject\Face_Recognition\data\lightCNN_pretrain0.npy'
    pth_to_npy(pthPath, npyPath)