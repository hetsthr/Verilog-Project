# -*- coding: utf-8 -*-
"""
Created on Sun Mar 22 12:57:38 2020

@author: Het Suthar
"""
#%% Convert Assembly Langauage Program to HEX equivalent
# copy paste your code below and run the script
code = '''addi r7,r7,111
addi r6,r7,111
or r5,r6,r7
sub r4,r6,r5
add r3,r4,r7
andi r0,r3,111
addi r0,r0,101'''
inst = code.split('\n')
file1 = open("myfile.data","w")
for ins in inst:
    a = ins.split()
    b = a[1].split(',')
    hex_code = ''
    imm=False
    
    registers = {
            'r0':'000',
            'r1':'001',
            'r2':'010',
            'r3':'011',
            'r4':'100',
            'r5':'101',
            'r6':'110',
            'r7':'111'
            }
    
    if(a[0] == 'add' or a[0] == 'addi'):
        hex_code += '000'
    elif(a[0] == 'sub' or a[0] == 'subi'):
        hex_code += '001'
    elif(a[0] == 'and' or a[0] == 'andi'):
        hex_code += '010'
    elif(a[0] == 'or' or a[0] == 'ori'):
        hex_code += '011'
    
    if (a[0][-1] == 'i'):
        imm=True
        hex_code += b[2]
    else:
        hex_code += registers[b[2]]
        
    hex_code += registers[b[1]]
    hex_code += registers[b[0]]
    
    if(imm):
        hex_code += '0010'
    else:
        hex_code += '0001'
        
    file1.write(str((hex(int(hex_code,2))))+'\n')  

file1.close()
    