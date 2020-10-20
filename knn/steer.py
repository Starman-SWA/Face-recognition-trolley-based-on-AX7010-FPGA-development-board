class Steer:
    '''
    Control the angle of horizontal and vertical steering gear.
    PWM frequency: 50Hz
    horizontal angle range: [-90, 90]
    vertical angle range: [-90, 90]
    '''
    horAngle = 0
    verAngle = 0

    def __init__(self, overlay):
        self.horSteer = overlay.ax_pwm_2
        self.verSteer = overlay.ax_pwm_3
        self.horSteer.write(0x00, 4295)
        self.verSteer.write(0x00, 4295)
        self.horSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.horAngle + 90))))
        self.verSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.verAngle + 90))))

    def set_angle(self, horAngle, verAngle):
        '''
        set absolute angles
        '''
        if horAngle < -90 or horAngle > 90:
            print("Horizontal angle out of range!")
            return
        if verAngle < -90 or verAngle > 90:
            print("Vertical angle out of range!")
            return
        self.horAngle = horAngle
        self.verAngle = verAngle
        self.horSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.horAngle + 90))))
        self.verSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.verAngle + 90))))

    def adj_angle(self, horOffset, verOffset):
        '''
        adjust angles with provided offsets
        '''
        tempHor = self.horAngle + horOffset
        tempVer = self.verAngle + verOffset
        if tempHor < -90 or tempHor > 90:
            print("Horizontal angle out of range!")
            return
        if tempVer < -90 or tempVer > 90:
            print("Vertical angle out of range!")
            return
        self.horAngle = tempHor
        self.verAngle = tempVer
        self.horSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.horAngle + 90))))
        self.verSteer.write(
            0x04, int(4294967295*(0.975 - 0.000555 * (self.verAngle + 90))))
        
