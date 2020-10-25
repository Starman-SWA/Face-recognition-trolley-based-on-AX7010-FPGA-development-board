#!/usr/bin/env python
# -*- coding:utf-8 -*-


import numpy as np
import operator
from scipy.spatial.distance import cdist


def get_Kernels(x, z, type, kernel_type=0):
    '''参数：
    x：np.array [channel,batch,,data] or [batch,data]
    z:np.array [channel,1,,data] or [1,data]
    type:int  1:x==z,2:x!=z
    kernel_type:
    '''
     
    x = x.astype(np.float)
    z = z.astype(np.float)
    size1 = np.shape(x)[0]
    size2 = np.shape(z)[0]
    if len(z.shape) == 3:
        zT = np.swapaxes(z, 1, 2)
    else:
        zT = z.T
    kernels = np.matmul(x, zT)
    if kernel_type == 0:
        if type == 1:
            if len(x.shape) == 3:
                ans = np.zeros([kernels.shape[0], kernels.shape[2]])
                for i in range(kernels.shape[0]):
                    ans[i] = np.diagonal(kernels[i])
                return ans
            else:
                return np.diagonal(kernels[0])
        elif type == 2:
            if len(x.shape) == 3:
                return kernels.reshape(x.shape[0], -1)
            return kernels
    else:
        if type == 1:
            return np.ones([x.shape[0], x.shape[1]])
        else:
            #rbf_sigma = 1.00
            #sigma = -1/(pow(rbf_sigma, 2) * 2)
            length = 1
            if len(x.shape) == 3:
                ans = []
                for i in range(x.shape[0]):
                    dis = np.square(cdist(z[i], x[i]))
                    # rbf_sigma = np.std(dis)  # 获取方差
                    rbf_sigma = 1e-1
                    sigma = pow(rbf_sigma, 2)
                    ans.append(np.exp(dis/sigma * (-1)))
                return np.array(ans).reshape(x.shape[0], -1)

    return 0


def KNN(trains, labels, examples, k=3, disType='cosine'):
    '''
    numSamples = trains.shape[0]  # shape[0]表示行数
    diff = np.tile(test, (numSamples, 1)) - dataSet  # 按元素求差值
    squaredDiff = diff ** 2  # 将差值平方
    squaredDist = np.sum(squaredDiff, axis=1)  # 按行累加
    distance = squaredDist ** 0.5  # 将差值平方和求开方，即得距离
    '''
    distance = cdist(examples, trains, disType)[0]
    sortedDistIndices = np.argsort(distance)
    classCount = {}  # define a dictionary (can be append element)
    for i in range(min(k, trains.shape[0])):
        voteLabel = labels[sortedDistIndices[i]]
        classCount[voteLabel] = classCount.get(voteLabel, 0) + 1
    maxCount = 0
    for key, value in classCount.items():
        if value > maxCount:
            maxCount = value
    maxIndex = key
    return maxIndex


'''
def KNN_with_Kernels(trains, labels, examples,xxK,k=3,dis_type = 'euclidean',kernel_type = 0,d2 = [],d3=[]):
    
只支持一次估计
: param trains: np.array 训练集输入，size: [n, m]
: param labels: np.array 训练集标签输入，size: [n, 1]
: param examples: np.array 测试集输入，size: [n, m]
: param xxK: np.array xTx的核矩阵
: param k: int 训练所用K值
: return: l_, 估计值

    l2_gmma = 1

    # 获取kernel
    xzK = get_Kernels(trains,examples,type=2,kernel_type=kernel_type)
    zzK = get_Kernels(examples,examples,type=1,kernel_type=kernel_type)
    dis = None
    if dis_type == 'euclidean':
        # 计算欧式距离
        dis = np.mean(np.sqrt(xxK-2*xzK+zzK),axis=0)
    elif dis_type == 'cosine':
        # 计算余弦距离
        dis = 1-np.mean(xzK/(np.sqrt(xxK)*np.sqrt(zzK)),axis=0)
    # 设置K保证选取的k不会超过最大数量
    k_ = k
    if np.shape(dis)[0] < k:
        k_ = np.shape(dis)[0]
    # 对每个测试数据获取最近的k个数据的标签，并取出现次数最多的作为自己的预测值
    dis_l = [(dis[i], labels[i],i) for i in range(len(dis))]  # 距离做标记
    dis_l.sort(key=operator.itemgetter(0))  # 距离排序
    if not (type(d2) == list and len(d2) == 0): # 用于区分负样本
        if dis_l[0][0] > d2[dis_l[0][2]]*l2_gmma:
            if type(d3) != list or len(d3) != 0:
                return -1,0,[0,[-1,-1]],[0,0]
            return -1
    if_get_d3 = 0
    new_d2d3 = [0,[-1,-1]]
    change_d3 = [0,0]
    if type(d3) != list or len(d3) != 0:
        if d3[dis_l[0][2]][0]/2 <= dis_l[0][0] <= d3[dis_l[0][2]][1] and dis_l[0][1] == dis_l[1][1] :#and dis_l[0][0] > d3[dis_l[0][2]][0]:# and dis_l[0][1] == dis_l[1][1]:
            near_num = 10
            if len(dis_l) <= near_num:
                near_num = len(dis_l) - 1
            tem_d2 = [dis_l[i + 1][0] for i in range(int(near_num/2))]
            kk = 1
            for i in range(int(near_num / 2)):
                while kk < len(dis_l) and dis_l[kk][1] == dis_l[0][1]:
                    kk += 1
                if kk <len(dis_l):
                    tem_d2.append(dis_l[kk][0])
                else:
                    break

            new_d2d3[0] = np.mean(np.array(tem_d2))
            tem_d3min = [dis_l[i][0] for i in range(len(dis_l)) if dis_l[i][1] == dis_l[0][1]]
            #print(len(tem_d3min))
            new_d2d3[1][0] = np.mean(np.array(tem_d3min))*(np.exp(len(tem_d3min)/5/k)-1)
            new_d2d3[1][1] = dis_l[1][0]
            change_d3 = [(sum(d3[dis_l[0][2]]) - dis_l[0][0])*1.1,dis_l[0][2]]
            #print('%.5f,  [%.5f, %.5f]->%.5f,[%.5f, %.5f]     %.5f' % (dis_l[0][0], d3[dis_l[0][2]][0], d3[dis_l[0][2]][1],change_d3[0],
             #                                                     new_d2d3[1][0],new_d2d3[1][1],new_d2d3[0]))
            if_get_d3 = 1
    #print(dis_l)
    while True:
        tem_label = np.array([dis_l[i][1] for i in range(k_)])  # 取最近的k个点
        tem_l, num = np.unique(tem_label, return_counts=True)  # 数k个点中重复的标签
        tem_l = [(tem_l[i], num[i]) for i in range(len(tem_l))]
        tem_l.sort(reverse=True, key=operator.itemgetter(1))
        if len(tem_l) == 1 or tem_l[0][1] > tem_l[1][1]:  # 确保当前只有一个标签出现的次数最大
            break
        k_ -= 1
    l_ = tem_l[0][0]  # 记录标签
    if type(d3) != list or len(d3)!=0:
        if l_ != dis_l[0][1]:
            if_get_d3 = 0
        return l_,if_get_d3,new_d2d3,change_d3
    return l_
'''
