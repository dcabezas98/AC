	.file	"pmm-secuencial-modificado-a.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4,,15
	.globl	printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	4000(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	.LC0(%rip), %r12
	movq	%rbp, %r14
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%r13, %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$4, %rbx
	call	__printf_chk@PLT
	cmpq	%rbp, %rbx
	jne	.L3
	movl	$10, %edi
	addq	$4, %r13
	call	putchar@PLT
	cmpq	%r14, %r13
	je	.L1
	leaq	4000(%r13), %rbp
	jmp	.L2
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	printMatrix, .-printMatrix
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo = %11.9f\t R[0][0]=%d\t R[N-1][N-1]=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	M1(%rip), %rdx
	leaq	M2(%rip), %rbx
	leaq	R(%rip), %rbp
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
.L9:
	movl	$1, (%rdx,%rax)
	movl	$2, (%rbx,%rax)
	movl	$0, 0(%rbp,%rax)
	addq	$4, %rax
	cmpq	$4000000, %rax
	jne	.L9
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	4000000+R(%rip), %r11
	movq	%rbp, %r8
	leaq	M1(%rip), %r9
	leaq	4000000(%rbx), %rbp
	leaq	4004000(%rbx), %r10
	subq	%rbx, %r8
	subq	%rbx, %r11
.L10:
	movq	%rbp, %rdi
	.p2align 4,,10
	.p2align 3
.L14:
	movl	-4000000(%r8,%rdi), %esi
	leaq	-4000000(%rdi), %rax
	movq	%r9, %rcx
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%rcx), %edx
	addq	$4000, %rax
	addq	$4, %rcx
	imull	-4000(%rax), %edx
	addl	%edx, %esi
	cmpq	%rdi, %rax
	jne	.L11
	leaq	4(%rax), %rdi
	movl	%esi, -4000000(%r8,%rax)
	cmpq	%r10, %rdi
	jne	.L14
	addq	$4000, %r8
	addq	$4000, %r9
	cmpq	%r11, %r8
	jne	.L10
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC2(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	3999996+R(%rip), %ecx
	pxor	%xmm1, %xmm1
	movl	R(%rip), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L19
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.comm	R,4000000,32
	.comm	M2,4000000,32
	.comm	M1,4000000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
