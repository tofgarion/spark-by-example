#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 29 11:06:36 2018

@author: l.creuse
"""

import sys
import re
#import numpy as np

filename = sys.argv[1]

input = open(filename+'.stdout',"r")
output = open(filename+'.stdout.csv',"w")

output.write('analysis,total,altergo,cvc4,z3,unproved\n')
i=0
solvers = dict([('total',0),('altergo' , 1),('CVC4' , 2),('Z3' , 3),('unprooved',4)])
cats = dict([('initialization',0),('check',1),('assertion',2),('loop',3),('precondition',4),('postcondition',5),('contract',6),('total',7)])
cats_names = list(cats.keys())
cats_names.sort(key= lambda x : cats[x])
values = [[0]*5 for i in range(8)]
inline = input.readline()
tokens = list(filter(None,re.split("[ :]",inline)))

print('\n'+filename[9:len(filename)-4])

while tokens[0][0:len(tokens[0])-4] != filename[9:len(filename)-4] :
    inline = input.readline()
    print(inline)
    tokens = list(filter(None,re.split("[ :]",inline)))

while tokens[0][0:len(tokens[0])-4] == filename[9:len(filename)-4] : 
    print(inline)
    if tokens[3] == 'medium' :
        values[7][4] += 1
        inline = input.readline()
        tokens = list(filter(None,re.split("[ :]",inline)))
        continue
    
    cat = tokens[4]
    current = 6
    if cat == 'initialization' :
        values[cats[cat]][0]+=1
    elif cat in ['discriminant','overflow','index','division'] :
        cat = 'check'
        current +=1
    elif cat == 'loop' :
        current += 1 if tokens[5] == 'variant' else 2
    elif cat == 'contract' :
        current +=1
    tokens[current] = tokens[current][1:len(tokens[current])]
    
    while tokens[current][-1] != '\n' :
        if tokens[current] in solvers :
            values[cats[cat]][solvers[tokens[current]]] += int(tokens[current+1])
            values[cats[cat]][0]+= int(tokens[current+1])
            values[7][solvers[tokens[current]]]+= int(tokens[current+1])
            values[7][0]+= int(tokens[current+1])
            current +=1
        current+=1
    inline = input.readline()
    tokens = list(filter(None,re.split("[ :]",inline)))

print("end of statistics for file "+filename[9:len(filename)-4])
           
outline=''

for i in range(8):
    outline = cats_names[i]
    for j in range(5):
        outline +=','+str(values[i][j])
    outline+=',\n'
    output.write(outline)
    
#______________________________________________________
#compile total statistics
#______________________________________________________
output.write('\n')
output.write('analysis,total,altergo,cvc4,z3,unproved\n')

while tokens[0] != 'Summary' : 
    print(inline)
    if tokens[3] == 'medium' :
        values[7][4] += 1
        inline = input.readline()
        tokens = list(filter(None,re.split("[ :]",inline)))
        continue
    cat = tokens[4]
    current = 6
    if cat == 'initialization' :
        values[cats[cat]][0]+=1
    elif cat in ['discriminant','overflow','index','division','range'] :
        cat = 'check'
        current +=1
    elif cat == 'loop' :
        current += 1 if tokens[5] == 'variant' else 2
    elif cat == 'contract' :
        current +=1
    tokens[current] = tokens[current][1:len(tokens[current])]
    
    while tokens[current][-1] != '\n' :
        if tokens[current] in solvers :
            values[cats[cat]][solvers[tokens[current]]] += int(tokens[current+1])
            values[cats[cat]][0]+= int(tokens[current+1])
            values[7][solvers[tokens[current]]]+= int(tokens[current+1])
            values[7][0]+= int(tokens[current+1])
            current +=1
        current+=1
    inline = input.readline()
    tokens = list(filter(None,re.split("[ :]",inline)))
print("end of statistics for the whole progam")
    
outline=''

for i in range(8):
    outline = cats_names[i]
    for j in range(5):
        outline +=','+str(values[i][j])
    outline+=',\n'
    output.write(outline)
input.close()
output.close()
