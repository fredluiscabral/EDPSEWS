	.file	"EQ_CALOR_EXPL_2D_NAIVE_HIBcr.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB2727:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE2727:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	main._omp_fn.3, @function
main._omp_fn.3:
.LFB3803:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %ebx
	movq	nN(%rip), %rax
	cltd
	idivl	%r12d
	cmpl	%edx, %ebx
	jl	.L4
.L10:
	imull	%eax, %ebx
	addl	%edx, %ebx
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	jge	.L14
	movq	N(%rip), %rcx
	movl	NP(%rip), %r8d
	incl	%ebx
	movq	8(%rbp), %r15
	movq	0(%rbp), %rsi
	leaq	-2(%rcx), %r9
	movq	m(%rip), %rdi
	leal	1(%r8), %r13d
	testl	%r9d, %r9d
	jle	.L14
	movl	%ebx, %r12d
	incl	%eax
	movslq	%ebx, %r10
	vmovsd	.LC0(%rip), %xmm5
	imull	%r13d, %r12d
	movl	%eax, 12(%rsp)
	leaq	1(%rdi,%r10), %r14
	vmovsd	.LC1(%rip), %xmm4
	addl	%r12d, %r9d
	.p2align 4,,10
	.p2align 3
.L7:
	movslq	%r12d, %rax
	addl	%r13d, %r12d
	movq	%r14, %rdx
	movl	%eax, %r11d
	leal	1(%r12), %ebp
	subl	%r13d, %r11d
	subl	%eax, %ebp
	incl	%r11d
	subl	%eax, %r11d
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rdx, %rdi
	shrq	$63, %rdi
	leaq	(%rdx,%rdi), %rcx
	andl	$1, %ecx
	subq	%rdi, %rcx
	leal	1(%rax), %edi
	cmpq	$1, %rcx
	jne	.L8
	leal	0(%rbp,%rax), %r8d
	movslq	%edi, %rcx
	vmovsd	alfa(%rip), %xmm1
	vmovsd	beta_coef(%rip), %xmm3
	movslq	%r8d, %r10
	leal	(%r11,%rax), %r8d
	vmovsd	(%rsi,%r10,8), %xmm0
	movslq	%r8d, %r8
	leal	2(%rax), %r10d
	vaddsd	%xmm3, %xmm1, %xmm8
	vaddsd	(%rsi,%r8,8), %xmm0, %xmm6
	movslq	%r10d, %r8
	vmovsd	(%rsi,%r8,8), %xmm2
	vaddsd	(%rsi,%rax,8), %xmm2, %xmm7
	vfmadd213sd	(%r15,%rcx,8), %xmm3, %xmm7
	vfmadd132sd	%xmm5, %xmm4, %xmm8
	vfmadd132sd	%xmm1, %xmm7, %xmm6
	vdivsd	%xmm8, %xmm6, %xmm9
	vmovsd	%xmm9, (%rsi,%rcx,8)
.L8:
	movslq	%edi, %rax
	incq	%rdx
	cmpl	%eax, %r9d
	jne	.L9
	incl	%ebx
	addl	%r13d, %r9d
	incq	%r14
	cmpl	12(%rsp), %ebx
	jne	.L7
.L14:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	incl	%eax
	xorl	%edx, %edx
	jmp	.L10
	.cfi_endproc
.LFE3803:
	.size	main._omp_fn.3, .-main._omp_fn.3
	.p2align 4
	.type	main._omp_fn.2, @function
main._omp_fn.2:
.LFB3802:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	addq	$-128, %rsp
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %ecx
	movq	nN(%rip), %rax
	cltd
	idivl	%r12d
	cmpl	%edx, %ecx
	jl	.L17
.L40:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jge	.L75
	movq	N(%rip), %rdi
	movq	(%rbx), %rsi
	leal	1(%rdx), %r15d
	movl	NP(%rip), %r11d
	movq	m(%rip), %r10
	leaq	-2(%rdi), %r8
	movq	%rsi, 80(%rsp)
	movq	8(%rbx), %rcx
	incl	%r11d
	movl	%r8d, 60(%rsp)
	movl	%r8d, %r9d
	movq	%r10, 88(%rsp)
	movl	%r11d, 56(%rsp)
	testl	%r8d, %r8d
	jle	.L75
	leal	-1(%r8), %r14d
	movl	%r8d, 48(%rsp)
	movl	%r14d, 52(%rsp)
	cmpl	$2, %r14d
	jbe	.L22
	cmpl	$2147483647, %r8d
	je	.L22
	movl	%r8d, %r13d
	incl	%eax
	movl	%r8d, %ebx
	vmovdqa	.LC4(%rip), %ymm15
	andl	$-8, %r13d
	imull	%r15d, %r11d
	movl	%eax, 44(%rsp)
	shrl	$3, %ebx
	subl	%r13d, %r9d
	leal	1(%r13), %r12d
	movl	%r13d, 40(%rsp)
	vmovapd	.LC5(%rip), %ymm8
	leal	-1(%r9), %eax
	movl	%r12d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%r11d, %r14d
	movl	%eax, 28(%rsp)
	.p2align 4,,10
	.p2align 3
.L36:
	movl	56(%rsp), %esi
	movl	%r14d, %edx
	movl	%r14d, 64(%rsp)
	movl	%edx, %eax
	subl	%esi, %eax
	addl	%esi, %r14d
	cmpl	$6, 52(%rsp)
	movl	%eax, 68(%rsp)
	jbe	.L41
	movslq	%edx, %r13
	vmovd	%r15d, %xmm7
	cltq
	movslq	%r14d, %r12
	vpbroadcastd	%xmm7, %ymm0
	movq	%rax, 72(%rsp)
	xorl	%edx, %edx
	vpxor	%xmm11, %xmm11, %xmm11
	leaq	8(%rcx,%rax,8), %r8
	vmovdqa	%ymm0, 96(%rsp)
	xorl	%eax, %eax
	leaq	8(,%r13,8), %r11
	leaq	(%rcx,%r11), %r10
	leaq	8(%rcx,%r11), %rdi
	vpbroadcastq	88(%rsp), %ymm12
	vmovdqa	.LC2(%rip), %ymm9
	leaq	-8(%rcx,%r11), %rsi
	leaq	8(%rcx,%r12,8), %r9
	addq	80(%rsp), %r11
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L24:
	vptest	%ymm0, %ymm0
	jne	.L77
.L25:
	incl	%edx
	addq	$64, %rax
	cmpl	%edx, %ebx
	jbe	.L78
.L26:
	vmovdqa	%ymm9, %ymm1
	vpaddd	96(%rsp), %ymm1, %ymm2
	vpaddd	.LC3(%rip), %ymm9, %ymm9
	vextracti128	$0x1, %ymm2, %xmm6
	vpmovsxdq	%xmm2, %ymm3
	vpmovsxdq	%xmm6, %ymm10
	vpaddq	%ymm12, %ymm3, %ymm4
	vpaddq	%ymm12, %ymm10, %ymm13
	vpand	%ymm15, %ymm4, %ymm5
	vbroadcastsd	alfa(%rip), %ymm10
	vpand	%ymm15, %ymm13, %ymm14
	vpcmpeqq	%ymm11, %ymm5, %ymm1
	vmaskmovpd	(%r8,%rax), %ymm1, %ymm4
	vmaskmovpd	(%rsi,%rax), %ymm1, %ymm13
	vpcmpeqq	%ymm11, %ymm14, %ymm0
	vmaskmovpd	(%r9,%rax), %ymm1, %ymm3
	vmaskmovpd	32(%r8,%rax), %ymm0, %ymm5
	vaddpd	%ymm4, %ymm3, %ymm3
	vmaskmovpd	32(%r9,%rax), %ymm0, %ymm2
	vaddpd	%ymm5, %ymm2, %ymm2
	vmaskmovpd	32(%rsi,%rax), %ymm0, %ymm4
	vmaskmovpd	(%rdi,%rax), %ymm1, %ymm5
	vmaskmovpd	32(%rdi,%rax), %ymm0, %ymm14
	vaddpd	%ymm13, %ymm5, %ymm5
	vaddpd	%ymm4, %ymm14, %ymm14
	vmaskmovpd	(%r10,%rax), %ymm1, %ymm7
	vmaskmovpd	32(%r10,%rax), %ymm0, %ymm6
	vfnmadd231pd	%ymm8, %ymm7, %ymm3
	vptest	%ymm1, %ymm1
	vbroadcastsd	beta_coef(%rip), %ymm13
	vfnmadd231pd	%ymm8, %ymm6, %ymm2
	vfnmadd231pd	%ymm8, %ymm6, %ymm14
	vfnmadd231pd	%ymm8, %ymm7, %ymm5
	vmulpd	%ymm13, %ymm14, %ymm4
	vmulpd	%ymm13, %ymm5, %ymm14
	vfmadd132pd	%ymm10, %ymm4, %ymm2
	vfmadd132pd	%ymm10, %ymm14, %ymm3
	vaddpd	%ymm2, %ymm6, %ymm6
	vaddpd	%ymm3, %ymm7, %ymm7
	je	.L24
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%r11,%rax)
	je	.L25
	.p2align 4,,10
	.p2align 3
.L77:
	incl	%edx
	vmaskmovpd	%ymm6, %ymm0, 32(%r11,%rax)
	addq	$64, %rax
	cmpl	%edx, %ebx
	ja	.L26
	.p2align 4,,10
	.p2align 3
.L78:
	movl	40(%rsp), %r9d
	cmpl	%r9d, 48(%rsp)
	je	.L27
	cmpl	$2, 28(%rsp)
	movl	32(%rsp), %esi
	jbe	.L42
	movl	36(%rsp), %r11d
.L23:
	vmovd	%r11d, %xmm11
	vmovd	%r15d, %xmm1
	movq	72(%rsp), %r10
	leaq	1(%r9,%r13), %r13
	vpshufd	$0, %xmm11, %xmm9
	vpshufd	$0, %xmm1, %xmm2
	salq	$3, %r13
	vpaddd	.LC6(%rip), %xmm9, %xmm0
	leaq	1(%r9,%r12), %r12
	vmovddup	88(%rsp), %xmm12
	vpxor	%xmm7, %xmm7, %xmm7
	leaq	(%rcx,%r13), %rdi
	vpaddd	%xmm2, %xmm0, %xmm10
	leaq	1(%r9,%r10), %r9
	vmovddup	beta_coef(%rip), %xmm5
	vmovddup	alfa(%rip), %xmm13
	vpsrldq	$8, %xmm10, %xmm6
	vpmovsxdq	%xmm10, %xmm3
	leaq	(%rcx,%r12,8), %r8
	movq	80(%rsp), %r12
	vpmovsxdq	%xmm6, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm4
	vpand	.LC7(%rip), %xmm4, %xmm14
	vpaddq	%xmm12, %xmm11, %xmm12
	vpand	.LC7(%rip), %xmm12, %xmm9
	leaq	8(%rcx,%r13), %rdx
	addq	%r13, %r12
	leaq	(%rcx,%r9,8), %rax
	vpcmpeqq	%xmm7, %xmm14, %xmm1
	vmaskmovpd	(%rdi), %xmm1, %xmm4
	vmaskmovpd	(%r8), %xmm1, %xmm3
	vpcmpeqq	%xmm7, %xmm9, %xmm0
	vmaskmovpd	(%rax), %xmm1, %xmm7
	vmaskmovpd	(%rdx), %xmm0, %xmm12
	vaddpd	%xmm7, %xmm3, %xmm9
	vmaskmovpd	16(%rdi), %xmm0, %xmm14
	vmaskmovpd	16(%rax), %xmm0, %xmm10
	vmaskmovpd	(%rdx), %xmm1, %xmm3
	vmaskmovpd	16(%r8), %xmm0, %xmm2
	vmaskmovpd	16(%rdx), %xmm0, %xmm6
	vaddpd	%xmm10, %xmm2, %xmm2
	vaddpd	%xmm12, %xmm6, %xmm7
	vmaskmovpd	-8(%rcx,%r13), %xmm1, %xmm11
	vfnmadd231pd	.LC8(%rip), %xmm14, %xmm7
	vaddpd	%xmm11, %xmm3, %xmm10
	vfnmadd231pd	.LC8(%rip), %xmm4, %xmm10
	vptest	%xmm1, %xmm1
	vfnmadd231pd	.LC8(%rip), %xmm4, %xmm9
	vfnmadd231pd	.LC8(%rip), %xmm14, %xmm2
	vmulpd	%xmm5, %xmm7, %xmm3
	vmulpd	%xmm5, %xmm10, %xmm5
	vfmadd132pd	%xmm13, %xmm3, %xmm2
	vfmadd132pd	%xmm13, %xmm5, %xmm9
	vaddpd	%xmm9, %xmm4, %xmm13
	vaddpd	%xmm2, %xmm14, %xmm4
	jne	.L79
.L29:
	vptest	%xmm0, %xmm0
	jne	.L80
.L30:
	movl	%esi, %r13d
	andl	$-4, %r13d
	leal	0(%r13,%r11), %eax
	cmpl	%r13d, %esi
	je	.L27
