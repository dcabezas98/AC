	.file	"daxpy.c"
	.globl	a
	.section	.rodata
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	6143
	.comm	y,80000,32
	.comm	x,80000,32
.LC1:
	.string	"\nTiempo (seg.) = %11.9f\n"
.LC2:
	.string	"y[0] = %i, y[%d] = %i\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -60(%rbp)
	jmp	.L2
.L3:
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	movl	$7, (%rdx,%rax)
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	$63, (%rdx,%rax)
	addl	$1, -60(%rbp)
.L2:
	cmpl	$19999, -60(%rbp)
	jle	.L3
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -60(%rbp)
	jmp	.L4
.L5:
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	x(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	$6143, %ecx
	imull	%ecx, %eax
	leal	(%rdx,%rax), %ecx
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	y(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -60(%rbp)
.L4:
	cmpl	$19999, -60(%rbp)
	jle	.L5
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	79996+y(%rip), %edx
	movl	y(%rip), %eax
	movl	%edx, %ecx
	movl	$19999, %edx
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
