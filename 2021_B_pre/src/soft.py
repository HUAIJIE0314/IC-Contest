# -*- coding: utf-8 -*-
"""
Created on Sun Mar 24 08:58:08 2024

@author: Jay
"""
import math
import numpy as np

xCoor = [710, 103, 103, 298, 755, 982]


yCoor = [50, 50, 340, 560, 510, 280]

R_len = [559, 294, 118, 252, 567, 763]


xCoor = [103, 103, 298, 755, 982, 710]

yCoor = [50, 340, 560, 510, 280, 50]

R_len = [680, 397, 178, 574, 879, 830]

idx1 = 0
idx2 = 1
acc = 0
for times in range(6):
    print(idx1, idx2)
    mul1 = xCoor[idx1] * yCoor[idx2]
    mul2 = xCoor[idx2] * yCoor[idx1]
    product = mul1 - mul2
    
    acc += product
    
    idx1 += 1
    idx2 += 1
    if(idx2 == 6):idx2 = 0
    print('product = ', product, 'acc = ', acc)
    
print()    
print('acc = ', acc)
acc = -acc / 2
print()
print('acc = ', acc)






    
    
    
idx1 = 0
idx2 = 1
acc = 0

for times in range(6):
    
    dist = math.sqrt((xCoor[idx1] - xCoor[idx2])**2 + (yCoor[idx1] - yCoor[idx2])**2)
    
    S = 0.5*(dist + R_len[idx1] + R_len[idx2])
    
    
    
    print(idx1, idx2, 'dist = ', dist)
    print('=================')
    print('S = ', S)
    
    print('root of s, s-a = ', math.sqrt(S * (S-dist)))
    print('root of s-b, s-c = ', math.sqrt((S-R_len[idx1]) * (S-R_len[idx2])))
    print('=================')
    
    idx1 += 1
    idx2 += 1
    if(idx2 == 6):idx2 = 0
    
    
    