.L28:
	movq	88(%rsp), %rsi
	leal	(%r15,%rax), %r11d
	addq	%rsi, %r11
	andl	$1, %r11d
	jne	.L32
	movl	64(%rsp), %edi
	movl	68(%rsp), %r9d
	leal	(%r14,%rax), %r12d
	movslq	%r12d, %r13
	vmovsd	.LC0(%rip), %xmm2
	movq	80(%rsp), %r11
	leal	(%rdi,%rax), %r8d
	addl	%eax, %r9d
	movslq	%r8d, %r10
	movslq	%r9d, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	vmovsd	-8(%rcx,%r10,8), %xmm9
	vaddsd	(%rcx,%r13,8), %xmm1, %xmm0
	vaddsd	8(%rcx,%r10,8), %xmm9, %xmm6
	vmovsd	(%rcx,%r10,8), %xmm14
	vfnmadd231sd	%xmm2, %xmm14, %xmm0
	vfnmadd132sd	%xmm14, %xmm6, %xmm2
	vmulsd	beta_coef(%rip), %xmm2, %xmm11
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm14, %xmm0, %xmm12
	vmovsd	%xmm12, (%r11,%r10,8)
.L32:
	leal	1(%rax), %r8d
	cmpl	%r8d, 60(%rsp)
	jl	.L27
	movq	88(%rsp), %rdi
	leal	(%r15,%r8), %esi
	addq	%rdi, %rsi
	andl	$1, %esi
	jne	.L33
	movl	64(%rsp), %r10d
	leal	(%r14,%r8), %edx
	movslq	%edx, %r13
	leal	(%r10,%r8), %r9d
	addl	68(%rsp), %r8d
	vmovsd	(%rcx,%r13,8), %xmm10
	movslq	%r9d, %r12
	movslq	%r8d, %r11
	movq	80(%rsp), %r8
	vmovsd	(%rcx,%r12,8), %xmm7
	vmovsd	8(%rcx,%r12,8), %xmm5
	vaddsd	-8(%rcx,%r12,8), %xmm5, %xmm13
	vaddsd	(%rcx,%r11,8), %xmm10, %xmm3
	vfnmadd231sd	.LC0(%rip), %xmm7, %xmm13
	vfnmadd231sd	.LC0(%rip), %xmm7, %xmm3
	vmulsd	beta_coef(%rip), %xmm13, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm3
	vaddsd	%xmm7, %xmm3, %xmm14
	vmovsd	%xmm14, (%r8,%r12,8)
.L33:
	addl	$2, %eax
	cmpl	%eax, 60(%rsp)
	jl	.L27
	movq	88(%rsp), %rdi
	leal	(%r15,%rax), %esi
	addq	%rdi, %rsi
	andl	$1, %esi
	jne	.L27
	movl	64(%rsp), %r10d
	leal	(%r14,%rax), %r12d
	movslq	%r12d, %rdx
	addl	%eax, %r10d
	addl	68(%rsp), %eax
	vmovsd	(%rcx,%rdx,8), %xmm1
	movslq	%r10d, %r9
	cltq
	vmovsd	(%rcx,%r9,8), %xmm2
	vmovsd	8(%rcx,%r9,8), %xmm9
	vaddsd	-8(%rcx,%r9,8), %xmm9, %xmm6
	vaddsd	(%rcx,%rax,8), %xmm1, %xmm0
	vfnmadd231sd	.LC0(%rip), %xmm2, %xmm6
	movq	80(%rsp), %rax
	vmulsd	beta_coef(%rip), %xmm6, %xmm11
	vfnmadd231sd	.LC0(%rip), %xmm2, %xmm0
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm12
	vmovsd	%xmm12, (%rax,%r9,8)
.L27:
	incl	%r15d
	cmpl	%r15d, 44(%rsp)
	jne	.L36
	vzeroupper
.L75:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	.cfi_restore_state
	vmaskmovpd	%xmm4, %xmm0, 16(%r12)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L79:
	vmaskmovpd	%xmm13, %xmm1, (%r12)
	jmp	.L29
.L41:
	movslq	68(%rsp), %rdi
	movl	48(%rsp), %esi
	xorl	%r9d, %r9d
	movslq	%r14d, %r12
	movslq	64(%rsp), %r13
	movl	$1, %r11d
	movq	%rdi, 72(%rsp)
	jmp	.L23
.L42:
	movl	36(%rsp), %eax
	jmp	.L28
.L17:
	incl	%eax
	xorl	%edx, %edx
	jmp	.L40
.L22:
	movl	56(%rsp), %r12d
	leal	2(%rdx), %r13d
	movq	88(%rsp), %rbx
	incl	%eax
	movslq	%r15d, %r14
	movl	%eax, 72(%rsp)
	vmovsd	.LC0(%rip), %xmm0
	imull	%r12d, %r13d
	movl	%r12d, %r10d
	movl	%r15d, 96(%rsp)
	leaq	1(%rbx,%r14), %r11
	imull	%r15d, %r10d
	movq	80(%rsp), %rbx
	imull	%r12d, %edx
	movl	%r13d, 88(%rsp)
	leal	1(%r10,%r8), %edi
	movl	%edx, %r14d
	.p2align 4,,10
	.p2align 3
.L39:
	movl	88(%rsp), %r8d
	leal	1(%r10), %eax
	movl	%edi, %r15d
	movl	%r14d, %r9d
	subl	%eax, %r15d
	movq	%r11, %rdx
	subl	%r10d, %r9d
	subl	%r10d, %r8d
	andl	$3, %r15d
	je	.L38
	cmpl	$1, %r15d
	je	.L64
	cmpl	$2, %r15d
	je	.L65
	testb	$1, %r11b
	jne	.L49
	movslq	%eax, %r13
	leal	(%r8,%rax), %esi
	vmovsd	(%rcx,%r13,8), %xmm15
	leaq	0(,%r13,8), %rdx
	leal	(%r9,%rax), %r13d
	movslq	%esi, %r15
	vmovsd	8(%rcx,%rdx), %xmm10
	movslq	%r13d, %rsi
	vaddsd	-8(%rcx,%rdx), %xmm10, %xmm3
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%rsi,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%rdx)
.L49:
	leaq	1(%r11), %rdx
	incl	%eax
.L65:
	testb	$1, %dl
	jne	.L52
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm5
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm14
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm14, %xmm2
	vmovsd	(%rcx,%r15,8), %xmm13
	vaddsd	(%rcx,%r13,8), %xmm13, %xmm4
	vfnmadd231sd	%xmm0, %xmm5, %xmm2
	vfmadd132sd	beta_coef(%rip), %xmm5, %xmm2
	vfnmadd231sd	%xmm0, %xmm5, %xmm4
	vfmadd132sd	alfa(%rip), %xmm2, %xmm4
	vmovsd	%xmm4, (%rbx,%rsi)
.L52:
	incq	%rdx
	incl	%eax
.L64:
	testb	$1, %dl
	jne	.L55
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm9
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm11
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm11, %xmm12
	vmovsd	(%rcx,%r15,8), %xmm1
	vaddsd	(%rcx,%r13,8), %xmm1, %xmm6
	vfnmadd231sd	%xmm0, %xmm9, %xmm12
	vfmadd132sd	beta_coef(%rip), %xmm9, %xmm12
	vfnmadd231sd	%xmm0, %xmm9, %xmm6
	vfmadd132sd	alfa(%rip), %xmm12, %xmm6
	vmovsd	%xmm6, (%rbx,%rsi)
.L55:
	incl	%eax
	incq	%rdx
	cmpl	%edi, %eax
	je	.L72
.L38:
	testb	$1, %dl
	jne	.L37
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm15
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm10
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm10, %xmm3
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%r13,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%rsi)
.L37:
	leaq	1(%rdx), %rsi
	incl	%eax
	andl	$1, %edx
	je	.L58
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm5
	leaq	0(,%r15,8), %rdx
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rdx), %xmm14
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rdx), %xmm14, %xmm2
	vmovsd	(%rcx,%r15,8), %xmm13
	vaddsd	(%rcx,%r13,8), %xmm13, %xmm4
	vfnmadd231sd	%xmm0, %xmm5, %xmm2
	vfmadd132sd	beta_coef(%rip), %xmm5, %xmm2
	vfnmadd231sd	%xmm0, %xmm5, %xmm4
	vfmadd132sd	alfa(%rip), %xmm2, %xmm4
	vmovsd	%xmm4, (%rbx,%rdx)
.L58:
	leal	1(%rax), %edx
	testb	$1, %sil
	je	.L60
	movslq	%edx, %r15
	vmovsd	(%rcx,%r15,8), %xmm9
	leaq	0(,%r15,8), %r13
	leal	(%r8,%rdx), %r15d
	addl	%r9d, %edx
	vmovsd	8(%rcx,%r13), %xmm11
	movslq	%r15d, %r15
	vaddsd	-8(%rcx,%r13), %xmm11, %xmm12
	movslq	%edx, %rdx
	vmovsd	(%rcx,%r15,8), %xmm1
	vaddsd	(%rcx,%rdx,8), %xmm1, %xmm6
	vfnmadd231sd	%xmm0, %xmm9, %xmm12
	vfmadd132sd	beta_coef(%rip), %xmm9, %xmm12
	vfnmadd231sd	%xmm0, %xmm9, %xmm6
	vfmadd132sd	alfa(%rip), %xmm12, %xmm6
	vmovsd	%xmm6, (%rbx,%r13)
.L60:
	leal	2(%rax), %edx
	testb	$1, %sil
	jne	.L62
	movslq	%edx, %r15
	vmovsd	(%rcx,%r15,8), %xmm15
	leaq	0(,%r15,8), %r13
	leal	(%r8,%rdx), %r15d
	addl	%r9d, %edx
	vmovsd	8(%rcx,%r13), %xmm10
	movslq	%r15d, %r15
	vaddsd	-8(%rcx,%r13), %xmm10, %xmm3
	movslq	%edx, %rdx
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%rdx,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%r13)
.L62:
	addl	$3, %eax
	leaq	3(%rsi), %rdx
	cmpl	%edi, %eax
	jne	.L38
.L72:
	incl	96(%rsp)
	incq	%r11
	movl	96(%rsp), %eax
	addl	%r12d, %r10d
	addl	%r12d, 88(%rsp)
	addl	%r12d, %r14d
	addl	%r12d, %edi
	cmpl	72(%rsp), %eax
	jne	.L39
	jmp	.L75
	.cfi_endproc
.LFE3802:
	.size	main._omp_fn.2, .-main._omp_fn.2
	.p2align 4
	.type	main._omp_fn.1, @function
main._omp_fn.1:
.LFB3801:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %ebx
	movq	nN(%rip), %rax
	cltd
	idivl	%r12d
	cmpl	%edx, %ebx
	jl	.L82
.L88:
	imull	%eax, %ebx
	addl	%edx, %ebx
	addl	%ebx, %eax
	cmpl	%eax, %ebx
	jge	.L92
	movq	N(%rip), %rcx
	movl	NP(%rip), %r8d
	incl	%ebx
	movq	8(%rbp), %rsi
	movq	0(%rbp), %r15
	leaq	-2(%rcx), %r9
	movq	m(%rip), %rdi
	leal	1(%r8), %r13d
	testl	%r9d, %r9d
	jle	.L92
	movl	%ebx, %r12d
	incl	%eax
	movslq	%ebx, %r10
	vmovsd	.LC0(%rip), %xmm5
	imull	%r13d, %r12d
	movl	%eax, 12(%rsp)
	leaq	1(%rdi,%r10), %r14
	vmovsd	.LC1(%rip), %xmm4
	addl	%r12d, %r9d
	.p2align 4,,10
	.p2align 3
.L85:
	movslq	%r12d, %rax
	addl	%r13d, %r12d
	movq	%r14, %rdx
	movl	%eax, %r11d
	leal	1(%r12), %ebp
	subl	%r13d, %r11d
	subl	%eax, %ebp
	incl	%r11d
	subl	%eax, %r11d
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rdx, %rdi
	shrq	$63, %rdi
	leaq	(%rdx,%rdi), %rcx
	andl	$1, %ecx
	subq	%rdi, %rcx
	leal	1(%rax), %edi
	cmpq	$1, %rcx
	jne	.L86
	leal	0(%rbp,%rax), %r8d
	movslq	%edi, %rcx
	vmovsd	alfa(%rip), %xmm1
	vmovsd	beta_coef(%rip), %xmm3
	movslq	%r8d, %r10
	leal	(%r11,%rax), %r8d
	vmovsd	(%rsi,%r10,8), %xmm0
	movslq	%r8d, %r8
	leal	2(%rax), %r10d
	vaddsd	%xmm3, %xmm1, %xmm8
	vaddsd	(%rsi,%r8,8), %xmm0, %xmm6
	movslq	%r10d, %r8
	vmovsd	(%rsi,%r8,8), %xmm2
	vaddsd	(%rsi,%rax,8), %xmm2, %xmm7
	vfmadd213sd	(%r15,%rcx,8), %xmm3, %xmm7
	vfmadd132sd	%xmm5, %xmm4, %xmm8
	vfmadd132sd	%xmm1, %xmm7, %xmm6
	vdivsd	%xmm8, %xmm6, %xmm9
	vmovsd	%xmm9, (%rsi,%rcx,8)
