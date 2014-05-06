# counting loop
.text
.globl main

addiu $t2, 101          #exit after 101 loops

main:                   #loop begin
addiu $t0, 1            #loop counter register t0
beq $t0, $t2, quit      #branch on exit condition
sll $0, $0, 0           #noop
j main                  #loop end
addu $t1, $t1, $t0      #This is part of the loop.  Executes in pipeline delay

quit: j quit            #endless loop at exit condition
sll $0, $0, 0           #do nothing with the pipeline delay instruction
