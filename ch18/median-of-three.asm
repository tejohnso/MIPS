# compute median of three words in memory and store the value in menmory

.text
.globl main

lui $1, 0x1000
ori $5, $0, 1

#load first number into $8 and load second number into $9
lw $8, 0($1)
sll $0, $0, 0
lw $9, 4($1)
sll $0, $0, 0
sll $0, $0, 0

#if $9 < $8 swap them
slt $2, $9, $8
beq $2, $5, swap
sll $0, $0, 0

cont:
#load third number into $10
lw $10, 8($1)
sll $0, $0, 0

#if $10 < $8 return $8 else if $10 < $9 return $10 else return $9
slt $2, $10, $8
beq $2, $5, eight
slt $2, $10, $9
beq $2, $5, ten
sll $0, $0, 0
sw $9, 12($1)
sll $0, $0, 0

quit:
j quit
sll $0, $0, 0

swap:
or $2, $0, $8
or $8, $0, $9
j cont
or $9, $0, $2

eight:
sw $8, 12($1)
j quit
sll $0, $0, 0

ten:
sw $10, 12($1)
j quit
sll $0, $0, 0


.data
.word -1
.word -20
.word -3
