	.file	"next_pow.c"
	.text
	.p2align 4
	.globl	next_pow2
	.type	next_pow2, @function
next_pow2:
.LFB25:
	.cfi_startproc
	endbr64
	bsrq	%rdi, %rdi
	movl	$64, %ecx
	movl	$1, %eax
	xorq	$63, %rdi
	subl	%edi, %ecx
	salq	%cl, %rax
	ret
	.cfi_endproc
.LFE25:
	.size	next_pow2, .-next_pow2
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s need 1 argument.\n"
.LC1:
	.string	"%s is not an integer.\n"
.LC2:
	.string	"%ld's next pow2 is %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$2, %edi
	jne	.L14
	movq	8(%rsi), %rbp
	movsbq	0(%rbp), %rbx
	testb	%bl, %bl
	je	.L6
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movq	%rbp, %rax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	movsbq	1(%rax), %rbx
	addq	$1, %rax
	testb	%bl, %bl
	je	.L6
.L8:
	testb	$8, 1(%rdx,%rbx,2)
	jne	.L7
	movq	%rbp, %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L5:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movl	$10, %edx
	call	strtoll@PLT
	movl	$64, %ecx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdx
	bsrq	%rax, %rax
	xorq	$63, %rax
	subl	%eax, %ecx
	movl	$1, %eax
	salq	%cl, %rax
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L14:
	movq	(%rsi), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L5
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
