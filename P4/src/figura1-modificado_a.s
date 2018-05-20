	.file	"figura1-modificado_a.c"
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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	s(%rip), %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%r12, %rbx
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	40000(%r12), %rax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$1, (%rbx)
	movl	$2, 4(%rbx)
	addq	$8, %rbx
	cmpq	%rbx, %rax
	jne	.L2
	xorl	%edi, %edi
	movq	%rsp, %rsi
	leaq	R(%rip), %rbp
	call	clock_gettime@PLT
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edi, %edx
	movq	%r12, %rax
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %esi
	addq	$32, %rax
	leal	(%rdx,%rsi,2), %r9d
	movl	-28(%rax), %esi
	addl	%r9d, %r8d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%esi, %ecx
	movl	-24(%rax), %esi
	leal	(%rdx,%rsi,2), %r9d
	movl	-20(%rax), %esi
	addl	%r8d, %r9d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%ecx, %esi
	movl	-16(%rax), %ecx
	leal	(%rdx,%rcx,2), %r8d
	movl	-12(%rax), %ecx
	addl	%r8d, %r9d
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %esi
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %r8d
	movl	-4(%rax), %ecx
	addl	%r9d, %r8d
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	%rax, %rbx
	jne	.L4
	cmpl	%ecx, %r8d
	cmovle	%r8d, %ecx
	movl	%ecx, 0(%rbp,%rdi,4)
	addq	$1, %rdi
	cmpq	$40000, %rdi
	jne	.L3
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
	movl	0(%rbp), %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L11
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L11:
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
