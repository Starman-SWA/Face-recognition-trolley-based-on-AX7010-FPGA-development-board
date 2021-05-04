import numpy as np
def im2col(input_data, filter_h, filter_w, stride=1, pad=0):
    """
    Parameters
    ----------
    input_data : 由(数据量, 通道, 高, 长)的4维数组构成的输入数据
    filter_h : 滤波器的高
    filter_w : 滤波器的长
    stride : 步幅
    pad : 填充

    Returns
    -------
    col : 2维数组
    """
    N, C, H, W = input_data.shape
    out_h = (H + 2*pad - filter_h)//stride + 1
    out_w = (W + 2*pad - filter_w)//stride + 1

    img = np.pad(input_data, [(0,0), (0,0), (pad, pad), (pad, pad)], 'constant')
    col = np.zeros((N, C, filter_h, filter_w, out_h, out_w))

    for y in range(filter_h):
        y_max = y + stride*out_h
        for x in range(filter_w):
            x_max = x + stride*out_w
            col[:, :, y, x, :, :] = img[:, :, y:y_max:stride, x:x_max:stride]

    col = col.transpose([0, 4, 5, 1, 2, 3]).reshape(N*out_h*out_w, -1)
    return col

def preMaxPool2d(input_data, filter_h, filter_w, stride=1, pad=0):
    """
    Parameters
    ----------
    input_data : 由(数据量, 通道, 高, 长)的4维数组构成的输入数据
    filter_h : 滤波器的高
    filter_w : 滤波器的长
    stride : 步幅
    pad : 填充

    Returns
    -------
    col : 2维数组
    """
    N, C, H, W = input_data.shape
    out_h = (H + 2*pad - filter_h)//stride + 1
    out_w = (W + 2*pad - filter_w)//stride + 1

    img = np.pad(input_data, [(0,0), (0,0), (pad, pad), (pad, pad)], 'constant')
    col = np.zeros((N, C, filter_h, filter_w, out_h, out_w))

    for y in range(filter_h):
        y_max = y + stride*out_h
        for x in range(filter_w):
            x_max = x + stride*out_w
            col[:, :, y, x, :, :] = img[:, :, y:y_max:stride, x:x_max:stride]
    col = col.transpose([0, 1, 4, 5, 2, 3]).reshape(-1, filter_h*filter_w)
    out = np.max(col, axis=1).reshape(-1, C, out_h, out_w)
    return out

class Conv2d_in_numpy(object):
    def __init__(self, kernel, bias, stride=1, padding=0, groups=1):
        super(Conv2d_in_numpy, self).__init__()
        self.kernel_size = kernel.shape
        self.groups = groups
        self.osize = int(kernel.shape[0]/groups)
        if isinstance(bias, int):
            self.bias = np.zeros([kernel.shape[0]]).reshape([1,kernel.shape[0],1,1])
        else:
            self.bias = bias.reshape([1,kernel.shape[0],1,1])
        #print(self.bias[np.newaxis,np.newaxis,:,:].shape)
        self.stride = stride
        self.padding = padding
        # tem = [kernel[i*self.osize:(i+1)*self.osize,:,:,:] for i in range(self.groups)]
        self.kernelMatrix = [im2col(kernel[i * self.osize:(i + 1) * self.osize, :, :, :], self.kernel_size[2], self.kernel_size[3]) for i in range(self.groups)]

        #self.kernelMatrix = im2col(kernel, self.kernel_size[2], self.kernel_size[3])
        #print(self.kernelMatrix)

    def __call__(self, x):
        out_height = int(((x.shape[-2] - self.kernel_size[-2] + 2 * self.padding) / self.stride) + 1)
        out_width = int(((x.shape[-1] - self.kernel_size[-1] + 2 * self.padding) / self.stride) + 1)
        #print(x.shape)

        xsize = int(x.shape[-3]/self.groups)
        xn = []
        if self.groups == 1:
            xn = [x]
        else:
            xn = [x[:,i*xsize:(i+1)*xsize,:,:] for i in range(self.groups)]
        out = []
        for xi,k in zip(xn,self.kernelMatrix):
            #print(xi.shape)
            txi = im2col(xi, self.kernel_size[-2], self.kernel_size[-1], self.stride, self.padding)
            temout = np.dot(k, txi.T) #.reshape([-1, self.kernel_size[0], out_height, out_width]) + self.bias
            out.append(temout)
        out = np.array(out).reshape([-1, self.kernel_size[0], out_height, out_width]) + self.bias
        return out

class Linear_in_numpy(object):
    def __init__(self, weight, bias):
        super(Linear_in_numpy, self).__init__()
        self.weight = weight
        self.bias = bias

    def __call__(self, x):
        out = np.dot(x, self.weight.T) + self.bias
        return out