.L86:
	movslq	%edi, %rax
	incq	%rdx
	cmpl	%eax, %r9d
	jne	.L87
	incl	%ebx
	addl	%r13d, %r9d
	incq	%r14
	cmpl	12(%rsp), %ebx
	jne	.L85
.L92:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L82:
	.cfi_restore_state
	incl	%eax
	xorl	%edx, %edx
	jmp	.L88
	.cfi_endproc
.LFE3801:
	.size	main._omp_fn.1, .-main._omp_fn.1
	.p2align 4
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB3800:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	andq	$-32, %rsp
	addq	$-128, %rsp
	call	omp_get_num_threads
	movl	%eax, %r12d
	call	omp_get_thread_num
	movl	%eax, %ecx
	movq	nN(%rip), %rax
	cltd
	idivl	%r12d
	cmpl	%edx, %ecx
	jl	.L95
.L118:
	imull	%eax, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	cmpl	%eax, %edx
	jge	.L153
	movq	N(%rip), %rdi
	movq	8(%rbx), %rsi
	leal	1(%rdx), %r15d
	movl	NP(%rip), %r11d
	movq	m(%rip), %r10
	leaq	-2(%rdi), %r8
	movq	%rsi, 80(%rsp)
	movq	(%rbx), %rcx
	incl	%r11d
	movl	%r8d, 60(%rsp)
	movl	%r8d, %r9d
	movq	%r10, 88(%rsp)
	movl	%r11d, 56(%rsp)
	testl	%r8d, %r8d
	jle	.L153
	leal	-1(%r8), %r14d
	movl	%r8d, 48(%rsp)
	movl	%r14d, 52(%rsp)
	cmpl	$2, %r14d
	jbe	.L100
	cmpl	$2147483647, %r8d
	je	.L100
	movl	%r8d, %r13d
	incl	%eax
	movl	%r8d, %ebx
	vmovdqa	.LC4(%rip), %ymm15
	andl	$-8, %r13d
	imull	%r15d, %r11d
	movl	%eax, 44(%rsp)
	shrl	$3, %ebx
	subl	%r13d, %r9d
	leal	1(%r13), %r12d
	movl	%r13d, 40(%rsp)
	vmovapd	.LC5(%rip), %ymm8
	leal	-1(%r9), %eax
	movl	%r12d, 36(%rsp)
	movl	%r9d, 32(%rsp)
	movl	%r11d, %r14d
	movl	%eax, 28(%rsp)
	.p2align 4,,10
	.p2align 3
.L114:
	movl	56(%rsp), %esi
	movl	%r14d, %edx
	movl	%r14d, 64(%rsp)
	movl	%edx, %eax
	subl	%esi, %eax
	addl	%esi, %r14d
	cmpl	$6, 52(%rsp)
	movl	%eax, 68(%rsp)
	jbe	.L119
	movslq	%edx, %r13
	vmovd	%r15d, %xmm7
	cltq
	movslq	%r14d, %r12
	vpbroadcastd	%xmm7, %ymm0
	movq	%rax, 72(%rsp)
	xorl	%edx, %edx
	vpxor	%xmm11, %xmm11, %xmm11
	leaq	8(%rcx,%rax,8), %r8
	vmovdqa	%ymm0, 96(%rsp)
	xorl	%eax, %eax
	leaq	8(,%r13,8), %r11
	leaq	(%rcx,%r11), %r10
	leaq	8(%rcx,%r11), %rdi
	vpbroadcastq	88(%rsp), %ymm12
	vmovdqa	.LC2(%rip), %ymm9
	leaq	-8(%rcx,%r11), %rsi
	leaq	8(%rcx,%r12,8), %r9
	addq	80(%rsp), %r11
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L102:
	vptest	%ymm0, %ymm0
	jne	.L155
.L103:
	incl	%edx
	addq	$64, %rax
	cmpl	%edx, %ebx
	jbe	.L156
.L104:
	vmovdqa	%ymm9, %ymm1
	vpaddd	96(%rsp), %ymm1, %ymm2
	vpaddd	.LC3(%rip), %ymm9, %ymm9
	vextracti128	$0x1, %ymm2, %xmm6
	vpmovsxdq	%xmm2, %ymm3
	vpmovsxdq	%xmm6, %ymm10
	vpaddq	%ymm12, %ymm3, %ymm4
	vpaddq	%ymm12, %ymm10, %ymm13
	vpand	%ymm15, %ymm4, %ymm5
	vbroadcastsd	alfa(%rip), %ymm10
	vpand	%ymm15, %ymm13, %ymm14
	vpcmpeqq	%ymm11, %ymm5, %ymm1
	vmaskmovpd	(%r8,%rax), %ymm1, %ymm4
	vmaskmovpd	(%rsi,%rax), %ymm1, %ymm13
	vpcmpeqq	%ymm11, %ymm14, %ymm0
	vmaskmovpd	(%r9,%rax), %ymm1, %ymm3
	vmaskmovpd	32(%r8,%rax), %ymm0, %ymm5
	vaddpd	%ymm4, %ymm3, %ymm3
	vmaskmovpd	32(%r9,%rax), %ymm0, %ymm2
	vaddpd	%ymm5, %ymm2, %ymm2
	vmaskmovpd	32(%rsi,%rax), %ymm0, %ymm4
	vmaskmovpd	(%rdi,%rax), %ymm1, %ymm5
	vmaskmovpd	32(%rdi,%rax), %ymm0, %ymm14
	vaddpd	%ymm13, %ymm5, %ymm5
	vaddpd	%ymm4, %ymm14, %ymm14
	vmaskmovpd	(%r10,%rax), %ymm1, %ymm7
	vmaskmovpd	32(%r10,%rax), %ymm0, %ymm6
	vfnmadd231pd	%ymm8, %ymm7, %ymm3
	vptest	%ymm1, %ymm1
	vbroadcastsd	beta_coef(%rip), %ymm13
	vfnmadd231pd	%ymm8, %ymm6, %ymm2
	vfnmadd231pd	%ymm8, %ymm6, %ymm14
	vfnmadd231pd	%ymm8, %ymm7, %ymm5
	vmulpd	%ymm13, %ymm14, %ymm4
	vmulpd	%ymm13, %ymm5, %ymm14
	vfmadd132pd	%ymm10, %ymm4, %ymm2
	vfmadd132pd	%ymm10, %ymm14, %ymm3
	vaddpd	%ymm2, %ymm6, %ymm6
	vaddpd	%ymm3, %ymm7, %ymm7
	je	.L102
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%r11,%rax)
	je	.L103
	.p2align 4,,10
	.p2align 3
.L155:
	incl	%edx
	vmaskmovpd	%ymm6, %ymm0, 32(%r11,%rax)
	addq	$64, %rax
	cmpl	%edx, %ebx
	ja	.L104
	.p2align 4,,10
	.p2align 3
.L156:
	movl	40(%rsp), %r9d
	cmpl	%r9d, 48(%rsp)
	je	.L105
	cmpl	$2, 28(%rsp)
	movl	32(%rsp), %esi
	jbe	.L120
	movl	36(%rsp), %r11d
.L101:
	vmovd	%r11d, %xmm11
	vmovd	%r15d, %xmm1
	movq	72(%rsp), %r10
	leaq	1(%r9,%r13), %r13
	vpshufd	$0, %xmm11, %xmm9
	vpshufd	$0, %xmm1, %xmm2
	salq	$3, %r13
	vpaddd	.LC6(%rip), %xmm9, %xmm0
	leaq	1(%r9,%r12), %r12
	vmovddup	88(%rsp), %xmm12
	vpxor	%xmm7, %xmm7, %xmm7
	leaq	(%rcx,%r13), %rdi
	vpaddd	%xmm2, %xmm0, %xmm10
	leaq	1(%r9,%r10), %r9
	vmovddup	beta_coef(%rip), %xmm5
	vmovddup	alfa(%rip), %xmm13
	vpsrldq	$8, %xmm10, %xmm6
	vpmovsxdq	%xmm10, %xmm3
	leaq	(%rcx,%r12,8), %r8
	movq	80(%rsp), %r12
	vpmovsxdq	%xmm6, %xmm11
	vpaddq	%xmm12, %xmm3, %xmm4
	vpand	.LC7(%rip), %xmm4, %xmm14
	vpaddq	%xmm12, %xmm11, %xmm12
	vpand	.LC7(%rip), %xmm12, %xmm9
	leaq	8(%rcx,%r13), %rdx
	addq	%r13, %r12
	leaq	(%rcx,%r9,8), %rax
	vpcmpeqq	%xmm7, %xmm14, %xmm1
	vmaskmovpd	(%rdi), %xmm1, %xmm4
	vmaskmovpd	(%r8), %xmm1, %xmm3
	vpcmpeqq	%xmm7, %xmm9, %xmm0
	vmaskmovpd	(%rax), %xmm1, %xmm7
	vmaskmovpd	(%rdx), %xmm0, %xmm12
	vaddpd	%xmm7, %xmm3, %xmm9
	vmaskmovpd	16(%rdi), %xmm0, %xmm14
	vmaskmovpd	16(%rax), %xmm0, %xmm10
	vmaskmovpd	(%rdx), %xmm1, %xmm3
	vmaskmovpd	16(%r8), %xmm0, %xmm2
	vmaskmovpd	16(%rdx), %xmm0, %xmm6
	vaddpd	%xmm10, %xmm2, %xmm2
	vaddpd	%xmm12, %xmm6, %xmm7
	vmaskmovpd	-8(%rcx,%r13), %xmm1, %xmm11
	vfnmadd231pd	.LC8(%rip), %xmm14, %xmm7
	vaddpd	%xmm11, %xmm3, %xmm10
	vfnmadd231pd	.LC8(%rip), %xmm4, %xmm10
	vptest	%xmm1, %xmm1
	vfnmadd231pd	.LC8(%rip), %xmm4, %xmm9
	vfnmadd231pd	.LC8(%rip), %xmm14, %xmm2
	vmulpd	%xmm5, %xmm7, %xmm3
	vmulpd	%xmm5, %xmm10, %xmm5
	vfmadd132pd	%xmm13, %xmm3, %xmm2
	vfmadd132pd	%xmm13, %xmm5, %xmm9
	vaddpd	%xmm9, %xmm4, %xmm13
	vaddpd	%xmm2, %xmm14, %xmm4
	jne	.L157
.L107:
	vptest	%xmm0, %xmm0
	jne	.L158
.L108:
	movl	%esi, %r13d
	andl	$-4, %r13d
	leal	0(%r13,%r11), %eax
	cmpl	%r13d, %esi
	je	.L105
.L106:
	movq	88(%rsp), %rsi
	leal	(%r15,%rax), %r11d
	addq	%rsi, %r11
	andl	$1, %r11d
	jne	.L110
	movl	64(%rsp), %edi
	movl	68(%rsp), %r9d
	leal	(%r14,%rax), %r12d
	movslq	%r12d, %r13
	vmovsd	.LC0(%rip), %xmm2
	movq	80(%rsp), %r11
	leal	(%rdi,%rax), %r8d
	addl	%eax, %r9d
	movslq	%r8d, %r10
	movslq	%r9d, %rdx
	vmovsd	(%rcx,%rdx,8), %xmm1
	vmovsd	-8(%rcx,%r10,8), %xmm9
	vaddsd	(%rcx,%r13,8), %xmm1, %xmm0
	vaddsd	8(%rcx,%r10,8), %xmm9, %xmm6
	vmovsd	(%rcx,%r10,8), %xmm14
	vfnmadd231sd	%xmm2, %xmm14, %xmm0
	vfnmadd132sd	%xmm14, %xmm6, %xmm2
	vmulsd	beta_coef(%rip), %xmm2, %xmm11
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm14, %xmm0, %xmm12
	vmovsd	%xmm12, (%r11,%r10,8)
.L110:
	leal	1(%rax), %r8d
	cmpl	%r8d, 60(%rsp)
	jl	.L105
	movq	88(%rsp), %rdi
	leal	(%r15,%r8), %esi
	addq	%rdi, %rsi
	andl	$1, %esi
	jne	.L111
	movl	64(%rsp), %r10d
	leal	(%r14,%r8), %edx
	movslq	%edx, %r13
	leal	(%r10,%r8), %r9d
	addl	68(%rsp), %r8d
	vmovsd	(%rcx,%r13,8), %xmm10
	movslq	%r9d, %r12
	movslq	%r8d, %r11
	movq	80(%rsp), %r8
	vmovsd	(%rcx,%r12,8), %xmm7
	vmovsd	8(%rcx,%r12,8), %xmm5
	vaddsd	-8(%rcx,%r12,8), %xmm5, %xmm13
	vaddsd	(%rcx,%r11,8), %xmm10, %xmm3
	vfnmadd231sd	.LC0(%rip), %xmm7, %xmm13
	vfnmadd231sd	.LC0(%rip), %xmm7, %xmm3
	vmulsd	beta_coef(%rip), %xmm13, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm3
	vaddsd	%xmm7, %xmm3, %xmm14
	vmovsd	%xmm14, (%r8,%r12,8)
