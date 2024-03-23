# -*- coding: utf-8 -*-
"""
Created on Fri Mar 22 08:50:34 2024

@author: Jay
"""
import numpy as np
string1 = "abcdijk lmnop q rstuv"
string2 = "2x1=2 2x2=4 2x3=6"
string3 = "She sees cheese"
string4 = "But she said the butter's bitter"
string5 = "He threw three free throws"

stringArr = ["abcdijk lmnop q rstuv",
             "2x1=2 2x2=4 2x3=6",
             "She sees cheese",
             "But she said the butter's bitter",
             "He threw three free throws"
             ]


matchArray1 = [\
0,
1,
1,
0,
0,
1,
1,
1,
0,
0,
1,
0,
0,
1
]

indexArray1 = [\
0 ,
0 ,
3 ,
0 ,
0 ,
2 ,
8 ,
16,
0 ,
0 ,
20,
0 ,
0 ,
14
]
  
matchArray2 = [\
0,
1,
1,
1,
1,
0,
0,
0,
0,
0,
1
]

indexArray2 = [\
0,
4,
6,
0,
0,
0,
0,
0,
0,
0,
0 # revise
]    

matchArray3 = [\
1,
1,
0,
0,
0,
1,
1,
0,
0
]

indexArray3 = [\
5,
11,
0,
0,
0,
10,
1,
0,
0
]    
    
matchArray4 = [\
0,
1,
1,
1,
0,
0,
0
]

indexArray4 = [\
0,
17,
17, # revise
1,
0,
0,
0
]        

    
matchArray5 = [\
0,
0,
1,
0,
1,
1,
0,
1,
0,
0,
1
]

indexArray5 = [\
0,
0,
15,
0,
10,
5,
0,
12,
0,
0,
15
]
    
    
    

matchArray = [\
matchArray1,
matchArray2,
matchArray3,
matchArray4,
matchArray5
]
    
indexArray = [\
indexArray1,
indexArray2,
indexArray3,
indexArray4,
indexArray5
]    
    
    
f = open("myPattern.txt", 'r')
patArray = []
for item in f.readlines():
    print(item.strip())
    patArray.append(item.strip())
f.close()

#============================================================================
print('--------split-------\n')

patNum = 2

correctArray = []

currentString = stringArr[patNum]


currentString = ' ' + currentString + ' '

testNum = 1
start = 4
end = start + 1
for idx in range(start, end): #len(patArray)  start, end
    currentPattern = patArray[idx]
    
    
    PatternEnd = len(currentPattern) - 1
    stringEnd = len(currentString) - 1
    
    if '*' in currentPattern:isStar = 1
    else:isStar = 0
    
    
    print('currentPattern = ', currentPattern)
    print('PatternEnd = ', PatternEnd)
    print('stringEnd = ', stringEnd)
    
    print('isStar = ', isStar)
    
    print("is Match = ", matchArray1[idx])
    print("match index = ", indexArray1[idx])
    

    print()
    
    patIdx = 0
    strIdx = 0
    
    #finalMatch = True
    
    runTimes = stringEnd - PatternEnd + 1
    
    #slideIdx = 0
    
    matchFlag = 0
    matchIndex = 0
    
    currentPattern = currentPattern.replace("^", " ")
    currentPattern = currentPattern.replace("$", " ")
    
    if(isStar):
        str1, str2 = currentPattern.split("*")
    currentPattern = currentPattern.replace("*", ".")
    
    
    print('new currentPattern = ', currentPattern)
    
    final_Index = 0
    final_match = 0
    
    if isStar == 0:
        for time in range(runTimes):
            matchFlag = 0
            for patIdx in range(len(currentPattern)):
                
                if currentPattern[patIdx] == currentString[time + patIdx] or currentPattern[patIdx] == '.':
                    print("{}, {} Match!!!!".format(currentString[time + patIdx], currentPattern[patIdx]))
                    
                    if(matchFlag == 0):
                        if(currentString[time + patIdx] == ' '):matchIndex = time + patIdx
                        else:matchIndex = time + patIdx - 1
                    matchFlag = 1
                    
                    
                else:
                    matchFlag = 0
                    print("{}, {} mismatch".format(currentString[time + patIdx], currentPattern[patIdx]))
                    break
                
            if(matchFlag):
                
                final_match = matchFlag
                final_Index = matchIndex
                
                break
            #slideIdx += 1
            print("---------------- runTimes = {} --------------".format(time))
            
            
# =============================================================================
#             if((matchFlag == matchArray[patNum][idx] and matchIndex == indexArray[patNum][idx]) or matchArray[patNum][idx] == 0 and matchFlag == 0):
#                 print("PASS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
#                 correctArray.append("PASS")
#                 break
#             else:
#                 print("Failed.....................................")
#                 print("Golden:{}, {} / Your:{}, {}".format(matchArray[patNum][idx], indexArray[patNum][idx], matchFlag, matchIndex))
#                 
#                 if(time == runTimes - 1):correctArray.append("Failed")
# =============================================================================
        
    
    
    else:
        
        insertNum = 0
        exitFlag = 0
        # '''(matchArray[patNum][idx] == 0 and matchFlag == 0) == 0 '''
        while(len(currentString) != len(currentPattern) and exitFlag == 0 ):
            
            currentPattern = str1 + insertNum * '.' + str2
            
            PatternEnd = len(currentPattern) - 1
            stringEnd = len(currentString) - 1
    
            runTimes = stringEnd - PatternEnd + 1        
    
            print("after concatenate = ", currentPattern)
            for time in range(runTimes):
                matchFlag = 0
                for patIdx in range(len(currentPattern)):
                    
                    if currentPattern[patIdx] == currentString[time + patIdx] or currentPattern[patIdx] == '.':
                        print("{}, {} Match!!!!".format(currentString[time + patIdx], currentPattern[patIdx]))
                        
                        if(matchFlag == 0):
                            if(currentString[time] == ' '):matchIndex = time + patIdx
                            else:matchIndex = time - 1
                        matchFlag = 1
                        
                        
                    else:
                        matchFlag = 0
                        print("{}, {} mismatch".format(currentString[time + patIdx], currentPattern[patIdx]))
                        break
                    
                if(matchFlag):
                    
                    final_match = matchFlag
                    final_Index = matchIndex
                    
                    break
