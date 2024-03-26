# -*- coding: utf-8 -*-
"""
Created on Mon Mar 25 21:47:59 2024

@author: Jay
"""
my_optimum = 0
resultArray = []
for patIdx in range(6):
    f = open('img'+str(patIdx+1)+'.pattern', 'r')
    
    inputData = []
    for item in f.readlines():
        #print(item.strip())
        inputData.append(item.strip())
    f.close()
    
    
    pointX = []
    pointY = []
    for i in range(len(inputData)):
        if i == 0:
            strSplit = inputData[i].split('=')
            optimum = int(strSplit[1])
            #print('optimum = ', optimum)
        else:
            strSplit = inputData[i].split(' ')
            pointX.append(int(strSplit[0]))
            pointY.append(int(strSplit[1]))
            
    
    
    point1_x = 0
    point1_y = 0
    point2_x = 0
    point2_y = 0
    maximum = 0
    for y in range(16):
        for x in range(16):
            
            num = 0
            for p in range(40):
                dist_square = (pointX[p] - x)**2 + (pointY[p] - y)**2
                
                if(dist_square <= 16):
                    num += 1
                    
            if num >= maximum:
                point1_x = x
                point1_y = y
                maximum = num 
                
    #print('point1 = (x, y) = ', point1_x, point1_y)
    #print('maximum = ', maximum)                
    
    maximum = 0
    for y in range(16):
        for x in range(16):
            
            num = 0
            for p in range(40):
                dist_square1 = (pointX[p] - x)**2 + (pointY[p] - y)**2
                dist_square2 = (pointX[p] - point1_x)**2 + (pointY[p] - point1_y)**2
                if(dist_square1 <= 16 and dist_square2 > 16):
                    num += 1
                    
            if num >= maximum:
                point2_x = x
                point2_y = y
                maximum = num
    
    #print('point2 = (x, y) = ', point2_x, point2_y)
    
    
    
    point1_x_old = point1_x
    point1_y_old = point1_y
    
    point2_x_old = point2_x
    point2_y_old = point2_y
    
    width = 3
    while(1):
    
        #fixed1 find2
        maximum = 0
        for n in range(-width, width+1, 1):
            for m in range(-width, width+1, 1):
                num = 0
                for p in range(40):
                    dist_square1 = (pointX[p] - (point2_x+m))**2 + (pointY[p] - (point2_y+n))**2
                    dist_square2 = (pointX[p] - point1_x)**2 + (pointY[p] - point1_y)**2
                    if(dist_square1 <= 16 and dist_square2 > 16):
                        num += 1
                    
                if num >= maximum:
                    point_xTmp = point2_x+m
                    point_yTmp = point2_y+n
                    maximum = num
    
        point2_x = point_xTmp
        point2_y = point_yTmp
        
        
        #fixed2 find1
        maximum = 0
        for n in range(-width, width+1, 1):
            for m in range(-width, width+1, 1):
                num = 0
                for p in range(40):
                    dist_square1 = (pointX[p] - (point1_x+m))**2 + (pointY[p] - (point1_y+n))**2
                    dist_square2 = (pointX[p] - point2_x)**2 + (pointY[p] - point2_y)**2
                    if(dist_square1 <= 16 and dist_square2 > 16):
                        num += 1
                    
                if num >= maximum:
                    point_xTmp = point1_x+m
                    point_yTmp = point1_y+n
                    maximum = num
    
    
        point1_x = point_xTmp
        point1_y = point_yTmp
        
        if point1_x_old == point1_x and \
            point1_y_old == point1_y and \
            point2_x_old == point2_x and \
            point2_y_old == point2_y:
                print('Finish')
                break
        else:
            point1_x_old = point1_x
            point1_y_old = point1_y
            
            point2_x_old = point2_x
            point2_y_old = point2_y
    
    
    
    
    
    
    
    
    print('point1 = (x, y) = ', point1_x, point1_y)
    print('point2 = (x, y) = ', point2_x, point2_y)
    
    
    my_optimum = 0
    for p in range(40):
        dist_square1 = (pointX[p] - point2_x)**2 + (pointY[p] - point2_y)**2
        dist_square2 = (pointX[p] - point1_x)**2 + (pointY[p] - point1_y)**2
        if(dist_square1 <= 16 or dist_square2 <= 16):
            my_optimum += 1
            
    print('my optimum = ', my_optimum)                    
    if my_optimum == optimum:
        print("PASS!!!!!!")
        resultArray.append("PASS!!!")
    else:
        print('Failed.........')
        resultArray.append("Failed...")
        
    print('------ patIdx = ', patIdx, ' ------ ')

print(resultArray)