.L111:
	addl	$2, %eax
	cmpl	%eax, 60(%rsp)
	jl	.L105
	movq	88(%rsp), %rdi
	leal	(%r15,%rax), %esi
	addq	%rdi, %rsi
	andl	$1, %esi
	jne	.L105
	movl	64(%rsp), %r10d
	leal	(%r14,%rax), %r12d
	movslq	%r12d, %rdx
	addl	%eax, %r10d
	addl	68(%rsp), %eax
	vmovsd	(%rcx,%rdx,8), %xmm1
	movslq	%r10d, %r9
	cltq
	vmovsd	(%rcx,%r9,8), %xmm2
	vmovsd	8(%rcx,%r9,8), %xmm9
	vaddsd	-8(%rcx,%r9,8), %xmm9, %xmm6
	vaddsd	(%rcx,%rax,8), %xmm1, %xmm0
	vfnmadd231sd	.LC0(%rip), %xmm2, %xmm6
	movq	80(%rsp), %rax
	vmulsd	beta_coef(%rip), %xmm6, %xmm11
	vfnmadd231sd	.LC0(%rip), %xmm2, %xmm0
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm12
	vmovsd	%xmm12, (%rax,%r9,8)
.L105:
	incl	%r15d
	cmpl	%r15d, 44(%rsp)
	jne	.L114
	vzeroupper
.L153:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	.cfi_restore_state
	vmaskmovpd	%xmm4, %xmm0, 16(%r12)
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L157:
	vmaskmovpd	%xmm13, %xmm1, (%r12)
	jmp	.L107
.L119:
	movslq	68(%rsp), %rdi
	movl	48(%rsp), %esi
	xorl	%r9d, %r9d
	movslq	%r14d, %r12
	movslq	64(%rsp), %r13
	movl	$1, %r11d
	movq	%rdi, 72(%rsp)
	jmp	.L101
.L120:
	movl	36(%rsp), %eax
	jmp	.L106
.L95:
	incl	%eax
	xorl	%edx, %edx
	jmp	.L118
.L100:
	movl	56(%rsp), %r12d
	leal	2(%rdx), %r13d
	movq	88(%rsp), %rbx
	incl	%eax
	movslq	%r15d, %r14
	movl	%eax, 72(%rsp)
	vmovsd	.LC0(%rip), %xmm0
	imull	%r12d, %r13d
	movl	%r12d, %r10d
	movl	%r15d, 96(%rsp)
	leaq	1(%rbx,%r14), %r11
	imull	%r15d, %r10d
	movq	80(%rsp), %rbx
	imull	%r12d, %edx
	movl	%r13d, 88(%rsp)
	leal	1(%r10,%r8), %edi
	movl	%edx, %r14d
	.p2align 4,,10
	.p2align 3
.L117:
	movl	88(%rsp), %r8d
	leal	1(%r10), %eax
	movl	%edi, %r15d
	movl	%r14d, %r9d
	subl	%eax, %r15d
	movq	%r11, %rdx
	subl	%r10d, %r9d
	subl	%r10d, %r8d
	andl	$3, %r15d
	je	.L116
	cmpl	$1, %r15d
	je	.L142
	cmpl	$2, %r15d
	je	.L143
	testb	$1, %r11b
	jne	.L127
	movslq	%eax, %r13
	leal	(%r8,%rax), %esi
	vmovsd	(%rcx,%r13,8), %xmm15
	leaq	0(,%r13,8), %rdx
	leal	(%r9,%rax), %r13d
	movslq	%esi, %r15
	vmovsd	8(%rcx,%rdx), %xmm10
	movslq	%r13d, %rsi
	vaddsd	-8(%rcx,%rdx), %xmm10, %xmm3
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%rsi,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%rdx)
.L127:
	leaq	1(%r11), %rdx
	incl	%eax
.L143:
	testb	$1, %dl
	jne	.L130
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm5
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm14
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm14, %xmm2
	vmovsd	(%rcx,%r15,8), %xmm13
	vaddsd	(%rcx,%r13,8), %xmm13, %xmm4
	vfnmadd231sd	%xmm0, %xmm5, %xmm2
	vfmadd132sd	beta_coef(%rip), %xmm5, %xmm2
	vfnmadd231sd	%xmm0, %xmm5, %xmm4
	vfmadd132sd	alfa(%rip), %xmm2, %xmm4
	vmovsd	%xmm4, (%rbx,%rsi)
.L130:
	incq	%rdx
	incl	%eax
.L142:
	testb	$1, %dl
	jne	.L133
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm9
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm11
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm11, %xmm12
	vmovsd	(%rcx,%r15,8), %xmm1
	vaddsd	(%rcx,%r13,8), %xmm1, %xmm6
	vfnmadd231sd	%xmm0, %xmm9, %xmm12
	vfmadd132sd	beta_coef(%rip), %xmm9, %xmm12
	vfnmadd231sd	%xmm0, %xmm9, %xmm6
	vfmadd132sd	alfa(%rip), %xmm12, %xmm6
	vmovsd	%xmm6, (%rbx,%rsi)
.L133:
	incl	%eax
	incq	%rdx
	cmpl	%edi, %eax
	je	.L150
.L116:
	testb	$1, %dl
	jne	.L115
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm15
	leaq	0(,%r15,8), %rsi
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rsi), %xmm10
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rsi), %xmm10, %xmm3
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%r13,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%rsi)
.L115:
	leaq	1(%rdx), %rsi
	incl	%eax
	andl	$1, %edx
	je	.L136
	movslq	%eax, %r15
	leal	(%r8,%rax), %r13d
	vmovsd	(%rcx,%r15,8), %xmm5
	leaq	0(,%r15,8), %rdx
	movslq	%r13d, %r15
	leal	(%r9,%rax), %r13d
	vmovsd	8(%rcx,%rdx), %xmm14
	movslq	%r13d, %r13
	vaddsd	-8(%rcx,%rdx), %xmm14, %xmm2
	vmovsd	(%rcx,%r15,8), %xmm13
	vaddsd	(%rcx,%r13,8), %xmm13, %xmm4
	vfnmadd231sd	%xmm0, %xmm5, %xmm2
	vfmadd132sd	beta_coef(%rip), %xmm5, %xmm2
	vfnmadd231sd	%xmm0, %xmm5, %xmm4
	vfmadd132sd	alfa(%rip), %xmm2, %xmm4
	vmovsd	%xmm4, (%rbx,%rdx)
.L136:
	leal	1(%rax), %edx
	testb	$1, %sil
	je	.L138
	movslq	%edx, %r15
	vmovsd	(%rcx,%r15,8), %xmm9
	leaq	0(,%r15,8), %r13
	leal	(%r8,%rdx), %r15d
	addl	%r9d, %edx
	vmovsd	8(%rcx,%r13), %xmm11
	movslq	%r15d, %r15
	vaddsd	-8(%rcx,%r13), %xmm11, %xmm12
	movslq	%edx, %rdx
	vmovsd	(%rcx,%r15,8), %xmm1
	vaddsd	(%rcx,%rdx,8), %xmm1, %xmm6
	vfnmadd231sd	%xmm0, %xmm9, %xmm12
	vfmadd132sd	beta_coef(%rip), %xmm9, %xmm12
	vfnmadd231sd	%xmm0, %xmm9, %xmm6
	vfmadd132sd	alfa(%rip), %xmm12, %xmm6
	vmovsd	%xmm6, (%rbx,%r13)
.L138:
	leal	2(%rax), %edx
	testb	$1, %sil
	jne	.L140
	movslq	%edx, %r15
	vmovsd	(%rcx,%r15,8), %xmm15
	leaq	0(,%r15,8), %r13
	leal	(%r8,%rdx), %r15d
	addl	%r9d, %edx
	vmovsd	8(%rcx,%r13), %xmm10
	movslq	%r15d, %r15
	vaddsd	-8(%rcx,%r13), %xmm10, %xmm3
	movslq	%edx, %rdx
	vmovsd	(%rcx,%r15,8), %xmm8
	vaddsd	(%rcx,%rdx,8), %xmm8, %xmm7
	vfnmadd231sd	%xmm0, %xmm15, %xmm3
	vfmadd132sd	beta_coef(%rip), %xmm15, %xmm3
	vfnmadd231sd	%xmm0, %xmm15, %xmm7
	vfmadd132sd	alfa(%rip), %xmm3, %xmm7
	vmovsd	%xmm7, (%rbx,%r13)
.L140:
	addl	$3, %eax
	leaq	3(%rsi), %rdx
	cmpl	%edi, %eax
	jne	.L116
.L150:
	incl	96(%rsp)
	incq	%r11
	movl	96(%rsp), %eax
	addl	%r12d, %r10d
	addl	%r12d, 88(%rsp)
	addl	%r12d, %r14d
	addl	%r12d, %edi
	cmpl	72(%rsp), %eax
	jne	.L117
	jmp	.L153
	.cfi_endproc
.LFE3800:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB3809:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rdx
	movq	240(%rdi,%rdx), %r12
	testq	%r12, %r12
	je	.L166
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L161
	movsbl	67(%r12), %esi
.L162:
	movq	%rbp, %rdi
	call	_ZNSo3putEc
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv
.L161:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r12), %rcx
	movl	$10, %esi
	movq	48(%rcx), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L162
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L162
.L166:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE3809:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z5pulsoddddd
	.type	_Z5pulsoddddd, @function
_Z5pulsoddddd:
.LFB3106:
	.cfi_startproc
	vsubsd	%xmm2, %xmm4, %xmm4
	vsubsd	%xmm1, %xmm3, %xmm3
	vmulsd	%xmm4, %xmm4, %xmm1
	vfmadd132sd	%xmm3, %xmm1, %xmm3
	vmulsd	%xmm0, %xmm3, %xmm0
	vxorpd	.LC9(%rip), %xmm0, %xmm0
	jmp	exp
	.cfi_endproc
.LFE3106:
	.size	_Z5pulsoddddd, .-_Z5pulsoddddd
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"Erro: A condi\303\247\303\243o CFL n\303\243o \303\251 atendida. O programa ser\303\241 abortado."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC13:
	.string	"deltaT = "
.LC14:
	.string	", Condi\303\247\303\243o CFL m\303\241xima = "
.LC24:
	.string	"# Tempo = "
.LC25:
	.string	" segundos ..."
.LC26:
	.string	"output_data.txt"
.LC27:
	.string	" "
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"Erro ao abrir o arquivo para escrita."
	.section	.text.unlikely,"ax",@progbits
.LCOLDB32:
	.section	.text.startup,"ax",@progbits
.LHOTB32:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3107:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3107
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$896, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edi, -596(%rbp)
	leaq	-596(%rbp), %rdi
	movq	%rsi, -608(%rbp)
	leaq	-608(%rbp), %rsi
	vmovsd	%xmm1, -656(%rbp)
.LEHB0:
	call	MPI_Init
	movl	$myRank, %esi
	movl	$1140850688, %edi
	call	MPI_Comm_rank
	movl	$numProcs, %esi
	movl	$1140850688, %edi
	call	MPI_Comm_size
	movq	-608(%rbp), %rax
	xorl	%esi, %esi
	movq	8(%rax), %rdi
	call	strtod
	movq	-608(%rbp), %rdx
	xorl	%esi, %esi
	vmovsd	%xmm0, gama(%rip)
	movq	16(%rdx), %rdi
	call	strtod
	movq	-608(%rbp), %rcx
	xorl	%esi, %esi
	vmovsd	%xmm0, tempoFinal(%rip)
	movq	24(%rcx), %rdi
	call	strtod
	movq	-608(%rbp), %rbx
	xorl	%esi, %esi
	movl	$10, %edx
	vmovsd	%xmm0, deltaT(%rip)
	movq	32(%rbx), %rdi
	call	strtol
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	.LC1(%rip), %xmm0
	vmovsd	-656(%rbp), %xmm7
	vcvtsi2sdl	%eax, %xmm4, %xmm2
	leal	1(%rax), %esi
	movl	%eax, NP(%rip)
	movslq	%esi, %rdi
	movq	%rdi, N(%rip)
	vdivsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm1, h(%rip)
	vmulsd	.LC11(%rip), %xmm3, %xmm5
	vmovsd	%xmm1, deltaX(%rip)
	vdivsd	gama(%rip), %xmm5, %xmm6
	vcomisd	deltaT(%rip), %xmm6
	vmovsd	%xmm1, deltaY(%rip)
	jnb	.L169
	cmpl	$0, myRank(%rip)
	je	.L362
.L171:
	movl	$1, %esi
	movl	$1140850688, %edi
	vmovsd	%xmm7, -656(%rbp)
	call	MPI_Abort
	vmovsd	-656(%rbp), %xmm7
.L169:
	movq	N(%rip), %rax
	movslq	numProcs(%rip), %r8
	movl	myRank(%rip), %r11d
	movq	%rax, -624(%rbp)
	subq	$2, %rax
	movq	%r8, %r9
	cqto
	movl	%r11d, %r13d
	idivq	%r8
	imull	%eax, %r13d
	movl	%eax, numLocalPontos(%rip)
	movl	%edx, resto(%rip)
	leal	1(%r13), %r14d
	leal	0(%r13,%rax), %ebx
	cmpl	%r11d, %edx
	jle	.L172
	addl	%r11d, %r14d
	leal	1(%r11,%rbx), %ebx