class BatchNorm2d_in_numpy(object):
    def __init__(self, paraDict):
        super(BatchNorm2d_in_numpy, self).__init__()
        self.paraDict = paraDict.copy()
        self.paraDict['running_mean'] = self.paraDict['running_mean'].reshape([1, -1, 1, 1])
        self.paraDict['running_var'] = np.sqrt(self.paraDict['running_var']).reshape([1, -1, 1, 1])
        self.paraDict['weight'] = self.paraDict['weight'].reshape([1, -1, 1, 1])
        self.paraDict['bias'] = self.paraDict['bias'].reshape([1, -1, 1, 1])
    def __call__(self, x):
        # print(self.paraDict['running_mean'].numpy())
        out = (x - self.paraDict['running_mean']) / self.paraDict['running_var']
        out = np.multiply(out, self.paraDict['weight']) + self.paraDict['bias']
        return out

class MaxPool2d_in_numpy(object):
    def __init__(self, kernel):
        super(MaxPool2d_in_numpy, self).__init__()
        self.kernel = kernel

    def __call__(self, x):
        out = preMaxPool2d(x, self.kernel, self.kernel, self.kernel)
        return out

class LeakyReLU_in_numpy(object):
    def __init__(self, leaky=0.0):
        super(LeakyReLU_in_numpy, self).__init__()
        self.leaky = leaky

    def __call__(self, x):
        out = np.maximum(self.leaky*x,x)
        return out

class Conv_bn_in_numpy(object):
    def __init__(self, cfg, stride=1,padding=0,leaky = 0.0):
        super(Conv_bn_in_numpy, self).__init__()
        self.conv2d1 = Conv2d_in_numpy(cfg["weight0"], 0, stride=stride,padding=padding)
        self.batchnorm = BatchNorm2d_in_numpy(cfg["norm1"])
        self.leaky = LeakyReLU_in_numpy(leaky)


    def __call__(self, x):
        x = self.conv2d1(x)
        x = self.batchnorm(x)
        out = self.leaky(x)
        return out

class Conv_bn_no_relu_in_numpy(object):
    def __init__(self, cfg, stride=1,padding=0,leaky = 0.0):
        super(Conv_bn_no_relu_in_numpy, self).__init__()
        self.conv2d1 = Conv2d_in_numpy(cfg["weight0"], 0, stride=stride,padding=padding)
        self.batchnorm = BatchNorm2d_in_numpy(cfg["norm1"])


    def __call__(self, x):
        x = self.conv2d1(x)
        out = self.batchnorm(x)
        return out

class conv_dw_in_numpy(object):
    def __init__(self, cfg, groups=1,stride=1,leaky = [0.1,0.1]):
        super(conv_dw_in_numpy, self).__init__()
        self.conv2d1 = Conv2d_in_numpy(cfg["weight0"], 0, stride=stride,padding=1,groups=groups)
        self.batchnorm1 = BatchNorm2d_in_numpy(cfg["norm1"])
        self.leaky1 = LeakyReLU_in_numpy(leaky[0])

        self.conv2d2 = Conv2d_in_numpy(cfg["weight3"], 0, stride=1, padding=0)
        self.batchnorm2 = BatchNorm2d_in_numpy(cfg["norm4"])
        self.leaky2 = LeakyReLU_in_numpy(leaky[1])

    def __call__(self, x):
        x = self.conv2d1(x)
        x = self.batchnorm1(x)
        x = self.leaky1(x)
        x = self.conv2d2(x)
        x = self.batchnorm2(x)
        out = self.leaky2(x)
        return out

class bottom_to_top_in_numpy(object):
    def __init__(self, weight, bias, cfg, stride=1,padding=0,leaky = 0.0):
        super(bottom_to_top_in_numpy, self).__init__()
        self.conv2d1 = Conv2d_in_numpy(weight, bias, stride=stride,padding=padding)
        self.batchnorm = BatchNorm2d_in_numpy(cfg)


    def __call__(self, x):
        x = self.conv2d1(x)
        out = self.batchnorm(x)
        return out

def interpolate_in_numpy(input,size):
    scale1 = int(size[0]/input.shape[2])
    scale1 = np.full(input.shape[2],scale1)
    if size[0] % input.shape[2] != 0:
        scale_mid(input.shape[2], size[0] % input.shape[2],0 ,scale1)

    scale2 = int(size[1]/input.shape[3])
    scale2 = np.full(input.shape[3], scale2)
    if size[1] % input.shape[3] != 0:
        scale_mid(input.shape[3], size[1] % input.shape[3],0 ,scale2)
    out = np.repeat(input,scale1,axis=2)
    out = np.repeat(out,scale2,axis=3)
    #print(out)
    return out

def scale_mid(nowsize, num, nowidx, scale):
    if num == 0:
        return 0
    if nowsize == 1:
        if num == 1:
            scale[nowidx] += 1
        return 0
    front = int(nowsize/2+0.5)
    tail = nowsize - front
    front_num = int(num/2+0.5)
    tail_num = num-front_num
    scale_mid(front,front_num, nowidx,scale)
    scale_mid(tail,tail_num,nowidx+front,scale)

