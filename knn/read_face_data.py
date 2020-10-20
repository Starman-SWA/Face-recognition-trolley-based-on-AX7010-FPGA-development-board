import numpy as np
import cv2
import os
from hyperparams import Hyperparams
hp = Hyperparams()

def read_face_data(save_file,type=1):
    '''
    返回自己设置的人脸数据
    :param save_file: str 人脸数据的目录地址
    :param type:int 返回的类型
    :return: 根据type改变 0:目录名册,array
                        1:返回全部数据,格式为ndarray(channe,batch,width*length),用于KNN
                        2:每种返回10个数据,格式为ndarray(batch,channel,width,length),用于TORCH
                        3:每种返回10个数据,格式为ndarray(batch,width,length,channel),返回图片格式
                        4:返回所有数据,格式为ndarray(batch,width,length,channel),返回图片格式
    '''
    data = []
    label = []
    with open(os.path.join(save_file,'size.txt'),'r') as file:
        s = file.read().split()
    name_list = [s[2 * (i + 1)] for i in range(int(len(s) / 2) - 1)]
    if type == 0:
        return name_list
    size_list = [int(s[2*(i+1)+1]) for i in range(int(len(s)/2)-1)]
    label_size = int(s[1])

    for i in range(label_size):#label
        save_size = size_list[i]
        getted_length = 0
        for j in range(save_size):
            img_path = save_file+name_list[i]+'/'+str(getted_length)+'.jpg'
            while not os.path.exists(img_path):
                getted_length +=1
                img_path = save_file + name_list[i] + '/' + str(getted_length) + '.jpg'
            print(img_path)
            getted_length += 1
            img = cv2.imread(img_path)
            data.append(img)
            label.append(i+1)
            if type !=4  and j >= 4:
                break
            #height, width, _ = img.shape
    #print(data)
    if type != 3 and type != 4:
        data = np.array(data, dtype=np.float32)
    if type == 2:
        data = np.transpose(data,(0,3,1,2))
    elif type == 1:
        data = np.transpose(data,(3,0,1,2))
        data = np.reshape(data,(3,-1,data.shape[2]*data.shape[3]))

    label = np.array(label)
    return data,label

if __name__ == '__main__':
    xx = read_face_data('./data/faceimg/',3)
    print(xx[1][25:])
    print(xx[0].shape)

