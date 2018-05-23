	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\nTiempo (seg.) = %11.9f\n"
.LC2:
	.string	"y[0] = %i, y[%d] = %i\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	x(%rip), %rcx
	leaq	y(%rip), %rdx
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%rcx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rdx, %rbx
.L2:
	movl	$7, (%rcx,%rax)
	movl	$63, (%rdx,%rax)
	addq	$4, %rax
	cmpq	$80000, %rax
	jne	.L2
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L3:
	imull	$6143, 0(%rbp,%rax), %edx
	addl	%edx, (%rbx,%rax)
	addq	$4, %rax
	cmpq	$80000, %rax
	jne	.L3
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	(%rbx), %edx
	movl	79996+y(%rip), %r8d
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$19999, %ecx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.comm	x,80000,32
	.comm	y,80000,32
	.globl	a
	.section	.rodata
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	6143
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
