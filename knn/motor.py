class Motor:
    '''
    Control the speed of left and right motor.
    PWM frequency: 50Hz
    Speed range: [0, 100]
    CAUTION: Motors may not roll when speed input is lower than 11 in case of empty load.
    '''
    leftSpeed = 0
    rightSpeed = 0

    def __init__(self, overlay):
        self.leftMotor = overlay.ax_pwm_0
        self.rightMotor = overlay.ax_pwm_1
        self.leftMotor.write(0x00, 4295)
        self.rightMotor.write(0x00, 4295)
        self.leftMotor.write(0x04, 0)
        self.rightMotor.write(0x04, 0)

    def set_speed(self, leftSpeed, rightSpeed):
        '''
        set absolute speeds
        '''
        if leftSpeed < 0 or leftSpeed > 100:
            print("Left speed out of range!")
            return
        if rightSpeed < 0 or rightSpeed > 100:
            print("Right speed out of range!")
            return
        self.leftSpeed = leftSpeed
        self.rightSpeed = rightSpeed
        self.leftMotor.write(
            0x04, int(4294967295 * (100 - self.leftSpeed) / 100))
        self.rightMotor.write(
            0x04, int(4294967295 * (100 - self.rightSpeed) / 100))

    def adj_speed(self, leftOffset, rightOffset):
        '''
        adjust speed with provided offsets
        '''
        tempLeft = self.leftSpeed + leftOffset
        tempRight = self.rightSpeed + rightOffset
        if tempLeft < 0 or tempLeft > 100:
            print("Left speed out of range!")
            return
        if tempRight < 0 or tempRight > 100:
            print("Right speed out of range!")
            return
        self.leftSpeed = tempLeft
        self.rightSpeed = tempRight
        self.leftMotor.write(
            0x04, int(4294967295 * (100 - self.leftSpeed) / 100))
        self.rightMotor.write(
            0x04, int(4294967295 * (100 - self.rightSpeed) / 100))
