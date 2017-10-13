import sys
import serial
import trilateration_core
from threading import Thread

import lpe

class UwbTag(Thread):

    def __init__(self):
        Thread.__init__(self)
        trilateration_core.initialize(0.000, 0.000, 1.000,
                                        0.00, 3.650, 1.000,
                                        6.000, 3.65, 1.000,
                                        6.000, 0.00, 1.500)

        if sys.platform == 'linux2':
            port_name = '/dev/ttyACM0'
        else:
            port_name = '/dev/cu.usbmodem1421'

        self.serial_connection = serial.Serial(port_name, 115200, timeout=0.01)

    def run(self):
        while True:
            m = self.serial_connection.readline()
            if len(m) == 65:
                mid, mask, range0, range1, range2, range3, nranges, resq, debug, tag_id= m.split(" ")
                if mid == 'mc' and int(mask, 16) >= 7:
                    trilateration_core.getPos(int(range0, 16), int(range1, 16), int(range2, 16), int(range3, 16))
                    lpe.uwb_x, lpe.uwb_y, lpe.uwb_z = trilateration_core.report.x, trilateration_core.report.y, trilateration_core.report.z
            else:
                if m:
                    print("invalid data : {0}".format(m))
