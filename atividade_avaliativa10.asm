# Autor: José Norberto Fagundes Isaias
# Matrícula: 19202785

.data
	mensagemBebida: .asciiz "Deseja Café(1), Café com leite(2) ou Chocolate Quente(3)?: "
	mensagemCopo: .asciiz "Qual o tamanho do copo? (1 - pequeno; 2 - grande): "
	mensagemAbastecer: .asciiz "Ingredientes insuficientes, favor abastecer a máquina.\n"
	nomeArquivo: .asciiz "recibo.txt"
	bebidaPreparada: .asciiz "Bebida pronta, retire-a por favor.\n"
	cafePequeno: .asciiz "Você comprou um café pequeno. O valor a ser pago é de R$3,00."
	cafeGrande: .asciiz "Você comprou um café grande. O valor a ser pago é de R$5,00."
	leitePequeno: .asciiz "Você comprou um café com leite pequeno. O valor a ser pago é de R$3,50."
	leiteGrande: .asciiz "Você comprou um café com leite grande. O valor a ser pago é de R$6,00."
	chocolatePequeno: .asciiz "Você comprou um chocolate quente pequeno. O valor a ser pago é de R$5,00."
	chocolateGrande: .asciiz "Você comprou um chocolate quente grande. O valor a ser pago é de R$8,50."

.text
	addi $s0, $zero, 1
	addi $s1, $zero, 2
	addi $s2, $zero, 3
	li $s3, 20		#Quantidade de containeres de café incial
	li $s4, 20		#Quantidade de containeres de leite em pó incial
	li $s5, 20		#Quantidade de containeres de chocolate incial
	
	j loop
	
cafe:	beq $s3, $zero, abast
	beq $t1, $s0, cafep
	beq $t1, $s1, cafeg
		
cafep:	subi $s3, $s3, 1
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, cafePequeno
	li $a2, 62
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
cafeg:	subi $s3, $s3, 2
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, cafeGrande
	li $a2, 61
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
	
leite:	beq $s3, $zero, abast
	beq $s4, $zero, abast
	beq $t1, $s0, leitep
	beq $t1, $s1, leiteg
	
leitep:	subi $s3, $s3, 1
	subi $s4, $s4, 1
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, leitePequeno
	li $a2, 72
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
leiteg:	subi $s3, $s3, 2
	subi $s4, $s4, 2
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, leiteGrande
	li $a2, 71
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
choc:	beq $s5, $zero, abast
	beq $t1, $s0, chocp
	beq $t1, $s1, chocg
	
chocp:	subi $s5, $s3, 1
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, chocolatePequeno
	li $a2, 74
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
chocg:	subi $s5, $s3, 2
	li $v0, 13
	la $a0, nomeArquivo
	li $a1, 1
	li $a2, 0
	syscall
	move $t2, $v0
	
	li $v0, 15
	move $a0, $t2
	la $a1, chocolateGrande
	li $a2, 73
	syscall
	
	li $v0, 16
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, bebidaPreparada
	syscall
	
	j loop
	
abast:	li $v0, 4
	la $a0, mensagemAbastecer
	syscall

loop:	li $v0, 4
	la $a0, mensagemBebida
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, mensagemCopo
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	beq $t0, $s0, cafe
	beq $t0, $s1, leite
	beq $t0, $s2, choc
	
