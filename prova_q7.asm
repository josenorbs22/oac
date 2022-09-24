.text

main:
	addi	$s1, $s1, 5
	mul	$s0, $s1, $s1
	addi	$s2, $s2, 4
	mul	$s0, $s2, $s0
	addi	$s2, $s2, 3
	mul	$s2, $s1, $s2
	add	$s0, $s0, $s2
	
loop:
	j	loop