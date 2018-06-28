#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun 28 11:33:40 2018

@author: l.creuse
"""

import sys

filename = sys.argv[1]

input = open(filename+'.out',"r")
output = open(filename+'.csv',"w")

output.write('analysis,total,flow,interval,altergo,cvc4,z3,unproved\n')
i=0

for line in input:
    i +=1
    if i < 7 : continue
    if i > 14 : break
    tokens = line.split()
    start = 0
    total = 0
    solvers = dict([('altergo' , 0),('CVC4' , 0),('Z3' , 0)])
    outline = tokens[0]
    
    if len(tokens[1]) >= 6 :
        outline = outline +' '+tokens[1]
        start=1
    outline = outline + ','
    
    for k in range(start+1,start+4):
        outline = outline + ('0' if tokens[k][0]=='.' else tokens[k]) + ','
    
    total = 0 if tokens[5+start][0]=='.' else int(tokens[5+start]) 
    k = 6+start
    if total != 0 :
        while tokens[k][0] != '.' :
            if tokens[k][-1] == ')' :
                tokens[k] = tokens[k][1:len(tokens[k])-1]
                solvers[tokens[k]] = total
                k+=1
            else :
                if tokens[k][0] == '(' : tokens[k] = tokens [k][1:]
                red = 2
                if tokens[k+1][-1] == ')' : red = 2
                n=tokens[k+1][:len(tokens[k+1])-red]
                tokens[k+1]=int(n)
                solvers[tokens[k]] = total * tokens[k+1] / 100
                k += 2
        k+=1
    else:
        k+=1
    for key in solvers :       
        outline = outline + str(solvers[key]) + ','
    outline = outline + ('0' if tokens[k][0]=='.' else tokens[k]) + '\n'
    
    
    output.write(outline)
    
output.close()
input.close()
    

