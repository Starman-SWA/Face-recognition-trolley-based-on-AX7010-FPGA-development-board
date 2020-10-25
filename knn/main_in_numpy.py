import cv2
import numpy as np
from retinaface_test import face_detection,get_retinaface_net
from read_face_data import read_face_data
from knn import KNN_with_Kernels,get_Kernels,KNN,get_d2
from test_light_cnn_in_numpy import get_feature, get_net
from light_cnn_test import shift_img_with_eyes
from utils.load_temtrain_data import load_temtrain_data
import math
from utils.retinaface_tool import shift_img,rotate_img
from hyperparams import Hyperparams
hp = Hyperparams()

# 参数
video_type = './data/facevideo/3.mp4'  # 获取视频的方式，=0为默认摄像头，等于地址为视频的地址
recognize_type = 0  # 分类方式，0:对CNN产生的特征进行KNN，1:不经过CNN直接KNN,2:用lightCnn直接分类
dis_type = 'cosine'  # 距离函数
kernel_type = 0  # 核函数 0：线性核 1：RBF核
if_add_img = 0  # 是否添加样本点


print("loading data")
#  读取名字列表
name = ['error']
name.extend(read_face_data('./data/faceimg/', 0))
name.append('error')

#  获取retinaface的网络
retinaface_net = get_retinaface_net()

trains = []
labels = None
net = None
if recognize_type == 1:
    trains, labels = read_face_data('./data/faceimg/', 1)
else:
    #data_set = load_temtrain_data('./data/faceimg/')
    net_para = {
        'if_train': 0,
        'trains': 0,
        'num_classes': 0,
    }
    net = get_net()

    # 人脸对齐与获取特征值
    if recognize_type == 0:
        tem_trains, labels = read_face_data('./data/faceimg/', 3)  # 获取图片格式的数据集
        # tem_trains = np.split(tem_trains, tem_trains.shape[0], 0)
        print(tem_trains[0].shape)
        length2 = 0
        for num, train in enumerate(tem_trains):
            tem = shift_img_with_eyes(retinaface_net, train)
            tem = tem[np.newaxis, :, :, :]
            tem = np.transpose(tem, (0, 3, 1, 2))
            tem = get_feature(net, tem, length2)
            length2 += 1
            trains.append(tem)
        trains = np.concatenate(trains, axis=1)
    print(trains.shape)
    '''
    if recognize_type == 0:
        tem_trains, labels = read_face_data('./data/faceimg/', 2)
        tem_trains = np.split(tem_trains,tem_trains.shape[0],0)
        length2 = 0
        
        for train in tem_trains:
            tem = get_feature(net,train,length2)
            length2+=1
            tem = tem.cpu()
            trains.append(tem.numpy())
        trains = np.concatenate(trains,axis=1)
        '''

print("getting xxK")
xxK=None
d2 = None
d3 = None
if recognize_type != 2:
    xxK = get_Kernels(trains,trains,1,kernel_type=kernel_type)
    d2,d3 = get_d2(trains, xxK,dis_type=dis_type,kernel_type=kernel_type,labels=labels)
cap = cv2.VideoCapture(video_type)
#cap.set(3,480)
#cap.set(4,640)
length = 0
save_img = []
while(cap.isOpened()):
    save_img.clear()
    ret_flag,Vshow = cap.read()  # 读取视频的照片
    #Vshow = cv2.resize(Vshow,(640, 480),interpolation=cv2.INTER_LINEAR)
    faces = face_detection(retinaface_net,Vshow)

    if len(faces) != 0:
        for face in faces:
            # 截取人脸做数据对齐
            img = Vshow.copy()
            now_face = shift_img_with_eyes(retinaface_net,img,face)
            save_img.append(now_face)

            '''
            tem_face = Vshow[face[1]:face[3],face[0]:face[2]]
            if tem_face.shape[1] ==0 or tem_face.shape[0] ==0 or tem_face.shape[2] ==0:
                continue
            now_face = cv2.resize(tem_face,(hp.img_size[1], hp.img_size[0]),interpolation=cv2.INTER_LINEAR)
            '''
            # 进行预测
            predicted = -1
            if recognize_type != 2:
                if recognize_type == 1:
                    now_face = np.transpose(now_face,(2,0,1))
                    now_face = now_face.reshape((-1,1,now_face.shape[1]*now_face.shape[2]))
                    now_face = now_face.astype(np.float32)
                elif recognize_type == 0:
                    '''
                    now_face = now_face[:,:,:,np.newaxis]
                    now_face = np.transpose(now_face,(3,2,0,1))
                    now_face = get_feature(net,now_face).cpu().numpy()
                    '''
                    now_face = now_face[np.newaxis, :, :, :]
                    now_face = np.transpose(now_face, (0, 3, 1, 2))
                    now_face = get_feature(net, now_face)
                    # predicted = KNN_with_Kernels(trains, labels, now_face, xxK,k=1)
                    # predicted = KNN(trains[0], labels, now_face[0], k=3, dis_type='cosine')[0]
                if if_add_img:
                    predicted, if_get_d3,new_d2d3,chang_d3 = KNN_with_Kernels(trains,labels,now_face,xxK,k=3,dis_type=dis_type,d2=d2,kernel_type=kernel_type,d3=d3)
                    if if_get_d3:
                        trains = np.concatenate([trains, now_face], axis=1)
                        labels = np.append(labels, predicted)
                        new_xxK = get_Kernels(now_face, now_face, 1, kernel_type=kernel_type)
                        xxK = np.concatenate([xxK, new_xxK], axis=1)
                        d2 = np.append(d2, new_d2d3[0])
                        new_d3 = np.array(new_d2d3[1])[np.newaxis, :]
                        d3 = np.concatenate([d3, new_d3], axis=0)
                        fname = './data/faceimg/results/' + str(length) + name[predicted] + ".jpg"
                        print(fname)
                        d3[chang_d3[1],0]=chang_d3[0]
                        cv2.imwrite(fname, save_img[-1])
                        length += 1
                else:
                    predicted = KNN_with_Kernels(trains,labels,now_face,xxK,k=3,dis_type=dis_type,d2=d2,kernel_type=kernel_type)


            else:
                now_face = now_face[:, :, :, np.newaxis]
                now_face = np.transpose(now_face, (3, 2, 0, 1))
                predicted = get_predicted(net,now_face)+1
            #text = 'guess:'+str(predicted)+"name:"+name[predicted]
            text = name[predicted]
            cx = face[0]
            cy = face[1] + 12
            cv2.putText(Vshow, text, (cx, cy),
                        cv2.FONT_HERSHEY_DUPLEX, 0.5, (255, 255, 255))
            cv2.rectangle(Vshow, (face[0], face[1]), (face[2], face[3]), (0, 0, 255), 2)
    cv2.imshow("Capture_Test",Vshow)

    k = cv2.waitKey(1)
    if k == ord('s'):
        for imgg in save_img:
            fname = './data/faceimg/results/' + str(length) + ".jpg"
            cv2.imwrite(fname, imgg)
        length += 1
    elif k == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()