.L173:
	decl	%r9d
	leal	1(%r11), %r10d
	leal	-1(%r11), %r15d
	movl	$-1, %ecx
	cmpl	%r9d, %r11d
	movl	NP(%rip), %edi
	movl	%ebx, finalLocal(%rip)
	cmove	%ecx, %r10d
	subl	%r14d, %ebx
	movl	%r15d, vizNorte(%rip)
	leal	1(%rbx), %r15d
	leal	1(%rdi), %r12d
	movl	%r14d, inicioLocal(%rip)
	movslq	%r15d, %rsi
	movslq	%r12d, %rax
	movl	%r14d, -656(%rbp)
	movq	%rsi, nN(%rip)
	addq	$2, %rsi
	imulq	%rax, %rsi
	vmovsd	%xmm7, -688(%rbp)
	movl	%r10d, vizSul(%rip)
	movl	%r12d, -600(%rbp)
	leaq	0(,%rsi,8), %r14
	movq	%r14, %rdi
	call	malloc
	movq	%r14, %rdi
	movq	%rax, %r13
	call	malloc
	vmovq	%r13, %xmm8
	cmpl	$-1, %r15d
	movl	-656(%rbp), %r8d
	vpinsrq	$1, %rax, %xmm8, %xmm9
	vmovsd	-688(%rbp), %xmm7
	movq	%rax, %r14
	vmovdqa	%xmm9, -896(%rbp)
	jl	.L363
	movq	-624(%rbp), %r11
	leal	2(%rbx,%r8), %edx
	leal	-1(%r8), %r9d
	xorl	%r12d, %r12d
	vmovsd	h(%rip), %xmm11
	vmovsd	.LC15(%rip), %xmm12
	movl	%r9d, -616(%rbp)
	leaq	-1(%r11), %rbx
	movq	%r11, %r10
	andq	$-8, %r11
	movl	%edx, -900(%rbp)
	shrq	$3, %r10
	movq	%rbx, -912(%rbp)
	vmovddup	%xmm11, %xmm13
	movq	%r11, -936(%rbp)
	salq	$6, %r10
	movl	%r11d, -904(%rbp)
	movq	%r13, -848(%rbp)
	movq	%rax, -856(%rbp)
	movq	%r10, -928(%rbp)
	xorl	%r10d, %r10d
	vmovsd	%xmm11, -864(%rbp)
	vmovsd	%xmm12, -832(%rbp)
	vmovapd	%xmm13, -880(%rbp)
	.p2align 4,,10
	.p2align 3
.L177:
	cmpq	$0, -624(%rbp)
	jle	.L185
	vxorpd	%xmm14, %xmm14, %xmm14
	vmovsd	-864(%rbp), %xmm4
	cmpq	$6, -912(%rbp)
	vcvtsi2sdl	-616(%rbp), %xmm14, %xmm15
	vmulsd	%xmm4, %xmm15, %xmm2
	vsubsd	-832(%rbp), %xmm2, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm3
	vmovsd	%xmm2, -920(%rbp)
	vmovsd	%xmm3, -824(%rbp)
	jbe	.L226
	movq	-856(%rbp), %r14
	movslq	%r12d, %r15
	movq	-928(%rbp), %rax
	vbroadcastsd	%xmm4, %ymm5
	salq	$3, %r15
	movq	-848(%rbp), %rsi
	vbroadcastsd	%xmm3, %ymm6
	vmovdqa	.LC10(%rip), %ymm8
	addq	%r15, %r14
	vmovapd	%ymm5, -656(%rbp)
	leaq	(%rax,%r14), %rdi
	vmovapd	%ymm6, -688(%rbp)
	leaq	(%rsi,%r15), %r13
	movq	%rdi, -840(%rbp)
	testb	$64, %al
	je	.L179
	vmovdqa	%ymm8, %ymm0
	vmovapd	-688(%rbp), %ymm14
	addq	$64, %r14
	addq	$64, %r13
	vcvtdq2pd	%xmm0, %ymm12
	vextracti128	$0x1, %ymm0, %xmm9
	vfmadd213pd	.LC16(%rip), %ymm5, %ymm12
	vpaddd	.LC3(%rip), %ymm8, %ymm8
	vcvtdq2pd	%xmm9, %ymm10
	vmulpd	%ymm5, %ymm10, %ymm11
	vaddpd	.LC16(%rip), %ymm11, %ymm13
	vmovdqa	%ymm8, -816(%rbp)
	vfmadd132pd	%ymm12, %ymm14, %ymm12
	vfmadd132pd	%ymm13, %ymm14, %ymm13
	vmulpd	.LC17(%rip), %ymm12, %ymm0
	vmovapd	%ymm11, -784(%rbp)
	vmovapd	%ymm13, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm4
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC17(%rip), %ymm4, %ymm0
	call	_ZGVdN4v_exp
	vmovapd	-752(%rbp), %ymm2
	vmovapd	-784(%rbp), %ymm1
	vmovupd	%ymm0, -32(%r14)
	vmovdqa	-816(%rbp), %ymm8
	vmovupd	%ymm2, -64(%r14)
	vmovupd	%ymm2, -64(%r13)
	vmovupd	%ymm0, -32(%r13)
	cmpq	%r14, -840(%rbp)
	je	.L350
	.p2align 4,,10
	.p2align 3
.L179:
	vmovapd	-656(%rbp), %ymm6
	vcvtdq2pd	%xmm8, %ymm9
	vfmadd213pd	.LC16(%rip), %ymm6, %ymm9
	vextracti128	$0x1, %ymm8, %xmm5
	vcvtdq2pd	%xmm5, %ymm7
	vmovapd	-688(%rbp), %ymm11
	subq	$-128, %r14
	subq	$-128, %r13
	vmulpd	%ymm6, %ymm7, %ymm0
	vpaddd	.LC3(%rip), %ymm8, %ymm3
	vaddpd	.LC16(%rip), %ymm0, %ymm10
	vmovdqa	%ymm3, -784(%rbp)
	vfmadd132pd	%ymm9, %ymm11, %ymm9
	vmulpd	.LC17(%rip), %ymm9, %ymm0
	vfmadd132pd	%ymm10, %ymm11, %ymm10
	vmovapd	%ymm10, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm13
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC17(%rip), %ymm13, %ymm0
	call	_ZGVdN4v_exp
	vmovdqa	-784(%rbp), %ymm15
	vmovapd	-656(%rbp), %ymm8
	vmovapd	-688(%rbp), %ymm7
	vmovupd	%ymm0, -96(%r14)
	vmovapd	-752(%rbp), %ymm14
	vcvtdq2pd	%xmm15, %ymm3
	vextracti128	$0x1, %ymm15, %xmm2
	vfmadd213pd	.LC16(%rip), %ymm8, %ymm3
	vmovupd	%ymm0, -96(%r13)
	vcvtdq2pd	%xmm2, %ymm1
	vmulpd	%ymm8, %ymm1, %ymm5
	vpaddd	.LC3(%rip), %ymm15, %ymm4
	vmovupd	%ymm14, -128(%r14)
	vaddpd	.LC16(%rip), %ymm5, %ymm6
	vmovupd	%ymm14, -128(%r13)
	vmovdqa	%ymm4, -816(%rbp)
	vfmadd132pd	%ymm3, %ymm7, %ymm3
	vfmadd132pd	%ymm6, %ymm7, %ymm6
	vmulpd	.LC17(%rip), %ymm3, %ymm0
	vmovapd	%ymm5, -784(%rbp)
	vmovapd	%ymm6, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm9
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC17(%rip), %ymm9, %ymm0
	call	_ZGVdN4v_exp
	vmovapd	-752(%rbp), %ymm10
	vmovapd	-784(%rbp), %ymm1
	vmovupd	%ymm0, -32(%r14)
	vmovdqa	-816(%rbp), %ymm8
	vmovupd	%ymm10, -64(%r14)
	vmovupd	%ymm10, -64(%r13)
	vmovupd	%ymm0, -32(%r13)
	cmpq	%r14, -840(%rbp)
	jne	.L179
.L350:
	vextractf128	$0x1, %ymm1, %xmm11
	movq	-936(%rbp), %r8
	vunpckhpd	%xmm11, %xmm11, %xmm7
	cmpq	%r8, -624(%rbp)
	je	.L180
	movl	-904(%rbp), %ebx
	movq	%r8, %r13
.L178:
	movq	-624(%rbp), %r15
	subq	%r13, %r15
	leaq	-1(%r15), %r9
	cmpq	$2, %r9
	jbe	.L181
	vmovd	%ebx, %xmm12
	movslq	%r12d, %rdx
	movq	-856(%rbp), %r11
	movq	%r15, %r14
	vpshufd	$0, %xmm12, %xmm13
	vpaddd	.LC6(%rip), %xmm13, %xmm14
	addq	%r13, %rdx
	andq	$-4, %r14
	vmovapd	-880(%rbp), %xmm8
	vmovddup	-824(%rbp), %xmm15
	salq	$3, %rdx
	addl	%r14d, %ebx
	vpshufd	$238, %xmm14, %xmm4
	vcvtdq2pd	%xmm14, %xmm5
	addq	%rdx, %r11
	addq	-848(%rbp), %rdx
	vfmadd213pd	.LC18(%rip), %xmm8, %xmm5
	vcvtdq2pd	%xmm4, %xmm2
	movq	%r11, -720(%rbp)
	vmulpd	%xmm8, %xmm2, %xmm1
	movq	%rdx, -688(%rbp)
	vaddpd	.LC18(%rip), %xmm1, %xmm3
	vfmadd132pd	%xmm5, %xmm15, %xmm5
	vfmadd132pd	%xmm3, %xmm15, %xmm3
	vmulpd	.LC19(%rip), %xmm3, %xmm7
	vmovapd	%xmm1, -656(%rbp)
	vmulpd	.LC19(%rip), %xmm5, %xmm6
	vinsertf128	$0x1, %xmm7, %ymm6, %ymm0
	call	_ZGVdN4v_exp
	movq	-720(%rbp), %r10
	movq	-688(%rbp), %rcx
	vmovapd	-656(%rbp), %xmm10
	vmovapd	%xmm0, %xmm9
	vextractf128	$0x1, %ymm0, %xmm0
	vmovupd	%xmm9, (%r10)
	vmovupd	%xmm0, 16(%r10)
	vunpckhpd	%xmm10, %xmm10, %xmm7
	vmovupd	%xmm9, (%rcx)
	vmovupd	%xmm0, 16(%rcx)
	cmpq	%r14, %r15
	je	.L180
.L181:
	vxorpd	%xmm11, %xmm11, %xmm11
	movq	-856(%rbp), %r14
	leal	(%r12,%rbx), %esi
	vcvtsi2sdl	%ebx, %xmm11, %xmm12
	vmulsd	-864(%rbp), %xmm12, %xmm13
	movslq	%esi, %r15
	vsubsd	-832(%rbp), %xmm13, %xmm14
	leaq	(%r14,%r15,8), %r13
	vfmadd213sd	-824(%rbp), %xmm14, %xmm14
	vmulsd	.LC20(%rip), %xmm14, %xmm0
	movq	%r13, -688(%rbp)
	vmovsd	%xmm13, -656(%rbp)
	vzeroupper
	call	exp
	movq	-688(%rbp), %rax
	movq	-848(%rbp), %r13
	leal	1(%rbx), %edi
	vmovsd	-656(%rbp), %xmm7
	movslq	%edi, %r8
	cmpq	%r8, -624(%rbp)
	vmovsd	%xmm0, (%rax)
	vmovsd	%xmm0, 0(%r13,%r15,8)
	jle	.L180
	vxorpd	%xmm15, %xmm15, %xmm15
	addl	$2, %ebx
	vcvtsi2sdl	%edi, %xmm15, %xmm4
	vmulsd	-864(%rbp), %xmm4, %xmm2
	addl	%r12d, %edi
	vsubsd	-832(%rbp), %xmm2, %xmm8
	movslq	%edi, %r15
	vfmadd213sd	-824(%rbp), %xmm8, %xmm8
	leaq	(%r14,%r15,8), %r9
	vmulsd	.LC20(%rip), %xmm8, %xmm0
	movq	%r9, -688(%rbp)
	vmovsd	%xmm2, -656(%rbp)
	call	exp
	movq	-688(%rbp), %rdx
	movslq	%ebx, %r11
	cmpq	%r11, -624(%rbp)
	vmovsd	-656(%rbp), %xmm7
	vmovsd	%xmm0, 0(%r13,%r15,8)
	vmovsd	%xmm0, (%rdx)
	jle	.L180
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdl	%ebx, %xmm1, %xmm5
	vmulsd	-864(%rbp), %xmm5, %xmm3
	addl	%r12d, %ebx
	vsubsd	-832(%rbp), %xmm3, %xmm6
	movslq	%ebx, %rbx
	vfmadd213sd	-824(%rbp), %xmm6, %xmm6
	leaq	(%r14,%rbx,8), %r14
	vmulsd	.LC20(%rip), %xmm6, %xmm0
	vmovsd	%xmm3, -656(%rbp)
	call	exp
	vmovsd	-656(%rbp), %xmm7
	vmovsd	%xmm0, (%r14)
	vmovsd	%xmm0, 0(%r13,%rbx,8)
