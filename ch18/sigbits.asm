# count significant bits in bit battern

.text
.globl main

lui $8, 0x0029              #register 8 contains bit battern to check for sigbits
ori $8, $8, 0x8D7D

addiu $10, $0, 32           #exit upper loop counter value

ori $5, $0, 0
lui $5, 0x8000              #register number 5 contains bit battern to check for 

loop:
and $4, $8, $5              #if left bit is 1 then exit
beq $4, $5, exit
sll $8, $8, 1               #shift left
beq $1, $10, exit           #if counter is 32 then exit
sll $0, $0, 0
j loop
addiu $1, $1, 1             #increment counter in branch delay slot


exit:
sub $1, $10, $1            #replace the count register with the answer
done:
j done
sll $0, $0, 0
