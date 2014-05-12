# Compute three sums. Even ints 1-100, ood ints 0-100, all ints 0-100

.text
.globl main

ori $t0, $0, 1              #counter in t0
ori $t1, $0, 0              #all ints in t1
ori $t2, $0, 0              #even in t2
ori $t3, $0, 0              #odd in t3
ori $t4, $0, 100            #loop limit
ori $t5, $0, 0              #compare register for evenness check

loop:                       #main loop
addu $t1, $t1, $t0          #increment the all integer count
andi $t5, $t0, 1            #if counter t0 was odd, $t5 will be 1 otherwise 0
beq $t5, $0, even           #t5 is 0 so jump to even
ori $t5, $0, 0              #branch delay...might as well reset the evenness register
j odd
ori $t5, $0, 0              #branch delay...might as well reset the evenness register
cont:
beq $t0, $t4, quit          #quit if handled integer 100
addiu $t0, $t0, 1           #increment counter in branch delay slot
j loop                      #jump to top of loop
sll $0, $0, 0               #branch delay noop

odd:
j cont
addu $t3, $t3, $t0          #increment odds

even:
j cont
addu $t2, $t2, $t0

quit:
j quit
sll $0, $0, 0
