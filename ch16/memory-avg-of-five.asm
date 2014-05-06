# Chapter 16 - Retrieve 5 numbers from memory, sotre their avg in memory
.text
.globl main
main:
lui $10,0x1000  #initial memory address is 0x10000000 on MIPS
lbu $11,0($10)
lbu $12,1($10)
lbu $13,2($10)
lbu $14,3($10)
lbu $15,4($10)
addu $11,$11,$12
addu $11,$11,$13
addu $11,$11,$14
addu $11,$11,$15
divu $20,$11,5
sb $20, 0($10)

.data
.byte 12
.byte 97
.byte 133
.byte 82
.byte 236
