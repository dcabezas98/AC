	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"\nTiempo (seg.) = %11.9f\n"
.LC4:
	.string	"y[0] = %i, y[%d] = %i\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	leaq	x(%rip), %rcx
	leaq	y(%rip), %rdx
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movdqa	.LC0(%rip), %xmm1
	movdqa	.LC1(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L2:
	movaps	%xmm1, (%rcx,%rax)
	movaps	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$80000, %rax
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	x(%rip), %rdx
	leaq	y(%rip), %rax
	leaq	80000(%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movdqa	(%rdx), %xmm1
	addq	$16, %rdx
	addq	$16, %rax
	movdqa	%xmm1, %xmm0
	pslld	$1, %xmm0
	paddd	%xmm1, %xmm0
	pslld	$11, %xmm0
	psubd	%xmm1, %xmm0
	paddd	-16(%rax), %xmm0
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rcx
	jne	.L3
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC3(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	79996+y(%rip), %r8d
	movl	y(%rip), %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$19999, %ecx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L9
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	7
	.long	7
	.long	7
	.long	7
	.align 16
.LC1:
	.long	63
	.long	63
	.long	63
	.long	63
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
