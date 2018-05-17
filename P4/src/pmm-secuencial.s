	.file	"pmm-secuencial.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Tiempo = %11.9f\t R[0][0]=%d\t R[N-1][N-1]=%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	M1(%rip), %rcx
	leaq	M2(%rip), %rbp
	leaq	R(%rip), %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	4000(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$1, (%rcx,%rax)
	movl	$2, 0(%rbp,%rax)
	movl	$0, (%rbx,%rax)
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L2
	cmpq	$4000000, %rax
	jne	.L3
	movq	%rsp, %rsi
	xorl	%edi, %edi
	subq	%rbp, %rbx
	movl	$1000, j(%rip)
	movl	$1000, i(%rip)
	call	clock_gettime@PLT
	leaq	4000000+R(%rip), %r11
	movq	%rbx, %r8
	leaq	M1(%rip), %r9
	leaq	4000000(%rbp), %rbx
	leaq	4004000(%rbp), %r10
	subq	%rbp, %r11
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	-4000000(%r8,%rdi), %esi
	leaq	-4000000(%rdi), %rax
	movq	%r9, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rcx), %edx
	addq	$4000, %rax
	addq	$4, %rcx
	imull	-4000(%rax), %edx
	addl	%edx, %esi
	cmpq	%rdi, %rax
	jne	.L4
	leaq	4(%rax), %rdi
	movl	%esi, -4000000(%r8,%rax)
	cmpq	%rdi, %r10
	jne	.L5
	addq	$4000, %r8
	addq	$4000, %r9
	cmpq	%r11, %r8
	jne	.L6
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$1000, k(%rip)
	movl	$1000, j(%rip)
	movl	$1000, i(%rip)
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
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
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L15
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	suma,4,4
	.comm	k,4,4
	.comm	j,4,4
	.comm	i,4,4
	.comm	ii,4,4
	.comm	R,4000000,32
	.comm	M2,4000000,32
	.comm	M1,4000000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
