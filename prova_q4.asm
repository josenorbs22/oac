.text

main:
	addi	$t1, $zero, 1
	addi	$t0, $zero, 2
	addi	$s0, $zero, 3
	addi	$a0, $zero, 4
	addi	$a1, $zero, 3
	addi	$a2, $zero, 2
	addi	$a3, $zero, 1
	jal	subroutine
	nop
	
subroutine:
	sub	$sp, $sp, 12
	sw	$t1, 8($sp)
	sw	$t0, 4($sp)
	sw	$s0, 0($sp)
	add	$t0, $a0, $a1
	add	$t1, $a2, $a3
	sub	$s0, $t0, $t1
	add	$v0, $s0, $zero
	lw	$s0, 0($sp)
	lw	$t0, 4($sp)
	lw	$t1, 8($sp)
	add	$sp, $sp, 12
	jr	$ra