# =============================================================================
#                 if((matchFlag == matchArray[patNum][idx] and matchIndex == indexArray[patNum][idx]) or (matchArray[patNum][idx] == 0 and matchFlag == 0) ):
#                     print("PASS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
#                     correctArray.append("PASS")
#                     exitFlag = 1
#                     break
#                 else:
#                     print("Failed.....................................")
#                     print("Golden:{}, {} / Your:{}, {}".format(matchArray[patNum][idx], indexArray[patNum][idx], matchFlag, matchIndex))
#                     print(time , runTimes - 1, len(currentString), len(currentPattern))
#                     if(time == runTimes - 1 and len(currentString) == len(currentPattern)):
#                         correctArray.append("Failed")
# =============================================================================
    
    
            insertNum += 1
    
    
    if((final_match == matchArray[patNum][idx] and final_Index == indexArray[patNum][idx]) or (matchArray[patNum][idx] == 0 and matchFlag == 0) ):
        print("PASS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        correctArray.append("PASS")
    else:
        print("Failed.....................................")
        print("Golden:{}, {} / Your:{}, {}".format(matchArray[patNum][idx], indexArray[patNum][idx], final_match, final_Index))
        correctArray.append("Failed")
    
    

    
# =============================================================================
#     if(isStar):
#         if currentString[0] != '*':
#             
#             while(strIdx <= stringEnd and patIdx <= PatternEnd):
#                 
#                 if(currentString[strIdx] != currentPattern[patIdx] and currentPattern[patIdx] != '*'):
#                     print("mis Match.........", strIdx, patIdx, currentString[strIdx], currentPattern[patIdx])
#                     strIdx += 1
#                     
#                     if(matchFlag == 1):
#                         finalMatch = 0
#                         break
#                     
#                 else:
#                     if(patIdx == 0):
#                         firstMatchIdx = strIdx
#                         
#                     print("Match!!!!!!!", strIdx, patIdx, currentString[strIdx], currentPattern[patIdx])
#                     matchFlag = 1
#                     
#                     if(currentPattern[patIdx] == '*' and (currentPattern[patIdx+1] == currentString[strIdx]) ):
#                         patIdx += 2
#                     elif(currentPattern[patIdx] != '*'):
#                         patIdx += 1
#                     
#                     strIdx += 1
#                 
#     else:
#         pass
# =============================================================================


# =============================================================================
#     while(strIdx <= stringEnd and patIdx <= PatternEnd):
#                 
#         if(currentString[strIdx] != currentPattern[patIdx] and currentPattern[patIdx] != '*'):
#             print("mis Match.........", strIdx, patIdx, currentString[strIdx], currentPattern[patIdx])
#             strIdx += 1
#             
#             if(matchFlag == 1):
#                 finalMatch = 0
#                 break
#             
#         else:
#             if(patIdx == 0):
#                 firstMatchIdx = strIdx
#                 
#             print("Match!!!!!!!", strIdx, patIdx, currentString[strIdx], currentPattern[patIdx])
#             matchFlag = 1
#             
#             if(currentPattern[patIdx] == '*' and (currentPattern[patIdx+1] == currentString[strIdx]) ):
#                 patIdx += 2
#             elif(currentPattern[patIdx] != '*'):
#                 patIdx += 1
#             
#             strIdx += 1
# =============================================================================
    
# =============================================================================
#     if(isCap):
#         patIdx = 1
# 
#     while(strIdx <= stringEnd and patIdx <= PatternEnd):
#         
#         if(isCap and currentString[strIdx] == ' '):
#             finalMatch = True
#             patIdx = 1
#             matchFlag = 0
#         
#         if(currentString[strIdx] != currentPattern[patIdx] and currentPattern[patIdx] != '*'):
#             print(strIdx, patIdx, currentString[strIdx], currentPattern[patIdx], finalMatch, "mis Match.........")
#             strIdx += 1
#             
#             if(matchFlag == 1):
#                 finalMatch = False
#                 #break
#             
#         else:
#             if(patIdx == 0):
#                 firstMatchIdx = strIdx
#                 
#             print(strIdx, patIdx, currentString[strIdx], currentPattern[patIdx], finalMatch, "Match!!!!!!!")
#             matchFlag = 1
#             
#             if(currentPattern[patIdx] == '*' and (currentPattern[patIdx+1] == currentString[strIdx]) ):
#                 patIdx += 2
#             elif(currentPattern[patIdx] != '*'):
#                 patIdx += 1
#             
#             strIdx += 1
#     
#     
#     print("finalMatch = ", finalMatch)
#     if(finalMatch == matchArray5[idx]):
#         print("PASS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n")
#     else:
#         print("Failed.....................................\n\n")
# =============================================================================
        
        
    print('************************ pattern idx = ', idx, ' ************************\n\n')
    




print(correctArray)

if("Failed" in correctArray or len(correctArray) != len(indexArray[patNum])):
    print("Simulation Failed")
    print(len(correctArray), len(indexArray[patNum]))

else:
    print("Simulation PASS!!!!!")







