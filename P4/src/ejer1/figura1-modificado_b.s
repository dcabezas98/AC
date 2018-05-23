	.file	"figura1-modificado_b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"\nTiempo (seg.) = %11.9f\n"
.LC2:
	.string	"R[0] = %i, R[39999] = %i\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	s(%rip), %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	20000(%r14), %r12
	movq	%r14, %rbp
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$1, 0(%rbp)
	addq	$4, %rbp
	cmpq	%r12, %rbp
	jne	.L2
	leaq	40000+s(%rip), %rax
	leaq	-20000(%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$2, (%rbx)
	addq	$4, %rbx
	cmpq	%rax, %rbx
	jne	.L3
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	R(%rip), %r13
	call	clock_gettime@PLT
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%r8d, %edi
	movq	%r14, %rax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	addq	$4, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %esi
	cmpq	%rbp, %rax
	jne	.L5
	movq	%r12, %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rax), %edx
	addq	$4, %rax
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %ecx
	cmpq	%rbx, %rax
	jne	.L6
	cmpl	%esi, %ecx
	cmovg	%esi, %ecx
	movl	%ecx, 0(%r13,%r8,4)
	addq	$1, %r8
	cmpq	$40000, %r8
	jne	.L4
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	159996+R(%rip), %ecx
	movl	0(%r13), %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L15
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	R,160000,32
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