.L180:
	movl	$1, %r10d
.L185:
	incl	-616(%rbp)
	addl	-600(%rbp), %r12d
	movl	-616(%rbp), %ecx
	cmpl	%ecx, -900(%rbp)
	jne	.L177
	movq	-848(%rbp), %r13
	movq	-856(%rbp), %r14
	testb	%r10b, %r10b
	je	.L357
	vmovsd	-920(%rbp), %xmm9
	vmovsd	%xmm7, y(%rip)
	vmovsd	%xmm9, x(%rip)
	vzeroupper
.L176:
	vmovsd	deltaX(%rip), %xmm11
	vmovsd	deltaY(%rip), %xmm14
	xorl	%r12d, %r12d
	leaq	-592(%rbp), %rbx
	vmovsd	gama(%rip), %xmm0
	vmulsd	deltaT(%rip), %xmm0, %xmm10
	vmulsd	%xmm11, %xmm11, %xmm12
	vmulsd	%xmm14, %xmm14, %xmm15
	vdivsd	%xmm12, %xmm10, %xmm13
	vdivsd	%xmm15, %xmm10, %xmm4
	vmovsd	%xmm13, alfa(%rip)
	vmovsd	%xmm4, beta_coef(%rip)
	call	omp_get_wtime
	vmovsd	-832(%rbp), %xmm2
	vmulsd	tempoFinal(%rip), %xmm2, %xmm8
	vcomisd	.LC21(%rip), %xmm8
	vmovsd	%xmm0, t_ini(%rip)
	jbe	.L199
	.p2align 4,,10
	.p2align 3
.L187:
	vxorpd	%xmm1, %xmm1, %xmm1
	incl	%r12d
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	vcvtsi2sdl	%r12d, %xmm1, %xmm5
	vmulsd	deltaT(%rip), %xmm5, %xmm3
	movl	$main._omp_fn.0, %edi
	vmovdqa	-896(%rbp), %xmm6
	leaq	-560(%rbp), %rsi
	vmovdqa	%xmm6, -560(%rbp)
	vmovsd	%xmm3, -656(%rbp)
	call	GOMP_parallel
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L190
	movslq	NP(%rip), %rax
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%rax), %esi
	leaq	8(%r14,%rax,8), %rdi
	call	MPI_Send
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	%r14, %rdi
	pushq	%rbx
	movl	NP(%rip), %esi
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	movl	vizNorte(%rip), %ecx
	leal	1(%rsi), %esi
	call	MPI_Recv
	popq	%rdi
	popq	%r8
.L190:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L191
	movl	NP(%rip), %edi
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%rdi), %esi
	movslq	%esi, %r8
	imulq	nN(%rip), %r8
	leaq	(%r14,%r8,8), %rdi
	xorl	%r8d, %r8d
	call	MPI_Send
	movl	NP(%rip), %r15d
	subq	$8, %rsp
	movq	nN(%rip), %r9
	pushq	%rbx
	movl	vizSul(%rip), %ecx
	xorl	%r8d, %r8d
	leal	1(%r15), %esi
	incq	%r9
	movslq	%esi, %rdx
	imulq	%rdx, %r9
	movl	$1275070475, %edx
	leaq	(%r14,%r9,8), %rdi
	movl	$1140850688, %r9d
	call	MPI_Recv
	popq	%rcx
	popq	%rsi
.L191:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	-560(%rbp), %rsi
	movl	$main._omp_fn.1, %edi
	movq	%r14, -552(%rbp)
	movq	%r13, -560(%rbp)
	call	GOMP_parallel
	movl	vizNorte(%rip), %ecx
	incq	m(%rip)
	cmpl	$-1, %ecx
	je	.L192
	movslq	NP(%rip), %r11
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r11), %esi
	leaq	8(%r14,%r11,8), %rdi
	call	MPI_Send
	movl	$1275070475, %edx
	xorl	%r8d, %r8d
	movq	%r14, %rdi
	subq	$8, %rsp
	movl	NP(%rip), %r10d
	movl	vizNorte(%rip), %ecx
	movl	$1140850688, %r9d
	pushq	%rbx
	leal	1(%r10), %esi
	call	MPI_Recv
	popq	%rax
	popq	%rdx
.L192:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L193
	movl	NP(%rip), %eax
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%rax), %esi
	movslq	%esi, %rdi
	imulq	nN(%rip), %rdi
	leaq	(%r14,%rdi,8), %rdi
	call	MPI_Send
	movl	NP(%rip), %ecx
	subq	$8, %rsp
	movq	nN(%rip), %r8
	pushq	%rbx
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%rcx), %esi
	incq	%r8
	movl	vizSul(%rip), %ecx
	movslq	%esi, %r15
	imulq	%r15, %r8
	leaq	(%r14,%r8,8), %rdi
	xorl	%r8d, %r8d
	call	MPI_Recv
	popq	%r15
	popq	%rax
.L193:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	-560(%rbp), %rsi
	movl	$main._omp_fn.2, %edi
	movq	%r14, -552(%rbp)
	movq	%r13, -560(%rbp)
	call	GOMP_parallel
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L194
	movslq	NP(%rip), %r9
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r9), %esi
	leaq	8(%r13,%r9,8), %rdi
	movl	$1140850688, %r9d
	call	MPI_Send
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	%r13, %rdi
	pushq	%rbx
	movl	NP(%rip), %esi
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	movl	vizNorte(%rip), %ecx
	leal	1(%rsi), %esi
	call	MPI_Recv
	popq	%r10
	popq	%r11
.L194:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L195
	movl	NP(%rip), %edx
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	leal	1(%rdx), %esi
	movl	$1275070475, %edx
	movslq	%esi, %r11
	imulq	nN(%rip), %r11
	leaq	0(%r13,%r11,8), %rdi
	call	MPI_Send
	movl	NP(%rip), %r10d
	subq	$8, %rsp
	movq	nN(%rip), %rax
	pushq	%rbx
	movl	vizSul(%rip), %ecx
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	leal	1(%r10), %esi
	incq	%rax
	movl	$1275070475, %edx
	movslq	%esi, %rdi
	imulq	%rdi, %rax
	leaq	0(%r13,%rax,8), %rdi
	call	MPI_Recv
	popq	%r8
	popq	%r9
.L195:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	-560(%rbp), %rsi
	movl	$main._omp_fn.3, %edi
	movq	%r14, -552(%rbp)
	movq	%r13, -560(%rbp)
	call	GOMP_parallel
	movl	vizNorte(%rip), %ecx
	incq	m(%rip)
	cmpl	$-1, %ecx
	je	.L196
	movslq	NP(%rip), %r8
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%r8), %esi
	leaq	8(%r13,%r8,8), %rdi
	xorl	%r8d, %r8d
	call	MPI_Send
	subq	$8, %rsp
	movq	%r13, %rdi
	xorl	%r8d, %r8d
	movl	NP(%rip), %ecx
	pushq	%rbx
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%rcx), %esi
	movl	vizNorte(%rip), %ecx
	call	MPI_Recv
	popq	%rsi
	popq	%rdi
.L196:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L197
	movl	NP(%rip), %r15d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r15), %esi
	movslq	%esi, %r9
	imulq	nN(%rip), %r9
	leaq	0(%r13,%r9,8), %rdi
	movl	$1140850688, %r9d
	call	MPI_Send
	movl	NP(%rip), %esi
	subq	$8, %rsp
	movq	nN(%rip), %r11
	pushq	%rbx
	movl	vizSul(%rip), %ecx
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d
	leal	1(%rsi), %esi
	incq	%r11
	movslq	%esi, %rdx
	imulq	%rdx, %r11
	movl	$1275070475, %edx
	leaq	0(%r13,%r11,8), %rdi
	call	MPI_Recv
	vmovsd	-832(%rbp), %xmm0
	popq	%rdx
	vmulsd	tempoFinal(%rip), %xmm0, %xmm10
	popq	%rcx
	vcomisd	-656(%rbp), %xmm10
	ja	.L187
.L199:
	call	omp_get_wtime
	movslq	myRank(%rip), %rbx
	vmovsd	%xmm0, t_fim(%rip)
	testl	%ebx, %ebx
	je	.L188
	movq	$0, -616(%rbp)
	movl	NP(%rip), %ecx
	movq	$0, -816(%rbp)
	movq	$0, -752(%rbp)
.L189:
	subq	$8, %rsp
	leal	1(%rcx), %esi
	movq	nN(%rip), %r12
	movq	-752(%rbp), %rcx
	pushq	$1140850688
	movq	-616(%rbp), %r9
	movl	$1275070475, %edx
	movq	%r13, %rdi
	addq	$2, %r12
	pushq	$0
	movq	-816(%rbp), %r8
	pushq	$1275070475
	imull	%r12d, %esi
	call	MPI_Gatherv
	movl	myRank(%rip), %ecx
	addq	$32, %rsp
	testl	%ecx, %ecx
	jne	.L214
	movl	$10, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	t_fim(%rip), %xmm2
	movl	$_ZSt4cout, %edi
	vsubsd	t_ini(%rip), %xmm2, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$13, %edx
	movl	$.LC25, %esi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$16, %edx
	movl	$.LC26, %esi
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode
.LEHE0:
	leaq	-448(%rbp), %rdi
	call	_ZNKSt12__basic_fileIcE7is_openEv
	testb	%al, %al
	je	.L215
	cmpq	$0, N(%rip)
	movq	$0, -784(%rbp)
	jle	.L217
	.p2align 4,,10
	.p2align 3
.L216:
	movl	-784(%rbp), %r11d
	vxorpd	%xmm5, %xmm5, %xmm5
	xorl	%ebx, %ebx
	vcvtsi2sdl	%r11d, %xmm5, %xmm1
	movl	%r11d, -688(%rbp)
	vmovsd	%xmm1, -720(%rbp)
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L366:
	movsbl	67(%r15), %esi
.L220:
	movq	%r12, %rdi
.LEHB1:
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movq	N(%rip), %r10
	incq	%rbx
	cmpq	%rbx, %r10
	jle	.L364
.L221:
	vxorpd	%xmm14, %xmm14, %xmm14
	vmovsd	h(%rip), %xmm3
	leaq	-560(%rbp), %rdi
	vcvtsi2sdl	%ebx, %xmm14, %xmm12
	vmulsd	-720(%rbp), %xmm3, %xmm0
	vmulsd	%xmm3, %xmm12, %xmm15
	vmovsd	%xmm15, -656(%rbp)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %edx
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	-656(%rbp), %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %edx
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	NP(%rip), %eax
	movq	-752(%rbp), %rdx
	movq	%r12, %rdi
	incl	%eax
	imull	-688(%rbp), %eax
	addl	%ebx, %eax
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movq	(%rax), %rdi
	movq	%rax, %r12
	movq	-24(%rdi), %r8
	movq	240(%rax,%r8), %r15
	testq	%r15, %r15
	je	.L365
	cmpb	$0, 56(%r15)
	jne	.L366
	movq	%r15, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r15), %rsi
	movq	48(%rsi), %rax
	movl	$10, %esi
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L220
	movq	%r15, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L197:
	vmovsd	-832(%rbp), %xmm7
	vmulsd	tempoFinal(%rip), %xmm7, %xmm9
	vcomisd	-656(%rbp), %xmm9
	ja	.L187
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L364:
	incq	-784(%rbp)
	movq	-784(%rbp), %r9
	cmpq	%r9, %r10
	jg	.L216
.L217:
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
.LEHE1:
.L223:
	movq	-752(%rbp), %rdi
	call	free
	movq	-816(%rbp), %rdi
	call	free
	movq	-616(%rbp), %rdi
	call	free
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L214:
.LEHB2:
	call	MPI_Finalize
	movq	%r13, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	leaq	-48(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rcx
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rcx), %rsp
	.cfi_def_cfa 7, 8
	ret
.L226:
	.cfi_restore_state
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	jmp	.L178
.L172:
	addl	%edx, %r14d
	addl	%edx, %ebx
	jmp	.L173
