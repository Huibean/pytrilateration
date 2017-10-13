import trilateration_core

trilateration_core.initialize(0.000, 0.000, 1.000,
                                0.00, 3.650, 1.000,
                                6.000, 3.65, 1.000,
                                6.000, 0.00, 1.500)

#  trilateration_core.getPos(5784, 7021, 5995, 2000)

#  print(trilateration_core.report.x, trilateration_core.report.y, trilateration_core.report.z)
import sys
import serial

if sys.platform == 'linux2':
    port_name = '/dev/ttyACM0'
else:
    port_name = '/dev/cu.usbmodem1421'

serial_connection = serial.Serial(port_name, 115200, timeout=0.01)

while True:
    m = serial_connection.readline()
    if len(m) == 65:
        mid, mask, range0, range1, range2, range3, nranges, resq, debug, tag_id= m.split(" ")
        if mid == 'mc' and int(mask, 16) >= 7:
            print(range0, range1, range2, range3)
            trilateration_core.getPos(int(range0, 16), int(range1, 16), int(range2, 16), int(range3, 16))
            print(trilateration_core.report.x, trilateration_core.report.y, trilateration_core.report.z)
    else:
        if m:
            print("invalid data : {0}".format(m))
