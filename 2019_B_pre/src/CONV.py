# -*- coding: utf-8 -*-
"""
Created on Tue Feb  7 22:25:20 2023

@author: Jay
"""
def NOT(num, bit):
    return -1*(2**bit - num)


def multpilier(a, b):
    b_int = b >> 16
    if b_int >= 8:
        b = NOT(b, 20)
        
    return a * b


def transform(num):
    int_of_num = (num >> 16)
    if int_of_num < 0x8:
        return (num>>16) + (num & 0x0FFFF) / 2**16
    else:
        return -1*(16-(num>>16)) + (num & 0x0FFFF) / 2**16    

print("-------------------------------")
ans1 = multpilier(0x0D7D7, 0x0A89E)
ans2 = multpilier(0x0D4D4, 0x092D5)
ans3 = multpilier(0x00000, 0x06D43)
ans4 = multpilier(0x0D8D8, 0x01004)
ans5 = multpilier(0x0D6D6, 0xF8F71)
ans6 = multpilier(0x00000, 0xF6E54)
ans7 = multpilier(0x0D8D8, 0xFA6D7)
ans8 = multpilier(0x0D6D6, 0xFC834)
ans9 = multpilier(0x00000, 0xFAC19)

anstotal = (ans1 + ans2 + ans3 + ans4 + ans5 + ans6 + ans7 + ans8 + ans9)
print(hex(anstotal))
anstotal = anstotal + (0x1310 << 16)
print(hex(anstotal))
anstotal = anstotal & 0xFFFFF8000
print(hex(anstotal))
anstotal = anstotal >> 15
print(hex(anstotal))
anstotal = anstotal + 0x1
print(hex(anstotal))
anstotal = anstotal >> 1
print(hex(anstotal))
print('total ans = ', transform(anstotal))


a1 = 8.431244e-01 * 6.586609e-01
a2 = 8.313599e-01 * 5.735626e-01
a3 = 0 * 4.268036e-01

a4 = 8.470459e-01 * 6.256104e-02
a5 = 8.392029e-01 * -4.396820e-01
a6 = 0 * -5.690308e-01

a7 = 8.470459e-01 * -3.482819e-01
a8 = 8.392029e-01 * -2.179565e-01
a9 = 0 * -3.277435e-01

atotal = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + 7.446289e-02
print(atotal)

print('++++++++++++++++++++++++')
print(NOT(0xA, 4))

print(2**12)