.L188:
	movq	N(%rip), %r12
	leaq	1(%r12), %rdi
	movq	%r12, -688(%rbp)
	imulq	%r12, %rdi
	salq	$3, %rdi
	call	malloc
	movslq	numProcs(%rip), %r10
	movq	%rax, -752(%rbp)
	leaq	0(,%r10,4), %r15
	movq	%r10, -656(%rbp)
	movq	%r10, %r12
	movq	%r15, %rdi
	call	malloc
	movq	%r15, %rdi
	movq	%rax, -816(%rbp)
	call	malloc
	movl	NP(%rip), %ecx
	movq	%rax, -616(%rbp)
	leal	1(%rcx), %r11d
	testl	%r12d, %r12d
	jle	.L189
	movq	-688(%rbp), %rax
	movq	-656(%rbp), %rdi
	movl	resto(%rip), %r8d
	leaq	-2(%rax), %rax
	cqto
	idivq	%rdi
	movl	%eax, -656(%rbp)
	testl	%r8d, %r8d
	jle	.L201
	cmpl	%r8d, %r12d
	movl	$1, %edx
	cmovle	%r12d, %r8d
	testl	%r8d, %r8d
	movl	%r8d, %r10d
	cmovg	%r8d, %edx
	cmpl	$7, %r8d
	jle	.L228
	movl	%edx, %r8d
	leal	2(%rax), %edi
	vmovdqa	.LC10(%rip), %ymm0
	xorl	%esi, %esi
	leal	3(%rax), %r9d
	vmovd	%r11d, %xmm11
	shrl	$3, %r8d
	vmovd	%edi, %xmm2
	movl	%r9d, %ebx
	salq	$5, %r8
	vmovdqa	.LC3(%rip), %ymm15
	vmovdqa	.LC22(%rip), %ymm4
	imull	%r11d, %ebx
	vpbroadcastd	%xmm11, %ymm12
	vpbroadcastd	%xmm2, %ymm8
	vmovd	%ebx, %xmm13
	leaq	-32(%r8), %rbx
	shrq	$5, %rbx
	vpbroadcastd	%xmm13, %ymm14
	incq	%rbx
	andl	$7, %ebx
	je	.L355
	cmpq	$1, %rbx
	je	.L305
	cmpq	$2, %rbx
	je	.L306
	cmpq	$3, %rbx
	je	.L307
	cmpq	$4, %rbx
	je	.L308
	cmpq	$5, %rbx
	je	.L309
	cmpq	$6, %rbx
	jne	.L367
.L310:
	vmovdqa	%ymm0, %ymm6
	movq	-816(%rbp), %rdi
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %rbx
	vpmulld	%ymm6, %ymm8, %ymm7
	vmovdqu	%ymm14, (%rdi,%rsi)
	vpmulld	%ymm12, %ymm7, %ymm9
	vmovdqu	%ymm9, (%rbx,%rsi)
	addq	$32, %rsi
.L309:
	vmovdqa	%ymm0, %ymm10
	movq	-816(%rbp), %r15
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %rdi
	vpmulld	%ymm10, %ymm8, %ymm11
	vmovdqu	%ymm14, (%r15,%rsi)
	vpmulld	%ymm12, %ymm11, %ymm13
	vmovdqu	%ymm13, (%rdi,%rsi)
	addq	$32, %rsi
.L308:
	vmovdqa	%ymm0, %ymm2
	movq	-816(%rbp), %rbx
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %r15
	vpmulld	%ymm2, %ymm8, %ymm1
	vmovdqu	%ymm14, (%rbx,%rsi)
	vpmulld	%ymm12, %ymm1, %ymm5
	vmovdqu	%ymm5, (%r15,%rsi)
	addq	$32, %rsi
.L307:
	vmovdqa	%ymm0, %ymm3
	movq	-816(%rbp), %rdi
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %rbx
	vpmulld	%ymm3, %ymm8, %ymm6
	vmovdqu	%ymm14, (%rdi,%rsi)
	vpmulld	%ymm12, %ymm6, %ymm7
	vmovdqu	%ymm7, (%rbx,%rsi)
	addq	$32, %rsi
.L306:
	vmovdqa	%ymm0, %ymm9
	movq	-816(%rbp), %r15
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %rdi
	vpmulld	%ymm9, %ymm8, %ymm10
	vmovdqu	%ymm14, (%r15,%rsi)
	vpmulld	%ymm12, %ymm10, %ymm11
	vmovdqu	%ymm11, (%rdi,%rsi)
	addq	$32, %rsi
