import trilateration_core

trilateration_core.initialize(0.000, 0.000, 2.000,
                                -6.80, 0.000, 2.000,
                                0.000, -10.8, 2.000,
                                0.000, -5.80, 2.000)

trilateration_core.getPos(5784, 7021, 5995, 2000)

trilateration_core.report

print(trilateration_core.report.x, trilateration_core.report.y, trilateration_core.report.z)
