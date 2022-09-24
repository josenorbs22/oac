.data
	Array_A: .word 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150
	
.text

main:

	la	$s3, Array_A
	
	lw	$t0, 32($s3)
	add	$t0, $s2, $t0
	sw	$t0, 48($s3)
	
loop:
	j	loop