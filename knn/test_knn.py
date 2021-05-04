import os
import time
import math
import numpy as np
import cv2
from light_cnn_test import shift_img_with_eyes
from read_face_data import read_face_data
from knn import get_Kernels,KNN_with_Kernels#get_d2
from hyperparams import Hyperparams
from motor import *
from steer import *

label = 'cz' # 数据标签
save_file = 'data/faceimg/'
length = 0
gap_time = 1
video_type = './data/facevideo/3.mp4'  # 获取视频的方式，=0为默认摄像头，等于地址为视频的地址
recognize_type = 0  # 分类方式，0:对CNN产生的特征进行KNN，1:不经过CNN直接KNN,2:用lightCnn直接分类
dis_type = 'cosine'  # 距离函数
kernel_type = 0  # 核函数 0：线性核 1：RBF核


# Capture webcam image

hp = Hyperparams()

#  读取名字列表
name = ['error']
name.extend(read_face_data('data/faceimg/', 0))
name.append('error')
print(name)

trains,labels = read_face_data('data/faceimg/')
print(trains)
print(labels)
xxK = get_Kernels(trains,trains,1,kernel_type=kernel_type)
#d2,d3 = get_d2(trains, xxK,dis_type=dis_type,kernel_type=kernel_type,labels=labels)
d2 = []
d3 = []

print(xxK)

steer.set_angle(0, 0)
import math
length = 0
cheak_times = 0
steer.set_angle(0, 0)
steer_flag = 0
if_have_face = False
patrol_w = 10
patrol_h = 20
runspeed = [0,0]
no_time = 0
while(True) :
    while videoIn.isOpened() :
        if_have_face = False
        ret, Vshow = videoIn.read()

        np_frame = Vshow

        cheak_times += 1
        gray = cv2.cvtColor(np_frame, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)
        print(faces)
        '''
        if type(faces) != 'list':
            print("patrol")
            if steer_flag == 0 :
                if steer.horAngle > -80:
                    steer.adj_angle(-patrol_w,0)
                else:
                    if steer.verAngle - patrol_h*2 < -90:
                        steer.set_angle(-80,0)
                    else:
                        steer.adj_angle(0,-patrol_h*2)
                    steer_flag = 1
            elif steer_flag == 1 :
                if steer.horAngle <= 86:
                    steer.adj_angle(patrol_w,0)
                else:
                    steer.adj_angle(0,patrol_h)
                    steer_flag = 0
                    '''
        print(steer_flag)
        for (x,y,w,h) in faces:
            steer_flag = 0
            if_have_face = True
            #cv2.rectangle(np_frame,(x,y),(x+w,y+h),(255,0,0),2)
            #roi_gray = gray[y:y+h, x:x+w]
            #roi_color = np_frame[y:y+h, x:x+w]

            #eyes = eye_cascade.detectMultiScale(roi_gray)
            #for (ex,ey,ew,eh) in eyes:
                #cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)
            face = Vshow[y:y+h,x:x+w]
            face = shift_img_with_eyes(face)
            #cv2.resize(face, (hp.img_size[1], hp.img_size[0]))



            now_face = np.transpose(face,(2,0,1))
            now_face = now_face.reshape((-1,1,now_face.shape[1]*now_face.shape[2]))
            now_face = now_face.astype(np.float32)
            predicted = KNN_with_Kernels(trains,labels,now_face,xxK,k=3,dis_type=dis_type,d2=d2,kernel_type=kernel_type)
            print("predicted:" + str(predicted) + name[predicted])
            text = name[predicted]
            cv2.putText(Vshow, text, (x, y),
                        cv2.FONT_HERSHEY_DUPLEX, 0.5, (255, 255, 255))
            cv2.rectangle(Vshow, (x,y),(x+w,y+h),(255,0,0),2)
            save_file_name = save_file + 'pre_result/' + str(length) + "_" + str(predicted)  + ".jpg"
            length += 1
            print(save_file_name)
            cv2.imwrite(save_file_name, Vshow)
            if predicted == 1 :
                faceSizePct = w/frame_in_w
                widthOffset = frame_in_w/2 - (x + w/2)
                heightOffset = frame_in_w/2 - (y + w/2)
                # deltaThetaX = degrees (atan(2 * widthOffset * tan(0.675) / L))
                deltaThetaX = widthOffset / frame_in_w * 68
                deltaThetaY = - heightOffset / frame_in_w * 68

                if runspeed[0] == 0 and faceSizePct - 0.6 < 0 :
                    baseSpeed = (abs(faceSizePct-0.6) ** 2) * 250
                    runspeed[0] = runspeed[1] = baseSpeed;
                    print(baseSpeed)
                    if widthOffset > 0:
                        runspeed[1] += min(deltaThetaX / 9 ,10)
                    else:
                        runspeed[0] += min(deltaThetaX / 9,10)
                    #runspeed[0] = min(baseSpeed - (frame_in_w/2 - (x + w/2)) * 0.2,100)
                    #runspeed[1] = min(baseSpeed + (frame_in_w/2 - (x + w/2)) * 0.2,100)
                    print(runspeed)
                #elif widthOffset <= 0.08:
                    #runspeed[0] = 0
                    #runspeed[1] = 0
                x_angle = deltaThetaX
                y_angle = deltaThetaY
                if abs(x_angle) < 1.5:
                    x_angle = 0
                if abs(y_angle) < 1.5:
                    y_angle = 0
                steer.adj_angle(x_angle, y_angle)
                print("adj angle: %d,%d speed: %d,%d"%(x_angle,y_angle,runspeed[0],runspeed[1]))
                no_time = 0
        else:
            no_time += 1
        if no_time == 3:
            runspeed[0] = 0
            runspeed[1] = 0
        print("sunspeed: " + str(runspeed))
        motor.set_speed(runspeed[0],runspeed[1])


        if cheak_times % 15 == 0:
            save_file_name = save_file + 'cheak/' + str(cheak_times) + ".jpg"
            print(save_file_name)
            cv2.imwrite(save_file_name, Vshow)
        if if_have_face:
            for i in range(3):
                ret, Vshow = videoIn.read()
        #if length > 10:
        #    break
    videoIn.release()
    videoIn = cv2.VideoCapture(0)
    videoIn.set(cv2.CAP_PROP_FRAME_WIDTH, frame_in_w);
    videoIn.set(cv2.CAP_PROP_FRAME_HEIGHT, frame_in_h);

    print("Capture device is open: " + str(videoIn.isOpened()))