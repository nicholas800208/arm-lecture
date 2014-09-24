	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
  	mov r1, #1 
.loop:
	ldrex r2, [r0]
	cmp r2, #0
        strexeq r2, r1, [r0]
	cmpeq r2, #0
	bne .loop
	bx lr
        @ END CODE INSERT

	.size lock_mutex, .-lock_mutex
	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	mov r2, #0
	str r1, [r0]
	bx lr        
        @ END CODE INSERT
	
	.size unlock_mutex, .-unlock_mutex

	.end
