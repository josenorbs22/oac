.text

main:
	addi	$a0, $zero, 255
	addi	$a1, $zero, 170
	addi	$a2, $zero, 85
	and	$t0, $a0, $a1
	and	$t1, $a0, $a2
	add	$t3, $t0, $t1
loop:
	j	loop