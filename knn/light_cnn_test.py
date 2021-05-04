import numpy as np
import cv2
import math
from utils.retinaface_tool_in_numpy import shift_img,rotate_img
from hyperparams import Hyperparams
hp = Hyperparams()

def shift_img_with_eyes(img, face=0):
    '''
    根据眼的关键点平移和旋转图片到指定位置
    :param img:需要处理的图片
    :return:返回处理好的img
    '''
    if face != 0 :
        x = face[7] - face[5]
        y = face[8] - face[6]
        angle = math.atan(y / x) * 180 / math.pi
        # print(angle)

        img = rotate_img(img, angle, (face[5], face[6]))
        # file_name = './data/faceimg/results/' + "0000.jpg"
        # cv2.imwrite(file_name, img)
        face[1] = max(face[1], 0)
        face[0] = max(face[0], 0)
        img = img[face[1]:face[3], face[0]:face[2]]


    tem_shape = []

    if img.shape[0]>img.shape[1]:
        tem_shape.append(hp.img_size[0])
        mul_times = hp.img_size[0] / img.shape[0]
        now_shape = int(hp.img_size[0] / img.shape[0] * img.shape[1])
        tem_shape.append(now_shape)
    else:
        now_shape = int(hp.img_size[1] / img.shape[1] * img.shape[0])
        mul_times = hp.img_size[1] / img.shape[1]
        tem_shape.append(now_shape)
        tem_shape.append(hp.img_size[1])
    '''
    mul_times = (hp.img_size[1]*hp.eye_width) / (face[2]-face[0])
    tem_shape.append(int(img.shape[0] * mul_times))
    tem_shape.append(int(img.shape[1] * mul_times))
    '''
    img = cv2.resize(img, (tem_shape[1], tem_shape[0]), interpolation=cv2.INTER_LINEAR)
    file_name = './data/faceimg/results/' + "0005.jpg"
    #cv2.imwrite(file_name, img)

    top_bottom_shape = max(hp.img_size[0]-img.shape[0],0)
    left_right_shape = max(hp.img_size[1]-img.shape[1],0)
    fill_shape = [int(top_bottom_shape/2)]
    fill_shape.append(top_bottom_shape-fill_shape[0])
    fill_shape.append(int(left_right_shape/2))
    fill_shape.append(left_right_shape - fill_shape[2])
    img = cv2.copyMakeBorder(img,fill_shape[0],fill_shape[1],fill_shape[2],fill_shape[3], cv2.BORDER_CONSTANT, value=0)
    # file_name = './data/faceimg/results/' + "0008.jpg"
    #cv2.imwrite(file_name, img)
    if face != 0:
        now_eye = (
            int((face[5] - face[0]) * mul_times + fill_shape[2]), 
            int(((face[6] - face[1]) * mul_times) + fill_shape[0]))
        pre_eye = [img.shape[0] * hp.eye_site[0], img.shape[1] * hp.eye_site[1]]
        dx = pre_eye[0] - now_eye[0]
        dy = pre_eye[1] - now_eye[1]
        return shift_img(img, dx, dy)
    return img
