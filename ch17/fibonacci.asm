# fibonacci
.text
.globl main

addiu $t0, 1            #t0 contains second last term
addiu $t1, 1            #t1 contains last term

main:                   #loop begin
addu $t1, $t1, $t0      
j main                  #loop end
subu $t0, $t1, $t0