.L305:
	vmovdqa	%ymm0, %ymm13
	movq	-816(%rbp), %rbx
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %r15
	vpmulld	%ymm13, %ymm8, %ymm2
	vpaddd	%ymm4, %ymm13, %ymm5
	vmovdqu	%ymm14, (%rbx,%rsi)
	vpmulld	%ymm12, %ymm2, %ymm1
	vmovdqu	%ymm1, (%r15,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r8
	je	.L349
.L355:
	movq	-816(%rbp), %rdi
	movq	-616(%rbp), %rbx
	movl	%eax, %r15d
.L203:
	vpaddd	%ymm15, %ymm0, %ymm3
	vpmulld	%ymm0, %ymm8, %ymm6
	vmovdqu	%ymm14, (%rdi,%rsi)
	vpaddd	%ymm15, %ymm3, %ymm9
	vpmulld	%ymm3, %ymm8, %ymm10
	vmovdqu	%ymm14, 32(%rdi,%rsi)
	vpmulld	%ymm9, %ymm8, %ymm0
	vpaddd	%ymm15, %ymm9, %ymm13
	vmovdqu	%ymm14, 64(%rdi,%rsi)
	vpmulld	%ymm13, %ymm8, %ymm1
	vpaddd	%ymm15, %ymm13, %ymm5
	vmovdqu	%ymm14, 96(%rdi,%rsi)
	vmovdqu	%ymm14, 128(%rdi,%rsi)
	vmovdqu	%ymm14, 160(%rdi,%rsi)
	vpmulld	%ymm12, %ymm6, %ymm7
	vpaddd	%ymm15, %ymm5, %ymm6
	vmovdqu	%ymm14, 192(%rdi,%rsi)
	vpmulld	%ymm12, %ymm10, %ymm11
	vpaddd	%ymm15, %ymm6, %ymm10
	vmovdqu	%ymm14, 224(%rdi,%rsi)
	vpmulld	%ymm12, %ymm0, %ymm2
	vpmulld	%ymm10, %ymm8, %ymm0
	vpmulld	%ymm12, %ymm1, %ymm3
	vmovdqu	%ymm7, (%rbx,%rsi)
	vpmulld	%ymm5, %ymm8, %ymm7
	vmovdqu	%ymm11, 32(%rbx,%rsi)
	vpmulld	%ymm6, %ymm8, %ymm11
	vmovdqu	%ymm2, 64(%rbx,%rsi)
	vpaddd	%ymm15, %ymm10, %ymm2
	vpmulld	%ymm12, %ymm0, %ymm5
	vpmulld	%ymm2, %ymm8, %ymm1
	vmovdqu	%ymm3, 96(%rbx,%rsi)
	vpaddd	%ymm15, %ymm2, %ymm0
	vpmulld	%ymm12, %ymm7, %ymm9
	vpmulld	%ymm12, %ymm11, %ymm13
	vmovdqu	%ymm5, 192(%rbx,%rsi)
	vpaddd	%ymm4, %ymm2, %ymm5
	vpmulld	%ymm12, %ymm1, %ymm3
	vmovdqu	%ymm9, 128(%rbx,%rsi)
	vmovdqu	%ymm13, 160(%rbx,%rsi)
	vmovdqu	%ymm3, 224(%rbx,%rsi)
	addq	$256, %rsi
	cmpq	%rsi, %r8
	jne	.L203
	movl	%r15d, -656(%rbp)
.L349:
	movl	%edx, %esi
	vextracti128	$0x1, %ymm5, %xmm12
	andl	$-8, %esi
	vpextrd	$3, %xmm12, %r8d
	movl	%esi, %ebx
	cmpl	%edx, %esi
	je	.L204
.L202:
	subl	%esi, %edx
	leal	-1(%rdx), %r8d
	cmpl	$2, %r8d
	jbe	.L368
	movl	%r9d, %edi
	vmovd	%ebx, %xmm14
	vmovd	%r11d, %xmm11
	movq	-616(%rbp), %r8
	imull	%r11d, %edi
	vpshufd	$0, %xmm14, %xmm15
	vpaddd	.LC6(%rip), %xmm15, %xmm6
	movq	-816(%rbp), %r15
	vpshufd	$0, %xmm11, %xmm13
	vpaddd	.LC23(%rip), %xmm15, %xmm0
	vmovd	%edi, %xmm4
	leal	2(%rax), %edi
	vmovd	%edi, %xmm7
	vpshufd	$0, %xmm4, %xmm8
	vpshufd	$0, %xmm7, %xmm9
	vmovdqu	%xmm8, (%r15,%rsi,4)
	vpmulld	%xmm9, %xmm6, %xmm10
	vpmulld	%xmm13, %xmm10, %xmm2
	vmovdqu	%xmm2, (%r8,%rsi,4)
	movl	%edx, %esi
	vpextrd	$3, %xmm0, %r8d
	andl	$-4, %esi
	addl	%esi, %ebx
	cmpl	%esi, %edx
	je	.L204
.L205:
	movslq	%ebx, %r8
	imull	%r11d, %r9d
	movq	-816(%rbp), %r15
	leaq	0(,%r8,4), %rdx
	movq	%rdx, -720(%rbp)
	movl	%edi, %edx
	imull	%ebx, %edx
	movl	%r9d, (%r15,%r8,4)
	movl	%r9d, -688(%rbp)
	movq	-616(%rbp), %r9
	movl	%edx, %esi
	imull	%r11d, %esi
	movl	%esi, (%r9,%r8,4)
	leal	1(%rbx), %r8d
	cmpl	%r8d, %r10d
	jle	.L204
	movq	%r15, %r8
	movl	-688(%rbp), %esi
	movq	-720(%rbp), %r15
	addl	%edi, %edx
	movl	%esi, 4(%r8,%r15)
	movl	%edx, %r8d
	movq	%r15, %rsi
	imull	%r11d, %r8d
	movl	%r8d, 4(%r9,%r15)
	leal	2(%rbx), %r8d
	cmpl	%r8d, %r10d
	jle	.L204
	addl	%edi, %edx
	movl	-688(%rbp), %r8d
	movq	-816(%rbp), %r15
	imull	%r11d, %edx
	movl	%r8d, 8(%r15,%rsi)
	leal	3(%rbx), %r8d
	movl	%edx, 8(%r9,%rsi)
.L204:
	movslq	%r8d, %rbx
	cmpl	%ebx, %r12d
	jle	.L360
.L201:
	movl	%r12d, %edi
	movl	$1, %r9d
	subl	%ebx, %edi
	cmpl	%ebx, %r12d
	cmovg	%edi, %r9d
	decl	%edi
	cmpl	$6, %edi
	jbe	.L229
	cmpl	%ebx, %r12d
	jle	.L229
	leal	2(%rax), %r10d
	movl	%r9d, %r15d
	vmovd	%ebx, %xmm5
	movslq	%ebx, %rsi
	movl	%r10d, %edi
	shrl	$3, %r15d
	vmovd	%r11d, %xmm3
	vpbroadcastd	%xmm5, %ymm1
	imull	%r11d, %edi
	salq	$5, %r15
	salq	$2, %rsi
	movq	-816(%rbp), %rdx
	vpaddd	.LC10(%rip), %ymm1, %ymm0
	vmovdqa	.LC3(%rip), %ymm4
	vpbroadcastd	%xmm3, %ymm12
	leaq	(%rdx,%rsi), %r8
	addq	-616(%rbp), %rsi
	xorl	%edx, %edx
	vmovd	%edi, %xmm14
	movl	-656(%rbp), %edi
	vpbroadcastd	%xmm14, %ymm15
	incl	%edi
	vmovd	%edi, %xmm8
	movq	%r15, %rdi
	subq	$32, %rdi
	vpbroadcastd	%xmm8, %ymm6
	shrq	$5, %rdi
	incq	%rdi
	andl	$7, %edi
	je	.L208
	cmpq	$1, %rdi
	je	.L311
	cmpq	$2, %rdi
	je	.L312
	cmpq	$3, %rdi
	je	.L313
	cmpq	$4, %rdi
	je	.L314
	cmpq	$5, %rdi
	je	.L315
	cmpq	$6, %rdi
	jne	.L369
.L316:
	vmovdqa	%ymm0, %ymm11
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm11, %ymm6, %ymm13
	vpmulld	%ymm12, %ymm13, %ymm2
	vmovdqu	%ymm2, (%rsi,%rdx)
	addq	$32, %rdx
.L315:
	vmovdqa	%ymm0, %ymm5
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm5, %ymm6, %ymm1
	vpmulld	%ymm12, %ymm1, %ymm3
	vmovdqu	%ymm3, (%rsi,%rdx)
	addq	$32, %rdx
.L314:
	vmovdqa	%ymm0, %ymm14
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm14, %ymm6, %ymm8
	vpmulld	%ymm12, %ymm8, %ymm7
	vmovdqu	%ymm7, (%rsi,%rdx)
	addq	$32, %rdx
.L313:
	vmovdqa	%ymm0, %ymm9
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm9, %ymm6, %ymm10
	vpmulld	%ymm12, %ymm10, %ymm11
	vmovdqu	%ymm11, (%rsi,%rdx)
	addq	$32, %rdx
.L312:
	vmovdqa	%ymm0, %ymm13
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm13, %ymm6, %ymm2
	vpmulld	%ymm12, %ymm2, %ymm5
	vmovdqu	%ymm5, (%rsi,%rdx)
	addq	$32, %rdx
.L311:
	vmovdqa	%ymm0, %ymm1
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm1, %ymm6, %ymm3
	vpmulld	%ymm12, %ymm3, %ymm14
	vmovdqu	%ymm14, (%rsi,%rdx)
	addq	$32, %rdx
	cmpq	%r15, %rdx
	je	.L348
.L208:
	vpaddd	%ymm4, %ymm0, %ymm8
	vpmulld	%ymm0, %ymm6, %ymm7
	vmovdqu	%ymm15, (%r8,%rdx)
	vpaddd	%ymm4, %ymm8, %ymm10
	vpmulld	%ymm8, %ymm6, %ymm11
	vmovdqu	%ymm15, 32(%r8,%rdx)
	vpaddd	%ymm4, %ymm10, %ymm2
	vpmulld	%ymm10, %ymm6, %ymm5
	vmovdqu	%ymm15, 64(%r8,%rdx)
	vpmulld	%ymm2, %ymm6, %ymm3
	vpaddd	%ymm4, %ymm2, %ymm0
	vmovdqu	%ymm15, 96(%r8,%rdx)
	vmovdqu	%ymm15, 128(%r8,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm8
	vpaddd	%ymm4, %ymm8, %ymm10
	vpmulld	%ymm12, %ymm7, %ymm9
	vmovdqu	%ymm15, 160(%r8,%rdx)
	vpmulld	%ymm12, %ymm11, %ymm13
	vpaddd	%ymm4, %ymm10, %ymm2
	vmovdqu	%ymm15, 192(%r8,%rdx)
	vpmulld	%ymm12, %ymm5, %ymm1
	vpmulld	%ymm0, %ymm6, %ymm7
	vmovdqu	%ymm15, 224(%r8,%rdx)
	vpaddd	%ymm4, %ymm2, %ymm0
	vpmulld	%ymm12, %ymm3, %ymm14
	vpmulld	%ymm8, %ymm6, %ymm11
	vpmulld	%ymm10, %ymm6, %ymm5
	vpmulld	%ymm2, %ymm6, %ymm3
	vmovdqu	%ymm9, (%rsi,%rdx)
	vmovdqu	%ymm13, 32(%rsi,%rdx)
	vmovdqu	%ymm1, 64(%rsi,%rdx)
	vpmulld	%ymm12, %ymm7, %ymm9
	vmovdqu	%ymm14, 96(%rsi,%rdx)
	vpmulld	%ymm12, %ymm11, %ymm13
	vpmulld	%ymm12, %ymm5, %ymm1
	vpmulld	%ymm12, %ymm3, %ymm14
	vmovdqu	%ymm9, 128(%rsi,%rdx)
	vmovdqu	%ymm13, 160(%rsi,%rdx)
	vmovdqu	%ymm1, 192(%rsi,%rdx)
	vmovdqu	%ymm14, 224(%rsi,%rdx)
	addq	$256, %rdx
	cmpq	%r15, %rdx
	jne	.L208
.L348:
	movl	%r9d, %esi
	andl	$-8, %esi
	leal	(%rsi,%rbx), %edx
	cmpl	%esi, %r9d
	je	.L360
.L207:
	subl	%esi, %r9d
	leal	-1(%r9), %r8d
	cmpl	$2, %r8d
	jbe	.L370
	vmovd	%edx, %xmm4
	incl	%eax
	vmovd	%r11d, %xmm10
	addq	%rbx, %rsi
	vpshufd	$0, %xmm4, %xmm6
	vmovd	%eax, %xmm8
	vpshufd	$0, %xmm10, %xmm11
	movl	%r10d, %ebx
	vpshufd	$0, %xmm8, %xmm7
	vpaddd	.LC6(%rip), %xmm6, %xmm0
	movq	-816(%rbp), %r15
	imull	%r11d, %ebx
	movq	-616(%rbp), %rdi
	vpmulld	%xmm7, %xmm0, %xmm9
	vmovd	%ebx, %xmm12
	vpshufd	$0, %xmm12, %xmm15
	vmovdqu	%xmm15, (%r15,%rsi,4)
	vpmulld	%xmm11, %xmm9, %xmm13
	vmovdqu	%xmm13, (%rdi,%rsi,4)
	movl	%r9d, %esi
	andl	$-4, %esi
	addl	%esi, %edx
	cmpl	%r9d, %esi
	je	.L360
.L212:
	movl	%eax, %esi
	imull	%r11d, %r10d
	movq	-816(%rbp), %rbx
	movslq	%edx, %r9
	imull	%edx, %esi
	movq	-616(%rbp), %r15
	leaq	0(,%r9,4), %rdi
	movl	%r10d, (%rbx,%r9,4)
	movl	%r10d, %r8d
	movl	%esi, %r10d
	imull	%r11d, %r10d
	movl	%r10d, (%r15,%r9,4)
	leal	1(%rdx), %r9d
	cmpl	%r9d, %r12d
	jle	.L360
	addl	%eax, %esi
	movl	%r11d, %r9d
	addl	$2, %edx
	movl	%r8d, 4(%rbx,%rdi)
	imull	%esi, %r9d
	movl	%r9d, 4(%r15,%rdi)
	cmpl	%edx, %r12d
	jle	.L360
	addl	%esi, %eax
	movl	%r8d, 8(%rbx,%rdi)
	imull	%r11d, %eax
	movl	%eax, 8(%r15,%rdi)
	vzeroupper
	jmp	.L189
.L360:
	vzeroupper
	jmp	.L189
.L357:
	vzeroupper
	jmp	.L176
.L362:
	movl	$67, %edx
	movl	$.LC12, %esi
	movl	$_ZSt4cerr, %edi
	vmovsd	%xmm6, -688(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$_ZSt4cerr, %edi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$9, %edx
	movl	$.LC13, %esi
	movl	$_ZSt4cerr, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	deltaT(%rip), %xmm0
	movl	$_ZSt4cerr, %edi
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$27, %edx
	movl	$.LC14, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	-688(%rbp), %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.LEHE2:
	vmovsd	-656(%rbp), %xmm7
	jmp	.L171
.L215:
	movl	$37, %edx
	movl	$.LC28, %esi
	movl	$_ZSt4cerr, %edi
.LEHB3:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$_ZSt4cerr, %edi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L223
.L363:
	vmovsd	.LC15(%rip), %xmm10
	vmovsd	%xmm10, -832(%rbp)
	jmp	.L176
.L367:
	vmovdqa	%ymm0, %ymm1
	movq	-816(%rbp), %rsi
	vpaddd	%ymm15, %ymm0, %ymm0
	movq	-616(%rbp), %r15
	vpmulld	%ymm1, %ymm8, %ymm5
	vmovdqu	%ymm14, (%rsi)
	movl	$32, %esi
	vpmulld	%ymm12, %ymm5, %ymm3
	vmovdqu	%ymm3, (%r15)
	jmp	.L310
.L369:
	vmovdqa	%ymm0, %ymm7
	vmovdqu	%ymm15, (%r8)
	vpaddd	%ymm4, %ymm0, %ymm0
	movl	$32, %edx
	vpmulld	%ymm7, %ymm6, %ymm9
	vpmulld	%ymm12, %ymm9, %ymm10
	vmovdqu	%ymm10, (%rsi)
	jmp	.L316
.L370:
	incl	%eax
	jmp	.L212
.L228:
	xorl	%esi, %esi
	leal	3(%rax), %r9d
	jmp	.L202
.L368:
	leal	2(%rax), %edi
	jmp	.L205
.L229:
	movl	%ebx, %edx
	xorl	%esi, %esi
	leal	2(%rax), %r10d
	jmp	.L207
.L365:
	call	_ZSt16__throw_bad_castv
.LEHE3:
.L233:
	movq	%rax, %r13
	jmp	.L224
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3107:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3107-.LLSDACSB3107
.LLSDACSB3107:
	.uleb128 .LEHB0-.LFB3107
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3107
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L233-.LFB3107
	.uleb128 0
	.uleb128 .LEHB2-.LFB3107
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3107
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L233-.LFB3107
	.uleb128 0
.LLSDACSE3107:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC3107
	.type	main.cold, @function
main.cold:
.LFSB3107:
.L224:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	-560(%rbp), %rdi
	vzeroupper
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	movq	%r13, %rdi
.LEHB4:
	call	_Unwind_Resume
.LEHE4:
	.cfi_endproc
.LFE3107:
	.section	.gcc_except_table
.LLSDAC3107:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3107-.LLSDACSBC3107
.LLSDACSBC3107:
	.uleb128 .LEHB4-.LCOLDB32
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC3107:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE32:
	.section	.text.startup
.LHOTE32:
	.p2align 4
	.type	_GLOBAL__sub_I_x, @function
_GLOBAL__sub_I_x:
.LFB3799:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE3799:
	.size	_GLOBAL__sub_I_x, .-_GLOBAL__sub_I_x
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_x
	.globl	vizSul
	.bss
	.align 4
	.type	vizSul, @object
	.size	vizSul, 4
vizSul:
	.zero	4
	.globl	vizNorte
	.align 4
	.type	vizNorte, @object
	.size	vizNorte, 4
vizNorte:
	.zero	4
	.globl	resto
	.align 4
	.type	resto, @object
	.size	resto, 4
resto:
	.zero	4
	.globl	finalLocal
	.align 4
	.type	finalLocal, @object
	.size	finalLocal, 4
finalLocal:
	.zero	4
	.globl	inicioLocal
	.align 4
	.type	inicioLocal, @object
	.size	inicioLocal, 4
inicioLocal:
	.zero	4
	.globl	numLocalPontos
	.align 4
	.type	numLocalPontos, @object
	.size	numLocalPontos, 4
numLocalPontos:
	.zero	4
	.globl	numProcs
	.align 4
	.type	numProcs, @object
	.size	numProcs, 4
numProcs:
	.zero	4
	.globl	myRank
	.align 4
	.type	myRank, @object
	.size	myRank, 4
myRank:
	.zero	4
	.globl	NP
	.align 4
	.type	NP, @object
	.size	NP, 4
NP:
	.zero	4
	.globl	m
	.align 8
	.type	m, @object
	.size	m, 8
m:
	.zero	8
	.globl	nN
	.align 8
	.type	nN, @object
	.size	nN, 8
nN:
	.zero	8
	.globl	contagemTempo
	.align 8
	.type	contagemTempo, @object
	.size	contagemTempo, 8
contagemTempo:
	.zero	8
	.globl	N
	.align 8
	.type	N, @object
	.size	N, 8
N:
	.zero	8
	.globl	suporteSuperior
	.align 8
	.type	suporteSuperior, @object
	.size	suporteSuperior, 8
suporteSuperior:
	.zero	8
	.globl	suporteInferior
	.align 8
	.type	suporteInferior, @object
	.size	suporteInferior, 8
suporteInferior:
	.zero	8
	.globl	yTil
	.align 8
	.type	yTil, @object
	.size	yTil, 8
yTil:
	.zero	8
	.globl	xTil
	.align 8
	.type	xTil, @object
	.size	xTil, 8
xTil:
	.zero	8
	.globl	t_fim
	.align 8
	.type	t_fim, @object
	.size	t_fim, 8
t_fim:
	.zero	8
	.globl	t_ini
	.align 8
	.type	t_ini, @object
	.size	t_ini, 8
t_ini:
	.zero	8
	.globl	gama
	.align 8
	.type	gama, @object
	.size	gama, 8
gama:
	.zero	8
	.globl	beta_coef
	.align 32
	.type	beta_coef, @object
	.size	beta_coef, 8
beta_coef:
	.zero	8
	.globl	alfa
	.align 32
	.type	alfa, @object
	.size	alfa, 8
alfa:
	.zero	8
	.globl	deltaY
	.align 8
	.type	deltaY, @object
	.size	deltaY, 8
deltaY:
	.zero	8
	.globl	deltaX
	.align 8
	.type	deltaX, @object
	.size	deltaX, 8
deltaX:
	.zero	8
	.globl	deltaT
	.align 8
	.type	deltaT, @object
	.size	deltaT, 8
deltaT:
	.zero	8
	.globl	tempoFinal
	.align 8
	.type	tempoFinal, @object
	.size	tempoFinal, 8
tempoFinal:
	.zero	8
	.globl	velY
	.align 8
	.type	velY, @object
	.size	velY, 8
velY:
	.zero	8
	.globl	velX
	.align 8
	.type	velX, @object
	.size	velX, 8
velX:
	.zero	8
	.globl	h
	.align 8
	.type	h, @object
	.size	h, 8
h:
	.zero	8
	.globl	y
	.align 8
	.type	y, @object
	.size	y, 8
y:
	.zero	8
	.globl	x
	.align 8
	.type	x, @object
	.size	x, 8
x:
	.zero	8
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.set	.LC0,.LC5
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.align 32
.LC3:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC4:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC5:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.set	.LC6,.LC10
	.set	.LC7,.LC4
	.set	.LC8,.LC5
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC9:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC10:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	0
	.long	1070596096
	.align 8
.LC15:
	.long	0
	.long	1071644672
	.section	.rodata.cst32
	.align 32
.LC16:
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.align 32
.LC17:
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.set	.LC18,.LC16
	.set	.LC19,.LC17
	.set	.LC20,.LC17
	.set	.LC21,.LC9+8
	.align 32
.LC22:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.set	.LC23,.LC2
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits
