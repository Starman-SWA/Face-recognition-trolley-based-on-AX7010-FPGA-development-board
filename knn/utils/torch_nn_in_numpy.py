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
    def __init__(self, kernel, bias, stride=1, padding=0):
        super(Conv2d_in_numpy, self).__init__()
        self.kernel_size = kernel.shape
        if type(bias) == "int":
            self.bias = np.zeros([kernel.shape[0]]).reshape([1,kernel.shape[0],1,1])
        else:
            self.bias = bias.reshape([1,kernel.shape[0],1,1])
        #print(self.bias[np.newaxis,np.newaxis,:,:].shape)
        self.stride = stride
        self.padding = padding
        self.kernelMatrix = im2col(kernel, self.kernel_size[2], self.kernel_size[3])

    def __call__(self, x):
        out_height = int(((x.shape[2] - self.kernel_size[2] + 2 * self.padding) / self.stride) + 1)
        out_width = int(((x.shape[3] - self.kernel_size[3] + 2 * self.padding) / self.stride) + 1)
        x = im2col(x, self.kernel_size[2], self.kernel_size[3], self.stride, self.padding)
        out = np.dot(self.kernelMatrix, x.T).reshape([-1, self.kernel_size[0], out_height, out_width]) + self.bias
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
        self.paraDict['running_var'] = np.sqrt(self.paraDict['running_var'].reshape([1, -1, 1, 1]))
        self.paraDict['weight'] = np.sqrt(self.paraDict['weight'].reshape([1, -1, 1, 1]))
        self.paraDict['bias'] = np.sqrt(self.paraDict['bias'].reshape([1, -1, 1, 1]))
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



if __name__ == '__main__':
    #a = np.array([ [ [ [1,2,3,4,5], [4, 5, 6,7,8],[4, 5, 6,7,8],[4, 5, 6,7,8],[4, 5, 6,7,8]] , [ [7,8,9,10,11], [12,13,14,15,16],[7,8,9,10,11], [12,13,14,15,16],[12,13,14,15,16]], [ [7,8,9,10,11], [12,13,14,15,16],[12,13,14,15,16],[12,13,14,15,16],[12,13,14,15,16]]]])
    """ test Conv2d
    tConv2dInput = np.arange(75).reshape([-1,3,5,5]).astype(np.float64)
    conv = nn.Conv2d(3, 2, 3, 1, padding=1)
    conv2 = Conv2d_in_numpy(conv.weight.detach().numpy(), conv.bias.detach().numpy(), 1, 1)
    floatInput = torch.tensor(tConv2dInput, dtype=torch.float32)
    out1 = conv(floatInput)
    print(out1)
    print(conv2(tConv2dInput))
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

    """ test BN
    tBNInput = np.arange(75).reshape([-1,3,5,5]).astype(np.float64)
    floatInput = torch.tensor(tBNInput, dtype=torch.float32)
    BN = nn.BatchNorm2d(3)
    BN2 = BatchNorm2d_in_numpy(BN.state_dict())
    print(floatInput)
    out1 = BN(floatInput)
    out1 = BN(floatInput)
    BN.eval()
    print(BN2(tBNInput))
    print(BN.state_dict())
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




