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

def pth_to_npy2(pthPath, npyPath):
    # Load
    state_dict = torch.load(pthPath)
    new_state_dict = {}
    temDict = {}
    temidx = 0
    #for kkk in state_dict.keys():
    #    print(kkk)
    for k, v in state_dict.items():
        print(k)
        print(v.shape)
        value = v.cpu().numpy()
        if "bottom_to_top" in k:
            if "bottom_to_top" not in new_state_dict:
                new_state_dict["bottom_to_top"] = {}
            stage = k[14:22]
            if stage not in new_state_dict["bottom_to_top"]:
                new_state_dict["bottom_to_top"][stage] = {}
            if "0.weight"in k:
                new_state_dict["bottom_to_top"][stage]["weight0"] = value
                new_state_dict["bottom_to_top"][stage]["norm1"] = {}
            elif "3.weight"in k:
                new_state_dict["bottom_to_top"][stage]["weight3"] = value
                new_state_dict["bottom_to_top"][stage]["norm4"] = {}
            else:
                temidx = k.rfind('.')+1
                new_state_dict["bottom_to_top"][stage]["norm" + k[temidx - 2]][k[temidx:]] = value
                #print(k[temidx:])
        elif "fpn" in k:
            if "fpn" not in new_state_dict:
                new_state_dict["fpn"] = {}
            temidx = k[4:].find('.')
            stage = k[4:temidx+4]
            #print(stage)
            if stage not in new_state_dict["fpn"]:
                new_state_dict["fpn"][stage] = {}
            if "0.weight" in k:
                new_state_dict["fpn"][stage]["weight0"] = value
                new_state_dict["fpn"][stage]["norm1"] = {}
            else:
                temidx = k.rfind('.') + 1
                new_state_dict["fpn"][stage]["norm1"][k[temidx:]] = value
        elif "ssh" in k:
            sshname = k[:4]
            if sshname not in new_state_dict:
                new_state_dict[sshname] = {}
            temidx = k[5:].find('.')
            stage = k[5:temidx+5]
            if stage not in new_state_dict[sshname]:
                new_state_dict[sshname][stage] = {}
            if "0.weight" in k:
                new_state_dict[sshname][stage]["weight0"] = value
                new_state_dict[sshname][stage]["norm1"] = {}
            else:
                temidx = k.rfind('.') + 1
                new_state_dict[sshname][stage]["norm1"][k[temidx:]] = value
        elif "Head" in k:
            temidx = k.find('.')
            headname = k[:temidx]
            if headname not in new_state_dict:
                new_state_dict[headname] = {}
            temidx2 = k[temidx+1:].find('.')
            stage = k[temidx+1:temidx2 + temidx+1]
            temidx = k.rfind('.') + 1
            if stage not in new_state_dict[headname]:
                new_state_dict[headname][stage] = {}
            new_state_dict[headname][stage][k[temidx:]] = value
        else:
            continue
    # Save
    np.save(npyPath, new_state_dict)

if __name__ == '__main__':
    pthPath = "E:/py_file/temFace/temFace/data/retinaface_model_save/mobilenet0.25_Final_3_4.pth"
    npyPath = 'E:/py_file/temFace/temFace/data/retinate.npy'
    pth_to_npy2(pthPath, npyPath)
    cfg = np.load("E:/py_file/temFace/temFace/data/retinate.npy", allow_pickle=True)
    cfg = cfg.item()
    #print(cfg)