def softmax_in_numpy(input,dim):
    backshape = np.array(input.shape)
    backshape[dim] = 1
    expinput = np.exp(input)
    expall = np.sum(expinput,dim).reshape(backshape)
    #print(expinput)
    #print(expall)
    #print(expinput.shape)
    #print(expall.shape)

    return expinput/expall

if __name__ == '__main__':
    #a = np.array([ [ [ [1,2,3,4,5], [4, 5, 6,7,8],[4, 5, 6,7,8],[4, 5, 6,7,8],[4, 5, 6,7,8]] , [ [7,8,9,10,11], [12,13,14,15,16],[7,8,9,10,11], [12,13,14,15,16],[12,13,14,15,16]], [ [7,8,9,10,11], [12,13,14,15,16],[12,13,14,15,16],[12,13,14,15,16],[12,13,14,15,16]]]])
    """ test Conv2d
    tConv2dInput = np.arange(36).reshape([-1,4,3,3]).astype(np.float64)
    groups = 4
    conv = nn.Conv2d(4, 4, 3, 1, padding=1,groups=groups)
    conv2 = Conv2d_in_numpy(conv.weight.detach().numpy(), conv.bias.detach().numpy(), 1, 1,groups =groups)
    floatInput = torch.tensor(tConv2dInput, dtype=torch.float32)
    out1 = conv(floatInput)
    print(out1)
    print(conv2(tConv2dInput))
    print(out1.size())
    print(conv2(tConv2dInput).shape)
    """

    """ test Conv2d
    tLinearInput = np.arange(60).reshape([4,15]).astype(np.float64)
    floatInput = torch.tensor(tLinearInput, dtype=torch.float32)
    linear = nn.Linear(15, 6)
    linear2 = Linear_in_numpy(linear.weight.detach().numpy(), linear.bias.detach().numpy())
    out1 = linear(floatInput)
    print(out1)
    print(linear2(tLinearInput))
    """

    """test BN
    tBNInput = np.arange(75).reshape([-1,3,5,5]).astype(np.float64)
    floatInput = torch.tensor(tBNInput, dtype=torch.float32)
    BN = nn.BatchNorm2d(3)
    BN.weight = torch.tensor([[[[1.]],[[1.]],[[1.]]]])
    newstate = {}
    for k, v in BN.state_dict().items():
        newstate[k] = v.cpu().numpy()
    BN2 = BatchNorm2d_in_numpy(newstate)
    print(floatInput)
    BN.eval()
    out1 = BN(floatInput)
    print(out1)
    print(BN.state_dict())
    print(BN2(tBNInput))
    """

    """ test MaxPool 
    tMP2dInput = np.arange(768).reshape([-1,3,16,16]).astype(np.float64)
    MP = nn.MaxPool2d(2,2)
    MP2 = MaxPool2d_in_numpy(2)
    floatInput = torch.tensor(tMP2dInput, dtype=torch.float32)
    out1 = MP(floatInput)
    print(floatInput)
    print(MP2(tMP2dInput))
    print(out1)
    """
    """ test MaxPool 
    tMP2dInput = np.arange(120).reshape([-1,1,10,12]).astype(np.float64)
    print(interpolate_in_numpy(tMP2dInput, [10,20]).shape)
    """

    """ test view 
    tMP2dInput = np.arange(24).reshape([4,3,1,2]).astype(np.float64)
    floatInput = torch.tensor(tMP2dInput, dtype=torch.float32)
    out1 = floatInput.permute(0,2,3,1).contiguous()
    out1 = out1.view(2, -1, 2)
    out2 = np.transpose(tMP2dInput, (0,2,3,1))
    out2 = out2.reshape((2,-1,2))
    print(floatInput)
    print(out1)
    print(out2)
    """
    """ test sofemax
    tMP2dInput = np.arange(18).reshape([-1,3,2,3]).transpose([2,3,0,1]).reshape([-1,3,2,3]).astype(np.float64)
    floatInput = torch.tensor(tMP2dInput, dtype=torch.float32)
    dim = -1
    print(tMP2dInput)
    print(F.softmax(floatInput, dim=dim))
    print(softmax_in_numpy(tMP2dInput,dim))
    """
    """
    tMP2dInput = np.arange(20).reshape([-1,5,2,2]).astype(np.float64)-5
    MP = nn.LeakyReLU(negative_slope=0,inplace=False)
    MP2 = LeakyReLU_in_numpy(0)
    floatInput = torch.tensor(tMP2dInput, dtype=torch.float32)
    out1 = MP(floatInput)
    print(floatInput)
    print(out1)
    print(MP2(tMP2dInput))
    """



