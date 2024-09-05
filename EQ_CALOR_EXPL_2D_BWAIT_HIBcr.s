	.file	"EQ_CALOR_EXPL_2D_BWAIT_HIBcr.cpp"
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
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB3800:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3800
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
	subq	$256, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	16(%rdi), %r13
	movq	8(%rdi), %r15
	movq	%rdi, -288(%rbp)
	call	omp_get_thread_num
	movl	%eax, %r14d
	movl	%eax, -212(%rbp)
	call	omp_get_num_threads
	movl	%r14d, %esi
	movslq	%eax, %rcx
	movq	nN(%rip), %rax
	movq	%rcx, %rbx
	cqto
	idivq	%rcx
	imull	%eax, %esi
	leal	1(%rsi), %edi
	addl	%esi, %eax
	cmpl	%edx, %r14d
	jge	.L264
	addl	%r14d, %edi
	leal	1(%r14,%rax), %r8d
	movl	%r14d, %r9d
	movl	%edi, -216(%rbp)
	movl	%r8d, -124(%rbp)
.L97:
	leal	1(%r9), %eax
	cltq
	movq	%rax, -160(%rbp)
	movl	$0, lock(,%rax,4)
	testl	%r9d, %r9d
	jne	.L96
	movl	$0, lock(%rip)
	leal	1(%rbx), %eax
	cltq
	movl	$0, lock(,%rax,4)
.L96:
	call	GOMP_barrier
	vmovsd	.LC1(%rip), %xmm6
	vmulsd	tempoFinal(%rip), %xmm6, %xmm0
	vcomisd	.LC2(%rip), %xmm0
	jbe	.L262
	movl	-212(%rbp), %r12d
	leal	-1(%rbx), %r11d
	movslq	-216(%rbp), %rdx
	movl	$0, -240(%rbp)
	movl	%r11d, -236(%rbp)
	vmovapd	.LC7(%rip), %ymm15
	leal	2(%r12), %eax
	movslq	%r12d, %rbx
	movq	%rdx, -264(%rbp)
	negq	%rdx
	cltq
	movq	%rbx, -256(%rbp)
	leaq	0(,%rdx,8), %r14
	movq	%rax, -248(%rbp)
	movq	%r14, -280(%rbp)
	movq	%r13, %r14
	.p2align 4,,10
	.p2align 3
.L40:
	incl	-240(%rbp)
	movl	-240(%rbp), %r13d
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	-160(%rbp), %rsi
	movl	-124(%rbp), %edi
	vcvtsi2sdl	%r13d, %xmm1, %xmm2
	vmulsd	deltaT(%rip), %xmm2, %xmm3
	movl	-216(%rbp), %r13d
	movl	$1, lock(,%rsi,4)
	vmovsd	%xmm3, -272(%rbp)
	cmpl	%edi, %r13d
	jg	.L8
	movq	N(%rip), %r8
	movq	NP(%rip), %rcx
	movq	m(%rip), %r11
	leaq	-1(%r8), %r9
	leaq	1(%rcx), %rdx
	movq	%r9, -112(%rbp)
	movq	%r11, -96(%rbp)
	movq	%rdx, -152(%rbp)
	cmpq	$1, %r9
	jle	.L8
	movq	-264(%rbp), %rbx
	leaq	-2(%r8), %rdi
	leaq	-3(%r8), %rsi
	movq	%r14, -104(%rbp)
	leaq	0(,%rdx,8), %r10
	movq	%rdi, -184(%rbp)
	imulq	%rbx, %rdx
	addq	%rbx, %r11
	movq	%r10, -176(%rbp)
	movq	%rsi, -168(%rbp)
	addq	%rdx, %r9
	leaq	8(%r14,%rdx,8), %r12
	leaq	(%r14,%r9,8), %rax
	movq	%rdi, %r9
	andq	$-8, %rdi
	movq	%rdx, %r14
	subq	%rdi, %r8
	movq	%rax, -120(%rbp)
	movq	%rbx, %rax
	movq	%r11, %rbx
	movl	%edi, %r11d
	imulq	%r10, %rax
	shrq	$3, %r9
	leaq	1(%rdi), %rcx
	movq	%r8, -200(%rbp)
	incl	%r11d
	leaq	-2(%r8), %r8
	movq	%r9, -88(%rbp)
	movq	%rdi, -192(%rbp)
	addq	%r15, %rax
	movl	%r11d, -224(%rbp)
	movq	%rcx, -232(%rbp)
	movq	%r8, -208(%rbp)
	.p2align 4,,10
	.p2align 3
.L10:
	movq	-104(%rbp), %r9
	movq	-152(%rbp), %r10
	leal	1(%r13), %edx
	leal	-1(%r13), %edi
	movslq	%edx, %rsi
	movslq	%edi, %rcx
	movq	-168(%rbp), %r11
	movl	%edx, -128(%rbp)
	subq	%r15, %r9
	imulq	%r10, %rsi
	imulq	%r10, %rcx
	cmpq	$64, %r9
	seta	%dl
	cmpq	$2, %r11
	seta	%r10b
	leaq	16(,%rsi,8), %r8
	andl	%r10d, %edx
	cmpq	$alfa+8, %r12
	leaq	16(,%rcx,8), %rdi
	setnb	%r9b
	cmpq	$alfa, -120(%rbp)
	setbe	%r10b
	orl	%r10d, %r9d
	andl	%edx, %r9d
	cmpq	$beta_coef+8, %r12
	setnb	%dl
	cmpq	$beta_coef, -120(%rbp)
	setbe	%r10b
	orl	%r10d, %edx
	leaq	(%r15,%rdi), %r10
	andl	%r9d, %edx
	movq	%r12, %r9
	subq	%r10, %r9
	cmpq	$48, %r9
	seta	%r10b
	testb	%r10b, %dl
	je	.L79
	leaq	(%r15,%r8), %r9
	movq	%r12, %rdx
	subq	%r9, %rdx
	cmpq	$48, %rdx
	jbe	.L79
	cmpq	$6, %r11
	jbe	.L80
	vmovd	%r13d, %xmm7
	leaq	-8(%r15,%r8), %r10
	leaq	-8(%r15,%rdi), %r9
	xorl	%edx, %edx
	vpbroadcastd	%xmm7, %ymm4
	leaq	8(%rax), %r11
	leaq	16(%rax), %r8
	xorl	%edi, %edi
	vpbroadcastq	-96(%rbp), %ymm12
	vmovdqa	.LC0(%rip), %ymm8
	vpxor	%xmm9, %xmm9, %xmm9
	vmovdqa	%ymm4, -80(%rbp)
	vbroadcastsd	alfa(%rip), %ymm11
	vbroadcastsd	beta_coef(%rip), %ymm10
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L81:
	vptest	%ymm0, %ymm0
	jne	.L265
.L82:
	incq	%rdi
	addq	$64, %rdx
	cmpq	-88(%rbp), %rdi
	je	.L266
.L83:
	vmovdqa	%ymm8, %ymm5
	vpaddd	-80(%rbp), %ymm5, %ymm13
	vpaddd	.LC5(%rip), %ymm8, %ymm8
	vextracti128	$0x1, %ymm13, %xmm2
	vpmovsxdq	%xmm13, %ymm14
	vpmovsxdq	%xmm2, %ymm3
	vpaddq	%ymm12, %ymm14, %ymm6
	vpand	.LC6(%rip), %ymm6, %ymm0
	vpaddq	%ymm12, %ymm3, %ymm7
	vpand	.LC6(%rip), %ymm7, %ymm4
	vpcmpeqq	%ymm9, %ymm0, %ymm1
	vmaskmovpd	(%r10,%rdx), %ymm1, %ymm13
	vmaskmovpd	(%r9,%rdx), %ymm1, %ymm3
	vaddpd	%ymm3, %ymm13, %ymm3
	vpcmpeqq	%ymm9, %ymm4, %ymm0
	vmaskmovpd	(%rax,%rdx), %ymm1, %ymm13
	vmaskmovpd	32(%r10,%rdx), %ymm0, %ymm14
	vmaskmovpd	32(%r9,%rdx), %ymm0, %ymm5
	vmaskmovpd	32(%rax,%rdx), %ymm0, %ymm4
	vaddpd	%ymm5, %ymm14, %ymm2
	vmaskmovpd	(%r8,%rdx), %ymm1, %ymm5
	vmaskmovpd	32(%r8,%rdx), %ymm0, %ymm14
	vaddpd	%ymm13, %ymm5, %ymm5
	vaddpd	%ymm4, %ymm14, %ymm14
	vmaskmovpd	(%r11,%rdx), %ymm1, %ymm7
	vmaskmovpd	32(%r11,%rdx), %ymm0, %ymm6
	vfnmadd231pd	%ymm15, %ymm7, %ymm3
	vptest	%ymm1, %ymm1
	vfnmadd231pd	%ymm15, %ymm6, %ymm2
	vfnmadd231pd	%ymm15, %ymm7, %ymm5
	vfnmadd231pd	%ymm15, %ymm6, %ymm14
	vmulpd	%ymm10, %ymm5, %ymm4
	vmulpd	%ymm10, %ymm14, %ymm13
	vfmadd132pd	%ymm11, %ymm4, %ymm3
	vfmadd132pd	%ymm11, %ymm13, %ymm2
	vaddpd	%ymm3, %ymm7, %ymm7
	vaddpd	%ymm2, %ymm6, %ymm6
	je	.L81
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%r12,%rdx)
	je	.L82
	.p2align 4,,10
	.p2align 3
.L265:
	vmaskmovpd	%ymm6, %ymm0, 32(%r12,%rdx)
	incq	%rdi
	addq	$64, %rdx
	cmpq	-88(%rbp), %rdi
	jne	.L83
	.p2align 4,,10
	.p2align 3
.L266:
	movq	-192(%rbp), %r8
	cmpq	%r8, -184(%rbp)
	je	.L95
	movq	-200(%rbp), %r10
	movq	-208(%rbp), %r11
	subq	$3, %r10
	movq	%r11, -136(%rbp)
	cmpq	$2, %r10
	jbe	.L101
	movq	-232(%rbp), %r9
	movl	-224(%rbp), %edi
	movq	%r9, -144(%rbp)
	movl	%edi, -80(%rbp)
.L99:
	vbroadcastss	-80(%rbp), %xmm11
	vmovd	%r13d, %xmm9
	leaq	1(%r14,%r8), %rdx
	vpaddd	.LC8(%rip), %xmm11, %xmm10
	vpshufd	$0, %xmm9, %xmm8
	salq	$3, %rdx
	vmovddup	-96(%rbp), %xmm12
	leaq	1(%r8,%rsi), %r10
	vpaddd	%xmm8, %xmm10, %xmm0
	leaq	1(%r8,%rcx), %r8
	vpxor	%xmm3, %xmm3, %xmm3
	vmovddup	beta_coef(%rip), %xmm5
	vpsrldq	$8, %xmm0, %xmm4
	vpmovsxdq	%xmm0, %xmm1
	leaq	(%r15,%r8,8), %r9
	vmovddup	alfa(%rip), %xmm14
	vpmovsxdq	%xmm4, %xmm7
	vpaddq	%xmm12, %xmm1, %xmm2
	leaq	(%r15,%rdx), %r11
	movq	-104(%rbp), %r8
	vpand	.LC9(%rip), %xmm2, %xmm13
	vpaddq	%xmm12, %xmm7, %xmm6
	vpand	.LC9(%rip), %xmm6, %xmm12
	leaq	8(%r15,%rdx), %rdi
	leaq	(%r15,%r10,8), %r10
	addq	%rdx, %r8
	vpcmpeqq	%xmm3, %xmm13, %xmm1
	vpcmpeqq	%xmm3, %xmm12, %xmm0
	vmaskmovpd	(%r11), %xmm1, %xmm9
	vmaskmovpd	16(%r11), %xmm0, %xmm8
	vmaskmovpd	(%r10), %xmm1, %xmm11
	vmaskmovpd	(%r9), %xmm1, %xmm13
	vmaskmovpd	(%rdi), %xmm1, %xmm7
	vaddpd	%xmm13, %xmm11, %xmm3
	vmaskmovpd	16(%r10), %xmm0, %xmm10
	vmaskmovpd	16(%r9), %xmm0, %xmm2
	vaddpd	%xmm2, %xmm10, %xmm12
	vmaskmovpd	16(%rdi), %xmm0, %xmm4
	vmaskmovpd	-8(%r15,%rdx), %xmm1, %xmm6
	vmaskmovpd	(%rdi), %xmm0, %xmm11
	vaddpd	%xmm6, %xmm7, %xmm13
	vaddpd	%xmm11, %xmm4, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm13
	vptest	%xmm1, %xmm1
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm3
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm12
	vmulpd	%xmm5, %xmm10, %xmm2
	vmulpd	%xmm5, %xmm13, %xmm5
	vfmadd132pd	%xmm14, %xmm2, %xmm12
	vfmadd132pd	%xmm14, %xmm5, %xmm3
	vaddpd	%xmm3, %xmm9, %xmm14
	vaddpd	%xmm12, %xmm8, %xmm9
	jne	.L267
.L86:
	vptest	%xmm0, %xmm0
	jne	.L268
.L87:
	movq	-136(%rbp), %r11
	movl	-80(%rbp), %edx
	movq	-144(%rbp), %r8
	movq	%r11, %r10
	andq	$-4, %r10
	addl	%r10d, %edx
	addq	%r10, %r8
	cmpq	%r10, %r11
	je	.L95
.L85:
	movq	-96(%rbp), %rdi
	leal	0(%r13,%rdx), %r9d
	addq	%rdi, %r9
	andl	$1, %r9d
	jne	.L89
	leaq	(%r14,%r8), %r10
	leaq	(%rcx,%r8), %r11
	addq	%rsi, %r8
	vmovsd	.LC3(%rip), %xmm12
	vmovsd	(%r15,%r11,8), %xmm1
	vmovsd	-8(%r15,%r10,8), %xmm3
	vaddsd	(%r15,%r8,8), %xmm1, %xmm0
	vaddsd	8(%r15,%r10,8), %xmm3, %xmm7
	vmovsd	(%r15,%r10,8), %xmm8
	movq	-104(%rbp), %r8
	vfnmadd231sd	%xmm12, %xmm8, %xmm0
	vfnmadd132sd	%xmm8, %xmm7, %xmm12
	vmulsd	beta_coef(%rip), %xmm12, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm6
	vmovsd	%xmm6, (%r8,%r10,8)
.L89:
	leal	1(%rdx), %r9d
	movslq	%r9d, %rdi
	cmpq	-112(%rbp), %rdi
	jge	.L95
	movq	-96(%rbp), %r10
	addl	%r13d, %r9d
	addq	%r10, %r9
	andl	$1, %r9d
	jne	.L90
	leaq	(%rdi,%r14), %r11
	leaq	(%rdi,%rcx), %r8
	addq	%rsi, %rdi
	movq	-104(%rbp), %r9
	vmovsd	(%r15,%r8,8), %xmm10
	vmovsd	-8(%r15,%r11,8), %xmm5
	vaddsd	(%r15,%rdi,8), %xmm10, %xmm13
	vaddsd	8(%r15,%r11,8), %xmm5, %xmm14
	vmovsd	(%r15,%r11,8), %xmm11
	vmovsd	.LC3(%rip), %xmm2
	vfnmadd231sd	%xmm2, %xmm11, %xmm13
	vfnmadd132sd	%xmm11, %xmm14, %xmm2
	vmulsd	beta_coef(%rip), %xmm2, %xmm9
	vfmadd132sd	alfa(%rip), %xmm9, %xmm13
	vaddsd	%xmm11, %xmm13, %xmm8
	vmovsd	%xmm8, (%r9,%r11,8)
.L90:
	addl	$2, %edx
	movslq	%edx, %rdi
	cmpq	%rdi, -112(%rbp)
	jle	.L95
	addl	%r13d, %edx
	movq	-96(%rbp), %r13
	addq	%r13, %rdx
	andl	$1, %edx
	jne	.L95
	leaq	(%rdi,%r14), %rdx
	addq	%rdi, %rsi
	addq	%rcx, %rdi
	vmovsd	.LC3(%rip), %xmm7
	vmovsd	(%r15,%rsi,8), %xmm1
	vmovsd	8(%r15,%rdx,8), %xmm3
	vaddsd	(%r15,%rdi,8), %xmm1, %xmm0
	vaddsd	-8(%r15,%rdx,8), %xmm3, %xmm4
	vmovsd	(%r15,%rdx,8), %xmm12
	movq	-104(%rbp), %rsi
	vfnmadd231sd	%xmm7, %xmm12, %xmm0
	vfnmadd132sd	%xmm12, %xmm4, %xmm7
	vmulsd	beta_coef(%rip), %xmm7, %xmm6
	vfmadd132sd	alfa(%rip), %xmm6, %xmm0
	vaddsd	%xmm0, %xmm12, %xmm11
	vmovsd	%xmm11, (%rsi,%rdx,8)
.L95:
	movq	-176(%rbp), %rcx
	movl	-128(%rbp), %r13d
	incq	%rbx
	addq	%rcx, -120(%rbp)
	addq	-152(%rbp), %r14
	addq	%rcx, %r12
	addq	%rcx, %rax
	cmpl	%r13d, -124(%rbp)
	jge	.L10
	movq	-104(%rbp), %r14
.L8:
	movq	-160(%rbp), %r12
	movq	-248(%rbp), %rax
	movq	-256(%rbp), %r10
	movl	$0, lock(,%r12,4)
	movl	lock(,%rax,4), %ebx
	movl	lock(,%r10,4), %esi
	.p2align 4,,10
	.p2align 3
.L13:
	cmpl	$1, %ebx
	jne	.L11
.L12:
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L79:
	movq	-112(%rbp), %r11
	leaq	-16(%r15,%r8), %rcx
	movq	%rax, %r8
	leaq	-16(%r15,%rdi), %r10
	movl	$1, %r13d
	decq	%r11
	andl	$3, %r11d
	je	.L94
	cmpq	$1, %r11
	je	.L207
	cmpq	$2, %r11
	je	.L208
	testb	$1, %bl
	je	.L186
	vmovsd	8(%rax), %xmm10
	vmovsd	(%rax), %xmm5
	vaddsd	16(%rax), %xmm5, %xmm14
	vmovsd	8(%r10), %xmm13
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm14
	vaddsd	8(%rcx), %xmm13, %xmm2
	vmulsd	beta_coef(%rip), %xmm14, %xmm9
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm2
	vfmadd132sd	alfa(%rip), %xmm9, %xmm2
	vaddsd	%xmm10, %xmm2, %xmm8
	vmovsd	%xmm8, (%r12)
.L186:
	movl	$2, %r13d
	leaq	8(%rax), %r8
.L208:
	leaq	(%rbx,%r13), %r9
	andl	$1, %r9d
	jne	.L189
	vmovsd	8(%r8), %xmm12
	vmovsd	(%r8), %xmm7
	vaddsd	16(%r8), %xmm7, %xmm3
	vmovsd	(%r10,%r13,8), %xmm1
	vfnmadd231sd	.LC3(%rip), %xmm12, %xmm3
	vaddsd	(%rcx,%r13,8), %xmm1, %xmm0
	vmulsd	beta_coef(%rip), %xmm3, %xmm4
	vfnmadd231sd	.LC3(%rip), %xmm12, %xmm0
	vfmadd132sd	alfa(%rip), %xmm4, %xmm0
	vaddsd	%xmm12, %xmm0, %xmm6
	vmovsd	%xmm6, -8(%r12,%r13,8)
.L189:
	incq	%r13
	addq	$8, %r8
.L207:
	leaq	(%rbx,%r13), %rdi
	andl	$1, %edi
	jne	.L192
	vmovsd	8(%r8), %xmm11
	vmovsd	(%r8), %xmm2
	vaddsd	16(%r8), %xmm2, %xmm5
	vmovsd	(%r10,%r13,8), %xmm10
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm5
	vaddsd	(%rcx,%r13,8), %xmm10, %xmm13
	vmulsd	beta_coef(%rip), %xmm5, %xmm14
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm13
	vfmadd132sd	alfa(%rip), %xmm14, %xmm13
	vaddsd	%xmm11, %xmm13, %xmm9
	vmovsd	%xmm9, -8(%r12,%r13,8)
.L192:
	incq	%r13
	addq	$8, %r8
	cmpq	-112(%rbp), %r13
	je	.L95
.L94:
	leaq	(%rbx,%r13), %rdx
	andl	$1, %edx
	jne	.L93
	vmovsd	8(%r8), %xmm8
	vmovsd	(%r8), %xmm1
	vaddsd	16(%r8), %xmm1, %xmm7
	vmovsd	(%r10,%r13,8), %xmm12
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm7
	vaddsd	(%rcx,%r13,8), %xmm12, %xmm0
	vmulsd	beta_coef(%rip), %xmm7, %xmm3
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm0
	vfmadd132sd	alfa(%rip), %xmm3, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm4
	vmovsd	%xmm4, -8(%r12,%r13,8)
.L93:
	incq	%r13
	leaq	8(%r8), %rsi
	leaq	(%rbx,%r13), %r11
	andl	$1, %r11d
	jne	.L195
	vmovsd	8(%rsi), %xmm6
	vmovsd	8(%r8), %xmm13
	vaddsd	16(%rsi), %xmm13, %xmm2
	vmovsd	(%r10,%r13,8), %xmm11
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm2
	vaddsd	(%rcx,%r13,8), %xmm11, %xmm10
	vmulsd	beta_coef(%rip), %xmm2, %xmm5
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm10
	vfmadd132sd	alfa(%rip), %xmm5, %xmm10
	vaddsd	%xmm6, %xmm10, %xmm14
	vmovsd	%xmm14, -8(%r12,%r13,8)
.L195:
	leaq	1(%r13), %r8
	leaq	(%rbx,%r8), %r9
	andl	$1, %r9d
	jne	.L197
	vmovsd	16(%rsi), %xmm9
	vmovsd	8(%rsi), %xmm0
	vaddsd	24(%rsi), %xmm0, %xmm1
	vmovsd	(%r10,%r8,8), %xmm8
	vfnmadd231sd	.LC3(%rip), %xmm9, %xmm1
	vaddsd	(%rcx,%r8,8), %xmm8, %xmm12
	vmulsd	beta_coef(%rip), %xmm1, %xmm7
	vfnmadd231sd	.LC3(%rip), %xmm9, %xmm12
	vfmadd132sd	alfa(%rip), %xmm7, %xmm12
	vaddsd	%xmm9, %xmm12, %xmm3
	vmovsd	%xmm3, -8(%r12,%r8,8)
.L197:
	leaq	2(%r13), %rdi
	leaq	(%rbx,%rdi), %rdx
	andl	$1, %edx
	jne	.L199
	vmovsd	24(%rsi), %xmm4
	vmovsd	16(%rsi), %xmm10
	vaddsd	32(%rsi), %xmm10, %xmm13
	vmovsd	(%r10,%rdi,8), %xmm6
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm13
	vaddsd	(%rcx,%rdi,8), %xmm6, %xmm11
	vmulsd	beta_coef(%rip), %xmm13, %xmm2
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm11
	vfmadd132sd	alfa(%rip), %xmm2, %xmm11
	vaddsd	%xmm4, %xmm11, %xmm5
	vmovsd	%xmm5, -8(%r12,%rdi,8)
.L199:
	addq	$3, %r13
	leaq	24(%rsi), %r8
	cmpq	-112(%rbp), %r13
	jne	.L94
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	$1, %esi
	je	.L13
	movl	-212(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L269
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L77
	movq	NP(%rip), %rdi
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%rdi), %esi
	leaq	8(%r14,%rdi,8), %rdi
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	movq	-288(%rbp), %r8
	movl	NP(%rip), %edx
	movl	vizNorte(%rip), %ecx
	movl	$1140850688, %r9d
	movq	%r14, %rdi
	pushq	(%r8)
	xorl	%r8d, %r8d
	leal	1(%rdx), %esi
	movl	$1275070475, %edx
	call	MPI_Recv
	vmovapd	.LC7(%rip), %ymm15
	popq	%rax
	popq	%rdx
.L77:
	movl	-236(%rbp), %r13d
	testl	%r13d, %r13d
	je	.L78
.L76:
	movq	-160(%rbp), %r10
	movq	m(%rip), %r8
	movl	-216(%rbp), %edi
	movl	-124(%rbp), %r12d
	movl	$1, lock(,%r10,4)
	movq	%r8, -104(%rbp)
	cmpl	%r12d, %edi
	jg	.L16
	movq	NP(%rip), %rsi
	movq	N(%rip), %rax
	leaq	1(%rsi), %r13
	cmpq	$2, %rax
	jle	.L16
	movq	-264(%rbp), %r10
	leaq	0(,%r13,8), %rdx
	leaq	-1(%rax,%r8), %r9
	negq	%r8
	leaq	-8(%rdx), %r11
	movq	%r13, %rbx
	leal	1(%r12), %r12d
	movq	%r15, -112(%rbp)
	imulq	%r10, %rdx
	movq	-280(%rbp), %rcx
	movl	%r12d, -88(%rbp)
	addq	%r10, %r9
	imulq	%r10, %rbx
	vmovsd	.LC3(%rip), %xmm2
	vmovsd	.LC4(%rip), %xmm1
	movq	%r11, -96(%rbp)
	leaq	(%rcx,%r8,8), %r8
	movq	%r14, -80(%rbp)
	addq	%rdx, %r8
	movl	%edi, %edx
	movl	$2, %edi
	subq	%rax, %rdi
	leaq	(%r15,%r8), %r11
	movq	%rdi, %r14
	.p2align 4,,10
	.p2align 3
.L18:
	leal	1(%rdx), %r15d
	decl	%edx
	movq	-80(%rbp), %rsi
	movq	%r14, %r10
	movslq	%r15d, %r12
	movslq	%edx, %rdx
	leaq	(%r14,%r9), %rdi
	negq	%r10
	imulq	%r13, %r12
	leaq	(%rsi,%rbx,8), %rsi
	imulq	%r13, %rdx
	subq	%rbx, %r12
	subq	%rbx, %rdx
	andl	$3, %r10d
	je	.L74
	cmpq	$1, %r10
	je	.L205
	cmpq	$2, %r10
	je	.L206
	movq	%rdi, %r8
	shrq	$63, %r8
	leaq	(%rdi,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L171
	vmovsd	(%rsi), %xmm0
	vaddsd	16(%rsi), %xmm0, %xmm7
	vmovsd	beta_coef(%rip), %xmm9
	vmovsd	alfa(%rip), %xmm14
	vmovsd	8(%rsi,%rdx,8), %xmm8
	vaddsd	8(%rsi,%r12,8), %xmm8, %xmm12
	vmulsd	%xmm9, %xmm7, %xmm3
	vaddsd	%xmm14, %xmm9, %xmm6
	vfmadd132sd	%xmm2, %xmm1, %xmm6
	vfmadd132sd	%xmm14, %xmm3, %xmm12
	vaddsd	(%r11,%rdi,8), %xmm12, %xmm4
	vdivsd	%xmm6, %xmm4, %xmm11
	vmovsd	%xmm11, 8(%rsi)
.L171:
	incq	%rdi
	addq	$8, %rsi
.L206:
	movq	%rdi, %rax
	shrq	$63, %rax
	leaq	(%rdi,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L174
	vmovsd	(%rsi), %xmm9
	vaddsd	16(%rsi), %xmm9, %xmm8
	vmovsd	beta_coef(%rip), %xmm13
	vmovsd	alfa(%rip), %xmm10
	vmovsd	8(%rsi,%rdx,8), %xmm5
	vaddsd	8(%rsi,%r12,8), %xmm5, %xmm14
	vmulsd	%xmm13, %xmm8, %xmm12
	vaddsd	%xmm10, %xmm13, %xmm7
	vfmadd132sd	%xmm2, %xmm1, %xmm7
	vfmadd132sd	%xmm10, %xmm12, %xmm14
	vaddsd	(%r11,%rdi,8), %xmm14, %xmm0
	vdivsd	%xmm7, %xmm0, %xmm3
	vmovsd	%xmm3, 8(%rsi)
.L174:
	incq	%rdi
	addq	$8, %rsi
.L205:
	movq	%rdi, %r8
	shrq	$63, %r8
	leaq	(%rdi,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L177
	vmovsd	(%rsi), %xmm13
	vaddsd	16(%rsi), %xmm13, %xmm5
	vmovsd	beta_coef(%rip), %xmm11
	vmovsd	alfa(%rip), %xmm6
	vmovsd	8(%rsi,%rdx,8), %xmm4
	vaddsd	8(%rsi,%r12,8), %xmm4, %xmm10
	vmulsd	%xmm11, %xmm5, %xmm14
	vaddsd	%xmm6, %xmm11, %xmm8
	vfmadd132sd	%xmm2, %xmm1, %xmm8
	vfmadd132sd	%xmm6, %xmm14, %xmm10
	vaddsd	(%r11,%rdi,8), %xmm10, %xmm9
	vdivsd	%xmm8, %xmm9, %xmm12
	vmovsd	%xmm12, 8(%rsi)
.L177:
	incq	%rdi
	addq	$8, %rsi
	cmpq	%r9, %rdi
	je	.L251
.L74:
	movq	%rdi, %rax
	shrq	$63, %rax
	leaq	(%rdi,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L73
	vmovsd	(%rsi), %xmm11
	vaddsd	16(%rsi), %xmm11, %xmm4
	vmovsd	beta_coef(%rip), %xmm3
	vmovsd	alfa(%rip), %xmm7
	vmovsd	8(%rsi,%rdx,8), %xmm0
	vaddsd	8(%rsi,%r12,8), %xmm0, %xmm6
	vmulsd	%xmm3, %xmm4, %xmm10
	vaddsd	%xmm7, %xmm3, %xmm5
	vfmadd132sd	%xmm2, %xmm1, %xmm5
	vfmadd132sd	%xmm7, %xmm10, %xmm6
	vaddsd	(%r11,%rdi,8), %xmm6, %xmm13
	vdivsd	%xmm5, %xmm13, %xmm14
	vmovsd	%xmm14, 8(%rsi)
.L73:
	incq	%rdi
	leaq	8(%rsi), %rcx
	movq	%rdi, %rax
	shrq	$63, %rax
	leaq	(%rdi,%rax), %r8
	andl	$1, %r8d
	subq	%rax, %r8
	cmpq	$1, %r8
	jne	.L180
	vmovsd	8(%rsi), %xmm3
	vaddsd	16(%rcx), %xmm3, %xmm0
	vmovsd	beta_coef(%rip), %xmm8
	vmovsd	alfa(%rip), %xmm9
	vmovsd	8(%rcx,%rdx,8), %xmm12
	vaddsd	8(%rcx,%r12,8), %xmm12, %xmm7
	vmulsd	%xmm8, %xmm0, %xmm6
	vaddsd	%xmm9, %xmm8, %xmm4
	vfmadd132sd	%xmm2, %xmm1, %xmm4
	vfmadd132sd	%xmm9, %xmm6, %xmm7
	vaddsd	(%r11,%rdi,8), %xmm7, %xmm11
	vdivsd	%xmm4, %xmm11, %xmm10
	vmovsd	%xmm10, 8(%rcx)
.L180:
	leaq	1(%rdi), %rax
	movq	%rax, %r10
	shrq	$63, %r10
	leaq	(%rax,%r10), %rsi
	andl	$1, %esi
	subq	%r10, %rsi
	cmpq	$1, %rsi
	jne	.L182
	vmovsd	8(%rcx), %xmm8
	vaddsd	24(%rcx), %xmm8, %xmm12
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm13
	vmovsd	16(%rcx,%rdx,8), %xmm14
	vaddsd	16(%rcx,%r12,8), %xmm14, %xmm9
	vmulsd	%xmm5, %xmm12, %xmm7
	vaddsd	%xmm13, %xmm5, %xmm3
	vfmadd132sd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	%xmm13, %xmm7, %xmm9
	vaddsd	(%r11,%rax,8), %xmm9, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm6
	vmovsd	%xmm6, 16(%rcx)
.L182:
	leaq	2(%rdi), %r8
	movq	%r8, %rax
	shrq	$63, %rax
	leaq	(%r8,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L184
	vmovsd	16(%rcx), %xmm5
	vaddsd	32(%rcx), %xmm5, %xmm14
	vmovsd	beta_coef(%rip), %xmm10
	vmovsd	alfa(%rip), %xmm11
	vmovsd	24(%rcx,%rdx,8), %xmm4
	vaddsd	24(%rcx,%r12,8), %xmm4, %xmm13
	vmulsd	%xmm10, %xmm14, %xmm9
	vaddsd	%xmm11, %xmm10, %xmm12
	vfmadd132sd	%xmm2, %xmm1, %xmm12
	vfmadd132sd	%xmm11, %xmm9, %xmm13
	vaddsd	(%r11,%r8,8), %xmm13, %xmm8
	vdivsd	%xmm12, %xmm8, %xmm7
	vmovsd	%xmm7, 24(%rcx)
.L184:
	addq	$3, %rdi
	leaq	24(%rcx), %rsi
	cmpq	%r9, %rdi
	jne	.L74
.L251:
	movl	%r15d, %edx
	incq	%r9
	addq	%r13, %rbx
	addq	-96(%rbp), %r11
	cmpl	%r15d, -88(%rbp)
	jne	.L18
	movq	-80(%rbp), %r14
	movq	-112(%rbp), %r15
.L16:
	movq	-160(%rbp), %r12
	movq	-248(%rbp), %rdi
	movq	-256(%rbp), %r8
	movl	$0, lock(,%r12,4)
	movl	lock(,%rdi,4), %ecx
	movl	lock(,%r8,4), %eax
	.p2align 4,,10
	.p2align 3
.L21:
	cmpl	$1, %ecx
	jne	.L19
.L20:
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L19:
	cmpl	$1, %eax
	je	.L21
	movq	-104(%rbp), %r10
	movl	-212(%rbp), %esi
	incq	%r10
	movq	%r10, m(%rip)
	testl	%esi, %esi
	jne	.L270
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L71
	movq	NP(%rip), %r9
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r9), %esi
	leaq	8(%r14,%r9,8), %rdi
	movl	$1140850688, %r9d
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	movq	-288(%rbp), %r13
	movl	NP(%rip), %r11d
	movl	vizNorte(%rip), %ecx
	xorl	%r8d, %r8d
	movq	%r14, %rdi
	pushq	0(%r13)
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%r11), %esi
	call	MPI_Recv
	vmovapd	.LC7(%rip), %ymm15
	popq	%r8
	popq	%r9
.L71:
	movl	-236(%rbp), %edx
	testl	%edx, %edx
	je	.L72
.L70:
	movq	-160(%rbp), %rax
	movl	-216(%rbp), %r13d
	movl	-124(%rbp), %r10d
	movl	$1, lock(,%rax,4)
	cmpl	%r10d, %r13d
	jg	.L24
	movq	N(%rip), %r9
	movq	NP(%rip), %rbx
	movq	m(%rip), %rdx
	leaq	-1(%r9), %r11
	incq	%rbx
	movq	%r11, -112(%rbp)
	movq	%rdx, -96(%rbp)
	movq	%rbx, -152(%rbp)
	cmpq	$1, %r11
	jle	.L24
	movq	-264(%rbp), %rsi
	leaq	-2(%r9), %r10
	leaq	-3(%r9), %r8
	movq	%r15, -104(%rbp)
	leaq	0(,%rbx,8), %rdi
	movq	%r10, -184(%rbp)
	imulq	%rsi, %rbx
	movq	%rdi, %rax
	movq	%rdi, -176(%rbp)
	addq	%rsi, %rdx
	imulq	%rsi, %rax
	movq	%r8, -168(%rbp)
	addq	%rbx, %r11
	leaq	8(%r15,%rbx,8), %r12
	leaq	(%r15,%r11,8), %rcx
	movq	%r10, %r11
	andq	$-8, %r10
	addq	%r14, %rax
	subq	%r10, %r9
	movl	%r10d, %edi
	shrq	$3, %r11
	leaq	1(%r10), %rsi
	movq	%r9, -200(%rbp)
	incl	%edi
	leaq	-2(%r9), %r9
	movq	%rdx, %r15
	movq	%rcx, -120(%rbp)
	movq	%r11, -88(%rbp)
	movq	%r10, -192(%rbp)
	movl	%edi, -232(%rbp)
	movq	%rsi, -224(%rbp)
	movq	%r9, -208(%rbp)
	.p2align 4,,10
	.p2align 3
.L26:
	movq	-104(%rbp), %r10
	movq	-152(%rbp), %r8
	leal	1(%r13), %edx
	leal	-1(%r13), %ecx
	movslq	%edx, %rsi
	movq	-168(%rbp), %r11
	movslq	%ecx, %rcx
	movl	%edx, -128(%rbp)
	subq	%r14, %r10
	imulq	%r8, %rcx
	imulq	%r8, %rsi
	cmpq	$64, %r10
	seta	%dl
	cmpq	$2, %r11
	seta	%r9b
	leaq	16(,%rcx,8), %rdi
	andl	%r9d, %edx
	cmpq	$alfa, -120(%rbp)
	leaq	16(,%rsi,8), %r8
	setbe	%r9b
	cmpq	$alfa+8, %r12
	setnb	%r10b
	orl	%r10d, %r9d
	andl	%edx, %r9d
	cmpq	$beta_coef, -120(%rbp)
	setbe	%dl
	cmpq	$beta_coef+8, %r12
	setnb	%r10b
	orl	%r10d, %edx
	leaq	(%r14,%rdi), %r10
	andl	%r9d, %edx
	movq	%r12, %r9
	subq	%r10, %r9
	cmpq	$48, %r9
	seta	%r10b
	testb	%r10b, %dl
	je	.L52
	leaq	(%r14,%r8), %r9
	movq	%r12, %rdx
	subq	%r9, %rdx
	cmpq	$48, %rdx
	jbe	.L52
	cmpq	$6, %r11
	jbe	.L53
	vmovd	%r13d, %xmm0
	leaq	-8(%r14,%r8), %r10
	leaq	-8(%r14,%rdi), %r9
	xorl	%edx, %edx
	vpbroadcastd	%xmm0, %ymm3
	leaq	8(%rax), %r11
	leaq	16(%rax), %r8
	xorl	%edi, %edi
	vpbroadcastq	-96(%rbp), %ymm12
	vmovdqa	.LC0(%rip), %ymm8
	vpxor	%xmm9, %xmm9, %xmm9
	vmovdqa	%ymm3, -80(%rbp)
	vbroadcastsd	alfa(%rip), %ymm11
	vbroadcastsd	beta_coef(%rip), %ymm10
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L54:
	vptest	%ymm0, %ymm0
	jne	.L271
.L55:
	incq	%rdi
	addq	$64, %rdx
	cmpq	-88(%rbp), %rdi
	je	.L272
.L56:
	vmovdqa	%ymm8, %ymm6
	vpaddd	-80(%rbp), %ymm6, %ymm4
	vpaddd	.LC5(%rip), %ymm8, %ymm8
	vextracti128	$0x1, %ymm4, %xmm7
	vpmovsxdq	%xmm4, %ymm13
	vpmovsxdq	%xmm7, %ymm2
	vpaddq	%ymm12, %ymm13, %ymm5
	vpand	.LC6(%rip), %ymm5, %ymm14
	vpaddq	%ymm12, %ymm2, %ymm0
	vpand	.LC6(%rip), %ymm0, %ymm3
	vpcmpeqq	%ymm9, %ymm14, %ymm1
	vmaskmovpd	(%r10,%rdx), %ymm1, %ymm4
	vmaskmovpd	(%r9,%rdx), %ymm1, %ymm5
	vmaskmovpd	(%r11,%rdx), %ymm1, %ymm7
	vpcmpeqq	%ymm9, %ymm3, %ymm0
	vaddpd	%ymm4, %ymm5, %ymm3
	vmaskmovpd	32(%r10,%rdx), %ymm0, %ymm13
	vmaskmovpd	32(%r9,%rdx), %ymm0, %ymm14
	vmaskmovpd	(%rax,%rdx), %ymm1, %ymm5
	vaddpd	%ymm13, %ymm14, %ymm2
	vmaskmovpd	32(%r8,%rdx), %ymm0, %ymm4
	vmaskmovpd	32(%rax,%rdx), %ymm0, %ymm14
	vmaskmovpd	(%r8,%rdx), %ymm1, %ymm13
	vaddpd	%ymm4, %ymm14, %ymm4
	vaddpd	%ymm13, %ymm5, %ymm13
	vmaskmovpd	32(%r11,%rdx), %ymm0, %ymm6
	vfnmadd231pd	%ymm15, %ymm7, %ymm3
	vptest	%ymm1, %ymm1
	vfnmadd231pd	%ymm15, %ymm6, %ymm2
	vfnmadd231pd	%ymm15, %ymm7, %ymm13
	vfnmadd231pd	%ymm15, %ymm6, %ymm4
	vmulpd	%ymm13, %ymm10, %ymm5
	vmulpd	%ymm4, %ymm10, %ymm14
	vfmadd132pd	%ymm11, %ymm5, %ymm3
	vfmadd132pd	%ymm11, %ymm14, %ymm2
	vaddpd	%ymm7, %ymm3, %ymm7
	vaddpd	%ymm6, %ymm2, %ymm6
	je	.L54
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%r12,%rdx)
	je	.L55
	.p2align 4,,10
	.p2align 3
.L271:
	vmaskmovpd	%ymm6, %ymm0, 32(%r12,%rdx)
	incq	%rdi
	addq	$64, %rdx
	cmpq	-88(%rbp), %rdi
	jne	.L56
	.p2align 4,,10
	.p2align 3
.L272:
	movq	-192(%rbp), %r8
	movq	-184(%rbp), %r11
	cmpq	%r11, %r8
	je	.L68
	movq	-200(%rbp), %r9
	movq	-208(%rbp), %r10
	subq	$3, %r9
	movq	%r10, -136(%rbp)
	cmpq	$2, %r9
	jbe	.L100
	movl	-232(%rbp), %edi
	movq	-224(%rbp), %r11
	movl	%edi, -80(%rbp)
	movq	%r11, -144(%rbp)
.L98:
	vbroadcastss	-80(%rbp), %xmm11
	vmovd	%r13d, %xmm9
	leaq	1(%r8,%rbx), %rdx
	vpaddd	.LC8(%rip), %xmm11, %xmm10
	vpshufd	$0, %xmm9, %xmm8
	salq	$3, %rdx
	vmovddup	-96(%rbp), %xmm12
	leaq	1(%r8,%rsi), %r10
	vpaddd	%xmm8, %xmm10, %xmm0
	leaq	1(%r8,%rcx), %r9
	vpxor	%xmm3, %xmm3, %xmm3
	movq	-104(%rbp), %r8
	vpsrldq	$8, %xmm0, %xmm5
	vpmovsxdq	%xmm0, %xmm1
	leaq	8(%r14,%rdx), %rdi
	vmovddup	beta_coef(%rip), %xmm13
	vpmovsxdq	%xmm5, %xmm7
	vpaddq	%xmm12, %xmm1, %xmm2
	leaq	(%r14,%rdx), %r11
	addq	%rdx, %r8
	vpand	.LC9(%rip), %xmm2, %xmm14
	vpaddq	%xmm12, %xmm7, %xmm6
	leaq	(%r14,%r10,8), %r10
	vmovddup	alfa(%rip), %xmm4
	vpand	.LC9(%rip), %xmm6, %xmm12
	leaq	(%r14,%r9,8), %r9
	vpcmpeqq	%xmm3, %xmm14, %xmm1
	vmaskmovpd	(%r11), %xmm1, %xmm9
	vmaskmovpd	(%r10), %xmm1, %xmm11
	vmaskmovpd	(%r9), %xmm1, %xmm2
	vpcmpeqq	%xmm3, %xmm12, %xmm0
	vmaskmovpd	(%rdi), %xmm1, %xmm5
	vaddpd	%xmm11, %xmm2, %xmm12
	vmaskmovpd	16(%r11), %xmm0, %xmm8
	vmaskmovpd	16(%r10), %xmm0, %xmm10
	vmaskmovpd	16(%r9), %xmm0, %xmm14
	vaddpd	%xmm10, %xmm14, %xmm7
	vmaskmovpd	16(%rdi), %xmm0, %xmm11
	vmaskmovpd	-8(%r14,%rdx), %xmm1, %xmm6
	vmaskmovpd	(%rdi), %xmm0, %xmm3
	vaddpd	%xmm5, %xmm6, %xmm2
	vaddpd	%xmm11, %xmm3, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm2
	vptest	%xmm1, %xmm1
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm12
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm7
	vmulpd	%xmm10, %xmm13, %xmm14
	vmulpd	%xmm13, %xmm2, %xmm13
	vfmadd132pd	%xmm4, %xmm13, %xmm12
	vfmadd132pd	%xmm7, %xmm14, %xmm4
	vaddpd	%xmm9, %xmm12, %xmm9
	vaddpd	%xmm8, %xmm4, %xmm4
	jne	.L273
.L59:
	vptest	%xmm0, %xmm0
	jne	.L274
.L60:
	movq	-136(%rbp), %r11
	movl	-80(%rbp), %edx
	movq	-144(%rbp), %r8
	movq	%r11, %r10
	andq	$-4, %r10
	addl	%r10d, %edx
	addq	%r10, %r8
	cmpq	%r11, %r10
	je	.L68
.L58:
	movq	-96(%rbp), %rdi
	leal	(%rdx,%r13), %r9d
	addq	%rdi, %r9
	andl	$1, %r9d
	jne	.L62
	leaq	(%r8,%rbx), %r10
	leaq	(%r8,%rcx), %r11
	addq	%rsi, %r8
	vmovsd	.LC3(%rip), %xmm7
	vmovsd	(%r14,%r11,8), %xmm1
	vmovsd	-8(%r14,%r10,8), %xmm12
	vaddsd	(%r14,%r8,8), %xmm1, %xmm0
	vaddsd	8(%r14,%r10,8), %xmm12, %xmm5
	vmovsd	(%r14,%r10,8), %xmm8
	movq	-104(%rbp), %r8
	vfnmadd231sd	%xmm7, %xmm8, %xmm0
	vfnmadd132sd	%xmm8, %xmm5, %xmm7
	vmulsd	beta_coef(%rip), %xmm7, %xmm11
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm6
	vmovsd	%xmm6, (%r8,%r10,8)
.L62:
	leal	1(%rdx), %r9d
	movslq	%r9d, %rdi
	cmpq	%rdi, -112(%rbp)
	jle	.L68
	movq	-96(%rbp), %r10
	addl	%r13d, %r9d
	addq	%r10, %r9
	andl	$1, %r9d
	jne	.L63
	leaq	(%rbx,%rdi), %r11
	leaq	(%rsi,%rdi), %r8
	addq	%rcx, %rdi
	movq	-104(%rbp), %r9
	vmovsd	(%r14,%r8,8), %xmm3
	vmovsd	8(%r14,%r11,8), %xmm13
	vaddsd	(%r14,%rdi,8), %xmm3, %xmm2
	vaddsd	-8(%r14,%r11,8), %xmm13, %xmm9
	vmovsd	(%r14,%r11,8), %xmm10
	vmovsd	.LC3(%rip), %xmm14
	vfnmadd231sd	%xmm14, %xmm10, %xmm2
	vfnmadd132sd	%xmm10, %xmm9, %xmm14
	vmulsd	beta_coef(%rip), %xmm14, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm2
	vaddsd	%xmm2, %xmm10, %xmm8
	vmovsd	%xmm8, (%r9,%r11,8)
.L63:
	addl	$2, %edx
	movslq	%edx, %rdi
	cmpq	%rdi, -112(%rbp)
	jle	.L68
	addl	%r13d, %edx
	movq	-96(%rbp), %r13
	addq	%r13, %rdx
	andl	$1, %edx
	jne	.L68
	leaq	(%rbx,%rdi), %rdx
	addq	%rdi, %rcx
	addq	%rsi, %rdi
	vmovsd	.LC3(%rip), %xmm12
	vmovsd	(%r14,%rcx,8), %xmm1
	vmovsd	-8(%r14,%rdx,8), %xmm5
	vaddsd	(%r14,%rdi,8), %xmm1, %xmm0
	vaddsd	8(%r14,%rdx,8), %xmm5, %xmm11
	vmovsd	(%r14,%rdx,8), %xmm7
	movq	-104(%rbp), %rsi
	vfnmadd231sd	%xmm12, %xmm7, %xmm0
	vfnmadd132sd	%xmm7, %xmm11, %xmm12
	vmulsd	beta_coef(%rip), %xmm12, %xmm6
	vfmadd132sd	alfa(%rip), %xmm6, %xmm0
	vaddsd	%xmm7, %xmm0, %xmm10
	vmovsd	%xmm10, (%rsi,%rdx,8)
.L68:
	movq	-176(%rbp), %r10
	movl	-128(%rbp), %r13d
	incq	%r15
	addq	%r10, -120(%rbp)
	addq	-152(%rbp), %rbx
	addq	%r10, %r12
	addq	%r10, %rax
	cmpl	%r13d, -124(%rbp)
	jge	.L26
	movq	-104(%rbp), %r15
.L24:
	movq	-160(%rbp), %rbx
	movq	-248(%rbp), %r12
	movq	-256(%rbp), %rax
	movl	$0, lock(,%rbx,4)
	movl	lock(,%r12,4), %ecx
	movl	lock(,%rax,4), %esi
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	$1, %ecx
	jne	.L27
.L28:
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L52:
	movq	-112(%rbp), %r11
	movl	$1, %r13d
	leaq	-16(%r14,%r8), %r10
	leaq	-16(%r14,%rdi), %rcx
	movq	%rax, %r8
	subq	%r13, %r11
	andl	$3, %r11d
	je	.L67
	cmpq	$1, %r11
	je	.L203
	cmpq	$2, %r11
	je	.L204
	testb	$1, %r15b
	je	.L156
	vmovsd	8(%rax), %xmm3
	vmovsd	(%rax), %xmm13
	vaddsd	16(%rax), %xmm13, %xmm9
	vmovsd	8(%rcx), %xmm2
	vfnmadd231sd	.LC3(%rip), %xmm3, %xmm9
	vaddsd	8(%r10), %xmm2, %xmm14
	vmulsd	beta_coef(%rip), %xmm9, %xmm4
	vfnmadd231sd	.LC3(%rip), %xmm3, %xmm14
	vfmadd132sd	alfa(%rip), %xmm4, %xmm14
	vaddsd	%xmm3, %xmm14, %xmm8
	vmovsd	%xmm8, (%r12)
.L156:
	movl	$2, %r13d
	leaq	8(%rax), %r8
.L204:
	leaq	0(%r13,%r15), %r9
	andl	$1, %r9d
	jne	.L159
	vmovsd	8(%r8), %xmm7
	vmovsd	(%r8), %xmm12
	vaddsd	16(%r8), %xmm12, %xmm5
	vmovsd	(%rcx,%r13,8), %xmm1
	vfnmadd231sd	.LC3(%rip), %xmm7, %xmm5
	vaddsd	(%r10,%r13,8), %xmm1, %xmm0
	vmulsd	beta_coef(%rip), %xmm5, %xmm11
	vfnmadd231sd	.LC3(%rip), %xmm7, %xmm0
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm7, %xmm0, %xmm6
	vmovsd	%xmm6, -8(%r12,%r13,8)
.L159:
	incq	%r13
	addq	$8, %r8
.L203:
	leaq	0(%r13,%r15), %rdi
	andl	$1, %edi
	jne	.L162
	vmovsd	8(%r8), %xmm10
	vmovsd	(%r8), %xmm14
	vaddsd	16(%r8), %xmm14, %xmm13
	vmovsd	(%rcx,%r13,8), %xmm3
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm13
	vaddsd	(%r10,%r13,8), %xmm3, %xmm2
	vmulsd	beta_coef(%rip), %xmm13, %xmm9
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm2
	vfmadd132sd	alfa(%rip), %xmm9, %xmm2
	vaddsd	%xmm10, %xmm2, %xmm4
	vmovsd	%xmm4, -8(%r12,%r13,8)
.L162:
	incq	%r13
	addq	$8, %r8
	cmpq	%r13, -112(%rbp)
	je	.L68
.L67:
	leaq	0(%r13,%r15), %rdx
	andl	$1, %edx
	jne	.L66
	vmovsd	8(%r8), %xmm8
	vmovsd	(%r8), %xmm1
	vaddsd	16(%r8), %xmm1, %xmm12
	vmovsd	(%rcx,%r13,8), %xmm7
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm12
	vaddsd	(%r10,%r13,8), %xmm7, %xmm0
	vmulsd	beta_coef(%rip), %xmm12, %xmm5
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm0
	vfmadd132sd	alfa(%rip), %xmm5, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm11
	vmovsd	%xmm11, -8(%r12,%r13,8)
.L66:
	incq	%r13
	leaq	8(%r8), %rsi
	leaq	0(%r13,%r15), %r11
	andl	$1, %r11d
	jne	.L165
	vmovsd	8(%rsi), %xmm6
	vmovsd	8(%r8), %xmm2
	vaddsd	16(%rsi), %xmm2, %xmm14
	vmovsd	(%rcx,%r13,8), %xmm10
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm14
	vaddsd	(%r10,%r13,8), %xmm10, %xmm3
	vmulsd	beta_coef(%rip), %xmm14, %xmm13
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm3
	vfmadd132sd	alfa(%rip), %xmm13, %xmm3
	vaddsd	%xmm6, %xmm3, %xmm9
	vmovsd	%xmm9, -8(%r12,%r13,8)
.L165:
	leaq	1(%r13), %r8
	leaq	(%r8,%r15), %r9
	andl	$1, %r9d
	jne	.L167
	vmovsd	16(%rsi), %xmm4
	vmovsd	8(%rsi), %xmm0
	vaddsd	24(%rsi), %xmm0, %xmm1
	vmovsd	(%rcx,%r8,8), %xmm8
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm1
	vaddsd	(%r10,%r8,8), %xmm8, %xmm7
	vmulsd	beta_coef(%rip), %xmm1, %xmm12
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm7
	vfmadd132sd	alfa(%rip), %xmm12, %xmm7
	vaddsd	%xmm4, %xmm7, %xmm5
	vmovsd	%xmm5, -8(%r12,%r8,8)
.L167:
	leaq	2(%r13), %rdi
	leaq	(%rdi,%r15), %rdx
	andl	$1, %edx
	jne	.L169
	vmovsd	24(%rsi), %xmm11
	vmovsd	16(%rsi), %xmm3
	vaddsd	32(%rsi), %xmm3, %xmm2
	vmovsd	(%rcx,%rdi,8), %xmm6
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm2
	vaddsd	(%r10,%rdi,8), %xmm6, %xmm10
	vmulsd	beta_coef(%rip), %xmm2, %xmm14
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm10
	vfmadd132sd	alfa(%rip), %xmm14, %xmm10
	vaddsd	%xmm11, %xmm10, %xmm13
	vmovsd	%xmm13, -8(%r12,%rdi,8)
.L169:
	addq	$3, %r13
	leaq	24(%rsi), %r8
	cmpq	%r13, -112(%rbp)
	jne	.L67
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L27:
	cmpl	$1, %esi
	je	.L29
	movl	-212(%rbp), %r11d
	testl	%r11d, %r11d
	jne	.L275
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L260
	movq	NP(%rip), %rdi
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%rdi), %esi
	leaq	8(%r15,%rdi,8), %rdi
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	movq	-288(%rbp), %r8
	movl	NP(%rip), %edx
	movl	vizNorte(%rip), %ecx
	movl	$1140850688, %r9d
	movq	%r15, %rdi
	pushq	(%r8)
	xorl	%r8d, %r8d
	leal	1(%rdx), %esi
	movl	$1275070475, %edx
	call	MPI_Recv
	popq	%r12
	popq	%r13
.L50:
	movl	-236(%rbp), %r13d
	testl	%r13d, %r13d
	je	.L51
.L49:
	movq	-160(%rbp), %rax
	movq	m(%rip), %r8
	movl	-216(%rbp), %edi
	movl	-124(%rbp), %r10d
	movl	$1, lock(,%rax,4)
	movq	%r8, -104(%rbp)
	cmpl	%r10d, %edi
	jg	.L32
	movq	NP(%rip), %rsi
	movq	N(%rip), %r12
	leaq	1(%rsi), %r13
	cmpq	$2, %r12
	jle	.L32
	leaq	-1(%r12,%r8), %r9
	movq	%r13, %rbx
	negq	%r8
	movq	%r14, -112(%rbp)
	movq	-264(%rbp), %rax
	leaq	0(,%r13,8), %rdx
	leal	1(%r10), %r10d
	movq	-280(%rbp), %rcx
	leaq	-8(%rdx), %r11
	movl	%r10d, -88(%rbp)
	vmovsd	.LC3(%rip), %xmm2
	imulq	%rax, %rdx
	addq	%rax, %r9
	leaq	(%rcx,%r8,8), %r8
	movq	%r11, -96(%rbp)
	imulq	%rax, %rbx
	movl	$2, %eax
	vmovsd	.LC4(%rip), %xmm1
	movq	%r15, -80(%rbp)
	subq	%r12, %rax
	addq	%rdx, %r8
	movq	%rax, %r15
	movl	%edi, %edx
	leaq	(%r14,%r8), %r11
	.p2align 4,,10
	.p2align 3
.L34:
	leal	1(%rdx), %r14d
	decl	%edx
	movq	-80(%rbp), %rsi
	movq	%r15, %rcx
	movslq	%r14d, %r12
	movslq	%edx, %rdx
	leaq	(%r15,%r9), %rax
	negq	%rcx
	imulq	%r13, %r12
	leaq	(%rsi,%rbx,8), %rsi
	imulq	%r13, %rdx
	subq	%rbx, %r12
	subq	%rbx, %rdx
	andl	$3, %ecx
	je	.L47
	cmpq	$1, %rcx
	je	.L201
	cmpq	$2, %rcx
	je	.L202
	movq	%rax, %r8
	shrq	$63, %r8
	leaq	(%rax,%r8), %r10
	andl	$1, %r10d
	subq	%r8, %r10
	cmpq	$1, %r10
	jne	.L141
	vmovsd	(%rsi), %xmm7
	vaddsd	16(%rsi), %xmm7, %xmm0
	vmovsd	beta_coef(%rip), %xmm9
	vmovsd	alfa(%rip), %xmm15
	vmovsd	8(%rsi,%rdx,8), %xmm4
	vaddsd	8(%rsi,%r12,8), %xmm4, %xmm8
	vmulsd	%xmm9, %xmm0, %xmm12
	vaddsd	%xmm15, %xmm9, %xmm11
	vfmadd132sd	%xmm2, %xmm1, %xmm11
	vfmadd132sd	%xmm15, %xmm12, %xmm8
	vaddsd	(%r11,%rax,8), %xmm8, %xmm5
	vdivsd	%xmm11, %xmm5, %xmm6
	vmovsd	%xmm6, 8(%rsi)
.L141:
	incq	%rax
	addq	$8, %rsi
.L202:
	movq	%rax, %rdi
	shrq	$63, %rdi
	leaq	(%rax,%rdi), %rcx
	andl	$1, %ecx
	subq	%rdi, %rcx
	cmpq	$1, %rcx
	jne	.L144
	vmovsd	(%rsi), %xmm15
	vaddsd	16(%rsi), %xmm15, %xmm9
	vmovsd	beta_coef(%rip), %xmm3
	vmovsd	alfa(%rip), %xmm10
	vmovsd	8(%rsi,%rdx,8), %xmm14
	vaddsd	8(%rsi,%r12,8), %xmm14, %xmm13
	vmulsd	%xmm3, %xmm9, %xmm4
	vaddsd	%xmm10, %xmm3, %xmm7
	vfmadd132sd	%xmm2, %xmm1, %xmm7
	vfmadd132sd	%xmm10, %xmm4, %xmm13
	vaddsd	(%r11,%rax,8), %xmm13, %xmm8
	vdivsd	%xmm7, %xmm8, %xmm0
	vmovsd	%xmm0, 8(%rsi)
.L144:
	incq	%rax
	addq	$8, %rsi
.L201:
	movq	%rax, %r8
	shrq	$63, %r8
	leaq	(%rax,%r8), %r10
	andl	$1, %r10d
	subq	%r8, %r10
	cmpq	$1, %r10
	jne	.L147
	vmovsd	(%rsi), %xmm10
	vaddsd	16(%rsi), %xmm10, %xmm3
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm12
	vmovsd	8(%rsi,%rdx,8), %xmm11
	vaddsd	8(%rsi,%r12,8), %xmm11, %xmm6
	vmulsd	%xmm5, %xmm3, %xmm14
	vaddsd	%xmm12, %xmm5, %xmm15
	vfmadd132sd	%xmm2, %xmm1, %xmm15
	vfmadd132sd	%xmm12, %xmm14, %xmm6
	vaddsd	(%r11,%rax,8), %xmm6, %xmm13
	vdivsd	%xmm15, %xmm13, %xmm9
	vmovsd	%xmm9, 8(%rsi)
.L147:
	incq	%rax
	addq	$8, %rsi
	cmpq	%r9, %rax
	je	.L250
.L47:
	movq	%rax, %rdi
	shrq	$63, %rdi
	leaq	(%rax,%rdi), %rcx
	andl	$1, %ecx
	subq	%rdi, %rcx
	cmpq	$1, %rcx
	jne	.L46
	vmovsd	(%rsi), %xmm12
	vaddsd	16(%rsi), %xmm12, %xmm5
	vmovsd	beta_coef(%rip), %xmm7
	vmovsd	alfa(%rip), %xmm8
	vmovsd	8(%rsi,%rdx,8), %xmm4
	vaddsd	8(%rsi,%r12,8), %xmm4, %xmm0
	vmulsd	%xmm7, %xmm5, %xmm11
	vaddsd	%xmm8, %xmm7, %xmm10
	vfmadd132sd	%xmm2, %xmm1, %xmm10
	vfmadd132sd	%xmm8, %xmm11, %xmm0
	vaddsd	(%r11,%rax,8), %xmm0, %xmm6
	vdivsd	%xmm10, %xmm6, %xmm3
	vmovsd	%xmm3, 8(%rsi)
.L46:
	incq	%rax
	leaq	8(%rsi), %rdi
	movq	%rax, %r10
	shrq	$63, %r10
	leaq	(%rax,%r10), %r8
	andl	$1, %r8d
	subq	%r10, %r8
	cmpq	$1, %r8
	jne	.L150
	vmovsd	8(%rsi), %xmm8
	vaddsd	16(%rdi), %xmm8, %xmm7
	vmovsd	beta_coef(%rip), %xmm13
	vmovsd	alfa(%rip), %xmm14
	vmovsd	8(%rdi,%rdx,8), %xmm15
	vaddsd	8(%rdi,%r12,8), %xmm15, %xmm9
	vmulsd	%xmm13, %xmm7, %xmm4
	vaddsd	%xmm14, %xmm13, %xmm12
	vfmadd132sd	%xmm2, %xmm1, %xmm12
	vfmadd132sd	%xmm14, %xmm4, %xmm9
	vaddsd	(%r11,%rax,8), %xmm9, %xmm0
	vdivsd	%xmm12, %xmm0, %xmm5
	vmovsd	%xmm5, 8(%rdi)
.L150:
	leaq	1(%rax), %rcx
	movq	%rcx, %r10
	shrq	$63, %r10
	leaq	(%rcx,%r10), %rsi
	andl	$1, %esi
	subq	%r10, %rsi
	cmpq	$1, %rsi
	jne	.L152
	vmovsd	8(%rdi), %xmm14
	vaddsd	24(%rdi), %xmm14, %xmm13
	vmovsd	beta_coef(%rip), %xmm6
	vmovsd	alfa(%rip), %xmm11
	vmovsd	16(%rdi,%rdx,8), %xmm10
	vaddsd	16(%rdi,%r12,8), %xmm10, %xmm3
	vmulsd	%xmm6, %xmm13, %xmm15
	vaddsd	%xmm11, %xmm6, %xmm8
	vfmadd132sd	%xmm2, %xmm1, %xmm8
	vfmadd132sd	%xmm11, %xmm15, %xmm3
	vaddsd	(%r11,%rcx,8), %xmm3, %xmm9
	vdivsd	%xmm8, %xmm9, %xmm7
	vmovsd	%xmm7, 16(%rdi)
.L152:
	leaq	2(%rax), %r8
	movq	%r8, %rcx
	shrq	$63, %rcx
	leaq	(%r8,%rcx), %r10
	andl	$1, %r10d
	subq	%rcx, %r10
	cmpq	$1, %r10
	jne	.L154
	vmovsd	16(%rdi), %xmm11
	vaddsd	32(%rdi), %xmm11, %xmm6
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm12
	vmovsd	24(%rdi,%rdx,8), %xmm4
	vaddsd	24(%rdi,%r12,8), %xmm4, %xmm0
	vmulsd	%xmm5, %xmm6, %xmm10
	vaddsd	%xmm12, %xmm5, %xmm3
	vfmadd132sd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	%xmm12, %xmm10, %xmm0
	vaddsd	(%r11,%r8,8), %xmm0, %xmm14
	vdivsd	%xmm3, %xmm14, %xmm13
	vmovsd	%xmm13, 24(%rdi)
.L154:
	addq	$3, %rax
	leaq	24(%rdi), %rsi
	cmpq	%r9, %rax
	jne	.L47
.L250:
	movl	%r14d, %edx
	incq	%r9
	addq	%r13, %rbx
	addq	-96(%rbp), %r11
	cmpl	%r14d, -88(%rbp)
	jne	.L34
	movq	-112(%rbp), %r14
	movq	-80(%rbp), %r15
.L32:
	movq	-160(%rbp), %r12
	movq	-248(%rbp), %rax
	movq	-256(%rbp), %r8
	movl	$0, lock(,%r12,4)
	movl	lock(,%rax,4), %edi
	movl	lock(,%r8,4), %ecx
	.p2align 4,,10
	.p2align 3
.L37:
	cmpl	$1, %edi
	jne	.L35
.L36:
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L35:
	cmpl	$1, %ecx
	je	.L37
	movq	-104(%rbp), %r10
	movl	-212(%rbp), %esi
	incq	%r10
	movq	%r10, m(%rip)
	testl	%esi, %esi
	jne	.L276
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L44
	movq	NP(%rip), %r9
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r9), %esi
	leaq	8(%r15,%r9,8), %rdi
	movl	$1140850688, %r9d
	call	MPI_Send
	subq	$8, %rsp
	movq	%r15, %rdi
	xorl	%r8d, %r8d
	movq	-288(%rbp), %r13
	movl	NP(%rip), %r11d
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	movl	vizNorte(%rip), %ecx
	pushq	0(%r13)
	leal	1(%r11), %esi
	call	MPI_Recv
	popq	%rsi
	popq	%rdi
.L44:
	movl	-236(%rbp), %edx
	testl	%edx, %edx
	je	.L45
.L43:
	call	GOMP_barrier
	vmovsd	.LC1(%rip), %xmm15
	vmulsd	tempoFinal(%rip), %xmm15, %xmm9
	vcomisd	-272(%rbp), %xmm9
	vmovapd	.LC7(%rip), %ymm15
	ja	.L40
	vzeroupper
.L262:
	leaq	-48(%rbp), %rsp
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
	.p2align 4,,10
	.p2align 3
.L268:
	.cfi_restore_state
	vmaskmovpd	%xmm9, %xmm0, 16(%r8)
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L267:
	vmaskmovpd	%xmm14, %xmm1, (%r8)
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L274:
	vmaskmovpd	%xmm4, %xmm0, 16(%r8)
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L273:
	vmaskmovpd	%xmm9, %xmm1, (%r8)
	jmp	.L59
.L53:
	movq	-184(%rbp), %rdi
	movl	$1, -80(%rbp)
	xorl	%r8d, %r8d
	movq	$1, -144(%rbp)
	movq	%rdi, -136(%rbp)
	jmp	.L98
.L80:
	movq	-184(%rbp), %rdi
	movl	$1, -80(%rbp)
	xorl	%r8d, %r8d
	movq	$1, -144(%rbp)
	movq	%rdi, -136(%rbp)
	jmp	.L99
.L100:
	movq	-224(%rbp), %r8
	movl	-232(%rbp), %edx
	jmp	.L58
.L101:
	movq	-232(%rbp), %r8
	movl	-224(%rbp), %edx
	jmp	.L85
.L269:
	movl	-236(%rbp), %r9d
	cmpl	%r9d, -212(%rbp)
	jne	.L76
.L78:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L76
	movq	NP(%rip), %r12
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r12), %esi
	incq	%r12
	imulq	nN(%rip), %r12
	leaq	(%r14,%r12,8), %rdi
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	NP(%rip), %rcx
	movq	nN(%rip), %rax
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	movq	-288(%rbp), %rbx
	leal	1(%rcx), %esi
	incq	%rax
	incq	%rcx
	imulq	%rcx, %rax
	pushq	(%rbx)
	movl	vizSul(%rip), %ecx
	leaq	(%r14,%rax,8), %rdi
	call	MPI_Recv
	popq	%rcx
	vmovapd	.LC7(%rip), %ymm15
	popq	%rsi
	jmp	.L76
.L275:
	movl	-236(%rbp), %r9d
	cmpl	%r9d, -212(%rbp)
	je	.L277
	vzeroupper
	jmp	.L49
.L270:
	movl	-236(%rbp), %ebx
	cmpl	%ebx, -212(%rbp)
	jne	.L70
.L72:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L70
	movq	NP(%rip), %r12
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r12), %esi
	incq	%r12
	imulq	nN(%rip), %r12
	leaq	(%r14,%r12,8), %rdi
	vzeroupper
	call	MPI_Send
	movq	NP(%rip), %rdi
	subq	$8, %rsp
	movq	nN(%rip), %rcx
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	movq	-288(%rbp), %r8
	leal	1(%rdi), %esi
	incq	%rdi
	incq	%rcx
	pushq	(%r8)
	xorl	%r8d, %r8d
	imulq	%rdi, %rcx
	leaq	(%r14,%rcx,8), %rdi
	movl	vizSul(%rip), %ecx
	call	MPI_Recv
	popq	%r10
	vmovapd	.LC7(%rip), %ymm15
	popq	%r11
	jmp	.L70
.L276:
	movl	-236(%rbp), %ebx
	cmpl	%ebx, -212(%rbp)
	jne	.L43
.L45:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L43
	movq	NP(%rip), %r12
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r12), %esi
	incq	%r12
	imulq	nN(%rip), %r12
	leaq	(%r15,%r12,8), %rdi
	call	MPI_Send
	movq	NP(%rip), %rdi
	movq	nN(%rip), %rax
	subq	$8, %rsp
	movq	-288(%rbp), %r8
	movl	vizSul(%rip), %ecx
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%rdi), %esi
	incq	%rax
	incq	%rdi
	imulq	%rdi, %rax
	pushq	(%r8)
	xorl	%r8d, %r8d
	leaq	(%r15,%rax,8), %rdi
	call	MPI_Recv
	popq	%r8
	popq	%r9
	jmp	.L43
.L277:
	vzeroupper
.L51:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L49
	movq	NP(%rip), %r10
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r10), %esi
	incq	%r10
	imulq	nN(%rip), %r10
	leaq	(%r15,%r10,8), %rdi
	call	MPI_Send
	movq	NP(%rip), %rbx
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	nN(%rip), %r12
	movq	-288(%rbp), %rcx
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	leal	1(%rbx), %esi
	incq	%rbx
	incq	%r12
	pushq	(%rcx)
	movl	vizSul(%rip), %ecx
	imulq	%rbx, %r12
	leaq	(%r15,%r12,8), %rdi
	call	MPI_Recv
	popq	%rax
	popq	%rdx
	jmp	.L49
.L260:
	vzeroupper
	jmp	.L50
.L264:
	addl	%edx, %edi
	addl	%edx, %eax
	movl	%r14d, %r9d
	movl	%edi, -216(%rbp)
	movl	%eax, -124(%rbp)
	jmp	.L97
	.cfi_endproc
.LFE3800:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3800:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3800-.LLSDACSB3800
.LLSDACSB3800:
.LLSDACSE3800:
	.text
	.size	main._omp_fn.0, .-main._omp_fn.0
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB3806:
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
	je	.L285
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L280
	movsbl	67(%r12), %esi
.L281:
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
.L280:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r12), %rcx
	movl	$10, %esi
	movq	48(%rcx), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L281
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L281
.L285:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE3806:
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
	vxorpd	.LC11(%rip), %xmm0, %xmm0
	jmp	exp
	.cfi_endproc
.LFE3106:
	.size	_Z5pulsoddddd, .-_Z5pulsoddddd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC20:
	.string	"# Tempo = "
.LC21:
	.string	" segundos ..."
.LC22:
	.string	"output_data.txt"
.LC23:
	.string	" "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC24:
	.string	"Erro ao abrir o arquivo para escrita."
	.section	.text.unlikely,"ax",@progbits
.LCOLDB28:
	.section	.text.startup,"ax",@progbits
.LHOTB28:
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
	movl	$10, %edx
	movq	32(%rax), %rdi
	call	strtol
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	.LC4(%rip), %xmm2
	movslq	numProcs(%rip), %rcx
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	movslq	%eax, %rdx
	movl	myRank(%rip), %r9d
	vmovsd	-656(%rbp), %xmm1
	leaq	-1(%rdx), %rax
	leaq	1(%rdx), %rsi
	movq	%rcx, %r8
	movq	%rdx, -880(%rbp)
	movq	%rdx, NP(%rip)
	cqto
	movl	%r9d, %edi
	idivq	%rcx
	movq	%rsi, -824(%rbp)
	movq	%rsi, N(%rip)
	vdivsd	%xmm0, %xmm2, %xmm5
	imull	%eax, %edi
	cmpl	%r9d, %edx
	movl	%eax, numLocalPontos(%rip)
	movl	%edx, resto(%rip)
	leal	1(%rdi), %r15d
	leal	(%rdi,%rax), %ebx
	vmovsd	%xmm5, -840(%rbp)
	vmovsd	%xmm5, h(%rip)
	vmovsd	%xmm5, deltaX(%rip)
	vmovsd	%xmm5, deltaY(%rip)
	jle	.L288
	addl	%r9d, %r15d
	leal	1(%r9,%rbx), %ebx
.L289:
	decl	%r8d
	leal	1(%r9), %r12d
	movl	$-1, %r13d
	movl	%ebx, finalLocal(%rip)
	cmpl	%r8d, %r9d
	movq	-824(%rbp), %r14
	leal	-1(%r9), %r11d
	vmovsd	%xmm1, -656(%rbp)
	cmove	%r13d, %r12d
	subl	%r15d, %ebx
	movl	%r11d, vizNorte(%rip)
	leal	1(%rbx), %r13d
	movl	%r15d, inicioLocal(%rip)
	movslq	%r13d, %r10
	movl	%r12d, vizSul(%rip)
	movq	%r10, nN(%rip)
	addq	$2, %r10
	imulq	%r14, %r10
	leaq	0(,%r10,8), %r12
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, -848(%rbp)
	call	malloc
	movq	%rax, -856(%rbp)
	cmpl	$-1, %r13d
	jl	.L293
	movq	-880(%rbp), %r9
	leal	2(%rbx,%r15), %edx
	movq	%rax, -872(%rbp)
	leal	-1(%r15), %eax
	movq	-848(%rbp), %r8
	movl	%eax, -612(%rbp)
	leaq	0(,%r14,8), %rsi
	vmovddup	-840(%rbp), %xmm3
	leaq	1(%r9), %rdi
	xorl	%r12d, %r12d
	xorl	%r9d, %r9d
	movq	%rsi, -904(%rbp)
	movq	%rdi, %r15
	movq	%rdi, -928(%rbp)
	andq	$-8, %rdi
	vmovsd	-656(%rbp), %xmm13
	shrq	$3, %r15
	movq	%r8, -864(%rbp)
	salq	$6, %r15
	movl	%edx, -616(%rbp)
	movq	%r15, -920(%rbp)
	movq	%rdi, -936(%rbp)
	movl	%edi, -600(%rbp)
	vmovapd	%xmm3, -896(%rbp)
	.p2align 4,,10
	.p2align 3
.L292:
	cmpq	$0, -824(%rbp)
	jle	.L301
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	-840(%rbp), %xmm8
	cmpq	$6, -880(%rbp)
	vcvtsi2sdl	-612(%rbp), %xmm4, %xmm7
	vmulsd	%xmm8, %xmm7, %xmm9
	vsubsd	.LC1(%rip), %xmm9, %xmm10
	vmulsd	%xmm10, %xmm10, %xmm11
	vmovsd	%xmm9, -912(%rbp)
	vmovsd	%xmm11, -624(%rbp)
	jbe	.L328
	movq	-872(%rbp), %r15
	vbroadcastsd	%xmm8, %ymm12
	movq	-920(%rbp), %rax
	vbroadcastsd	%xmm11, %ymm13
	movq	-864(%rbp), %rbx
	vmovdqa	.LC12(%rip), %ymm9
	vmovapd	%ymm12, -656(%rbp)
	leaq	(%r15,%rax), %r13
	vmovapd	%ymm13, -688(%rbp)
	movq	%r13, -832(%rbp)
	testb	$64, %al
	je	.L295
	vcvtdq2pd	%xmm9, %ymm5
	vextracti128	$0x1, %ymm9, %xmm6
	vfmadd213pd	.LC13(%rip), %ymm12, %ymm5
	vpaddd	.LC5(%rip), %ymm9, %ymm15
	vcvtdq2pd	%xmm6, %ymm0
	vmulpd	%ymm12, %ymm0, %ymm2
	vaddpd	.LC13(%rip), %ymm2, %ymm1
	vmovdqa	%ymm15, -816(%rbp)
	vfmadd132pd	%ymm5, %ymm13, %ymm5
	vfmadd132pd	%ymm1, %ymm13, %ymm1
	vmulpd	.LC14(%rip), %ymm5, %ymm0
	vmovapd	%ymm2, -784(%rbp)
	vmovapd	%ymm1, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm4
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC14(%rip), %ymm4, %ymm0
	call	_ZGVdN4v_exp
	movq	-872(%rbp), %r10
	movq	-864(%rbp), %r14
	vmovapd	-752(%rbp), %ymm7
	vmovapd	-784(%rbp), %ymm8
	leaq	64(%r10), %r15
	vmovupd	%ymm0, 32(%r10)
	leaq	64(%r14), %rbx
	cmpq	-832(%rbp), %r15
	vmovdqa	-816(%rbp), %ymm9
	vmovupd	%ymm7, (%r10)
	vmovupd	%ymm7, (%r14)
	vmovupd	%ymm0, 32(%r14)
	je	.L429
	.p2align 4,,10
	.p2align 3
.L295:
	vmovapd	-656(%rbp), %ymm13
	vcvtdq2pd	%xmm9, %ymm15
	vfmadd213pd	.LC13(%rip), %ymm13, %ymm15
	vextracti128	$0x1, %ymm9, %xmm11
	vcvtdq2pd	%xmm11, %ymm12
	vmovapd	-688(%rbp), %ymm0
	subq	$-128, %r15
	subq	$-128, %rbx
	vmulpd	%ymm13, %ymm12, %ymm14
	vpaddd	.LC5(%rip), %ymm9, %ymm10
	vaddpd	.LC13(%rip), %ymm14, %ymm6
	vmovdqa	%ymm10, -784(%rbp)
	vfmadd132pd	%ymm15, %ymm0, %ymm15
	vfmadd132pd	%ymm6, %ymm0, %ymm6
	vmulpd	.LC14(%rip), %ymm15, %ymm0
	vmovapd	%ymm6, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm5
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC14(%rip), %ymm5, %ymm0
	call	_ZGVdN4v_exp
	vmovdqa	-784(%rbp), %ymm3
	vmovapd	-656(%rbp), %ymm9
	vmovapd	-688(%rbp), %ymm13
	vmovupd	%ymm0, -96(%r15)
	vmovapd	-752(%rbp), %ymm1
	vcvtdq2pd	%xmm3, %ymm11
	vextracti128	$0x1, %ymm3, %xmm7
	vfmadd213pd	.LC13(%rip), %ymm9, %ymm11
	vmovupd	%ymm0, -96(%rbx)
	vcvtdq2pd	%xmm7, %ymm8
	vmulpd	%ymm9, %ymm8, %ymm10
	vmovupd	%ymm1, -128(%r15)
	vpaddd	.LC5(%rip), %ymm3, %ymm4
	vaddpd	.LC13(%rip), %ymm10, %ymm12
	vmovupd	%ymm1, -128(%rbx)
	vmovdqa	%ymm4, -816(%rbp)
	vfmadd132pd	%ymm11, %ymm13, %ymm11
	vfmadd132pd	%ymm12, %ymm13, %ymm12
	vmulpd	.LC14(%rip), %ymm11, %ymm0
	vmovapd	%ymm10, -784(%rbp)
	vmovapd	%ymm12, -720(%rbp)
	call	_ZGVdN4v_exp
	vmovapd	-720(%rbp), %ymm15
	vmovapd	%ymm0, -752(%rbp)
	vmulpd	.LC14(%rip), %ymm15, %ymm0
	call	_ZGVdN4v_exp
	vmovapd	-752(%rbp), %ymm6
	vmovapd	-784(%rbp), %ymm8
	vmovupd	%ymm0, -32(%r15)
	vmovdqa	-816(%rbp), %ymm9
	vmovupd	%ymm6, -64(%r15)
	vmovupd	%ymm6, -64(%rbx)
	vmovupd	%ymm0, -32(%rbx)
	cmpq	-832(%rbp), %r15
	jne	.L295
.L429:
	movq	-936(%rbp), %r15
	vextractf128	$0x1, %ymm8, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm13
	movq	%r15, %r11
	cmpq	%r15, -928(%rbp)
	je	.L296
	movl	-600(%rbp), %ebx
.L294:
	movq	-880(%rbp), %rsi
	subq	%r11, %rsi
	leaq	1(%rsi), %r13
	cmpq	$2, %rsi
	jbe	.L297
	vmovd	%ebx, %xmm2
	vmovapd	-896(%rbp), %xmm8
	addq	%r12, %r11
	vmovddup	-624(%rbp), %xmm3
	vpshufd	$0, %xmm2, %xmm5
	movq	-856(%rbp), %rcx
	salq	$3, %r11
	vpaddd	.LC8(%rip), %xmm5, %xmm4
	vpshufd	$238, %xmm4, %xmm1
	vcvtdq2pd	%xmm4, %xmm10
	addq	%r11, %rcx
	addq	-848(%rbp), %r11
	vfmadd213pd	.LC15(%rip), %xmm8, %xmm10
	vcvtdq2pd	%xmm1, %xmm7
	movq	%rcx, -720(%rbp)
	vmulpd	%xmm8, %xmm7, %xmm9
	movq	%r11, -688(%rbp)
	vaddpd	.LC15(%rip), %xmm9, %xmm11
	vfmadd132pd	%xmm10, %xmm3, %xmm10
	vfmadd132pd	%xmm11, %xmm3, %xmm11
	vmulpd	.LC16(%rip), %xmm11, %xmm13
	vmovapd	%xmm9, -656(%rbp)
	vmulpd	.LC16(%rip), %xmm10, %xmm12
	vinsertf128	$0x1, %xmm13, %ymm12, %ymm0
	call	_ZGVdN4v_exp
	movq	-720(%rbp), %r8
	movq	-688(%rbp), %rdx
	movq	%r13, %r9
	vmovapd	-656(%rbp), %xmm6
	vextractf128	$0x1, %ymm0, %xmm15
	andq	$-4, %r9
	vmovupd	%xmm0, (%r8)
	addq	%r9, %r15
	addl	%r9d, %ebx
	vmovupd	%xmm15, 16(%r8)
	vunpckhpd	%xmm6, %xmm6, %xmm13
	vmovupd	%xmm0, (%rdx)
	vmovupd	%xmm15, 16(%rdx)
	cmpq	%r9, %r13
	je	.L296
.L297:
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	-856(%rbp), %r14
	addq	%r12, %r15
	vcvtsi2sdl	%ebx, %xmm0, %xmm2
	vmulsd	-840(%rbp), %xmm2, %xmm5
	vsubsd	.LC1(%rip), %xmm5, %xmm4
	leaq	(%r14,%r15,8), %rdi
	vfmadd213sd	-624(%rbp), %xmm4, %xmm4
	vmulsd	.LC17(%rip), %xmm4, %xmm0
	movq	%rdi, -688(%rbp)
	vmovsd	%xmm5, -656(%rbp)
	vzeroupper
	call	exp
	movq	-688(%rbp), %r11
	movq	-848(%rbp), %r13
	leal	1(%rbx), %r10d
	vmovsd	-656(%rbp), %xmm13
	movslq	%r10d, %rax
	cmpq	%rax, -824(%rbp)
	vmovsd	%xmm0, (%r11)
	vmovsd	%xmm0, 0(%r13,%r15,8)
	jle	.L296
	vxorpd	%xmm3, %xmm3, %xmm3
	leaq	(%r12,%rax), %r15
	addl	$2, %ebx
	vcvtsi2sdl	%r10d, %xmm3, %xmm1
	vmulsd	-840(%rbp), %xmm1, %xmm7
	leaq	(%r14,%r15,8), %rsi
	vsubsd	.LC1(%rip), %xmm7, %xmm8
	movq	%rsi, -688(%rbp)
	vfmadd213sd	-624(%rbp), %xmm8, %xmm8
	vmulsd	.LC17(%rip), %xmm8, %xmm0
	vmovsd	%xmm7, -656(%rbp)
	call	exp
	movq	-688(%rbp), %rcx
	movslq	%ebx, %r8
	cmpq	%r8, -824(%rbp)
	vmovsd	-656(%rbp), %xmm13
	vmovsd	%xmm0, 0(%r13,%r15,8)
	vmovsd	%xmm0, (%rcx)
	jle	.L296
	vxorpd	%xmm9, %xmm9, %xmm9
	vcvtsi2sdl	%ebx, %xmm9, %xmm10
	vmulsd	-840(%rbp), %xmm10, %xmm11
	leaq	(%r12,%r8), %rbx
	vsubsd	.LC1(%rip), %xmm11, %xmm12
	leaq	(%r14,%rbx,8), %r14
	vfmadd213sd	-624(%rbp), %xmm12, %xmm12
	vmulsd	.LC17(%rip), %xmm12, %xmm0
	vmovsd	%xmm11, -656(%rbp)
	call	exp
	vmovsd	-656(%rbp), %xmm13
	vmovsd	%xmm0, (%r14)
	vmovsd	%xmm0, 0(%r13,%rbx,8)
.L296:
	movl	$1, %r9d
.L301:
	movq	-904(%rbp), %rdx
	incl	-612(%rbp)
	addq	%rdx, -872(%rbp)
	movl	-612(%rbp), %edi
	addq	%rdx, -864(%rbp)
	addq	-824(%rbp), %r12
	cmpl	%edi, -616(%rbp)
	jne	.L292
	testb	%r9b, %r9b
	je	.L435
	vmovsd	-912(%rbp), %xmm14
	vmovsd	%xmm13, y(%rip)
	vmovsd	%xmm14, x(%rip)
	vzeroupper
.L293:
	movq	-608(%rbp), %r12
	xorl	%esi, %esi
	leaq	-592(%rbp), %r15
	movq	8(%r12), %rdi
	call	strtod
	movq	-608(%rbp), %r11
	xorl	%esi, %esi
	vmovsd	%xmm0, gama(%rip)
	movq	16(%r11), %rdi
	call	strtod
	movq	-608(%rbp), %r13
	xorl	%esi, %esi
	vmovsd	%xmm0, tempoFinal(%rip)
	movq	24(%r13), %rdi
	call	strtod
	vmovsd	deltaX(%rip), %xmm6
	vmovsd	deltaY(%rip), %xmm5
	vmulsd	gama(%rip), %xmm0, %xmm15
	vmovsd	%xmm0, deltaT(%rip)
	vmulsd	%xmm5, %xmm5, %xmm4
	vmulsd	%xmm6, %xmm6, %xmm0
	vdivsd	%xmm4, %xmm15, %xmm3
	vdivsd	%xmm0, %xmm15, %xmm2
	vmovsd	%xmm3, beta_coef(%rip)
	vmovsd	%xmm2, alfa(%rip)
	call	omp_get_wtime
	movq	-856(%rbp), %r10
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movq	-848(%rbp), %rax
	leaq	-560(%rbp), %rsi
	movl	$main._omp_fn.0, %edi
	vmovsd	%xmm0, t_ini(%rip)
	movq	%r10, -544(%rbp)
	movq	%rax, -552(%rbp)
	movq	%r15, -560(%rbp)
	call	GOMP_parallel
	call	omp_get_wtime
	movslq	myRank(%rip), %rbx
	vmovsd	%xmm0, t_fim(%rip)
	testl	%ebx, %ebx
	je	.L440
	movq	$0, -720(%rbp)
	movq	NP(%rip), %rcx
	xorl	%r15d, %r15d
	movq	$0, -688(%rbp)
.L302:
	movq	nN(%rip), %r12
	subq	$8, %rsp
	incq	%rcx
	movq	-720(%rbp), %r9
	pushq	$1140850688
	movq	-688(%rbp), %r8
	movl	$1275070475, %edx
	leaq	2(%r12), %rsi
	pushq	$0
	movq	-848(%rbp), %rdi
	imull	%ecx, %esi
	pushq	$1275070475
	movq	%r15, %rcx
	call	MPI_Gatherv
	movl	myRank(%rip), %ecx
	addq	$32, %rsp
	testl	%ecx, %ecx
	jne	.L316
	movl	$10, %edx
	movl	$.LC20, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	t_fim(%rip), %xmm2
	movl	$_ZSt4cout, %edi
	vsubsd	t_ini(%rip), %xmm2, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$13, %edx
	movl	$.LC21, %esi
	movq	%rax, %r13
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r13, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$16, %edx
	movl	$.LC22, %esi
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode
.LEHE0:
	leaq	-448(%rbp), %rdi
	call	_ZNKSt12__basic_fileIcE7is_openEv
	testb	%al, %al
	je	.L317
	xorl	%r14d, %r14d
	cmpq	$0, N(%rip)
	jle	.L319
	.p2align 4,,10
	.p2align 3
.L318:
	vxorpd	%xmm8, %xmm8, %xmm8
	xorl	%ebx, %ebx
	vcvtsi2sdl	%r14d, %xmm8, %xmm11
	vmovsd	%xmm11, -656(%rbp)
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L443:
	movsbl	67(%r13), %esi
.L322:
	movq	%r12, %rdi
.LEHB1:
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movq	N(%rip), %r8
	incq	%rbx
	cmpq	%rbx, %r8
	jle	.L441
.L323:
	vxorpd	%xmm10, %xmm10, %xmm10
	vmovsd	h(%rip), %xmm12
	leaq	-560(%rbp), %rdi
	vcvtsi2sdl	%ebx, %xmm10, %xmm14
	vmulsd	-656(%rbp), %xmm12, %xmm0
	vmulsd	%xmm12, %xmm14, %xmm4
	vmovq	%xmm4, %r13
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %edx
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovq	%r13, %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$1, %edx
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	NP(%rip), %r11
	movq	%r13, %rdi
	incq	%r11
	imulq	%r14, %r11
	addq	%rbx, %r11
	vmovsd	(%r15,%r11,8), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rdx
	movq	240(%r12,%rdx), %r13
	testq	%r13, %r13
	je	.L442
	cmpb	$0, 56(%r13)
	jne	.L443
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rdi
	movl	$10, %esi
	movq	48(%rdi), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L322
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L441:
	incq	%r14
	cmpq	%r14, %r8
	jg	.L318
.L319:
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
.LEHE1:
.L325:
	movq	%r15, %rdi
	call	free
	movq	-688(%rbp), %rdi
	call	free
	movq	-720(%rbp), %rdi
	call	free
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L316:
.LEHB2:
	call	MPI_Finalize
.LEHE2:
	movq	-848(%rbp), %rdi
	call	free
	movq	-856(%rbp), %rdi
	call	free
	leaq	-48(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
.L328:
	.cfi_restore_state
	xorl	%r11d, %r11d
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	jmp	.L294
.L288:
	addl	%edx, %r15d
	addl	%edx, %ebx
	jmp	.L289
.L440:
	movq	N(%rip), %r13
	leaq	1(%r13), %rdi
	imulq	%r13, %rdi
	salq	$3, %rdi
	call	malloc
	movslq	numProcs(%rip), %r14
	movq	%rax, %r15
	leaq	0(,%r14,4), %rdi
	movq	%r14, %r12
	movq	%rdi, -656(%rbp)
	call	malloc
	movq	-656(%rbp), %rdi
	movq	%rax, -688(%rbp)
	call	malloc
	movq	NP(%rip), %rcx
	movq	%rax, -720(%rbp)
	leaq	1(%rcx), %r11
	testl	%r14d, %r14d
	jle	.L302
	leaq	-2(%r13), %rax
	movl	resto(%rip), %esi
	cqto
	idivq	%r14
	movl	%eax, %r14d
	testl	%esi, %esi
	jle	.L303
	cmpl	%esi, %r12d
	movl	$1, %edx
	cmovle	%r12d, %esi
	testl	%esi, %esi
	movl	%esi, %r10d
	cmovg	%esi, %edx
	cmpl	$7, %esi
	jle	.L330
	movl	%edx, %r8d
	leal	2(%rax), %ebx
	vmovdqa	.LC12(%rip), %ymm0
	xorl	%esi, %esi
	leal	3(%rax), %r9d
	vmovd	%r11d, %xmm1
	shrl	$3, %r8d
	vmovd	%ebx, %xmm13
	salq	$5, %r8
	vmovd	%r9d, %xmm7
	vpbroadcastd	%xmm1, %ymm8
	vmovdqa	.LC5(%rip), %ymm11
	leaq	-32(%r8), %rdi
	vpbroadcastd	%xmm7, %ymm9
	vpbroadcastd	%xmm13, %ymm14
	movq	%r8, %r13
	shrq	$5, %rdi
	vpmulld	%ymm8, %ymm9, %ymm10
	vmovdqa	.LC18(%rip), %ymm12
	incq	%rdi
	andl	$7, %edi
	je	.L433
	cmpq	$1, %rdi
	je	.L391
	cmpq	$2, %rdi
	je	.L392
	cmpq	$3, %rdi
	je	.L393
	cmpq	$4, %rdi
	je	.L394
	cmpq	$5, %rdi
	je	.L395
	cmpq	$6, %rdi
	jne	.L444
.L396:
	vmovdqa	%ymm0, %ymm5
	movq	-688(%rbp), %rbx
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rdi
	vpmulld	%ymm5, %ymm14, %ymm4
	vmovdqu	%ymm10, (%rbx,%rsi)
	vpmulld	%ymm8, %ymm4, %ymm3
	vmovdqu	%ymm3, (%rdi,%rsi)
	addq	$32, %rsi
.L395:
	vmovdqa	%ymm0, %ymm1
	movq	-688(%rbp), %r8
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rbx
	vpmulld	%ymm1, %ymm14, %ymm7
	vmovdqu	%ymm10, (%r8,%rsi)
	vpmulld	%ymm8, %ymm7, %ymm9
	vmovdqu	%ymm9, (%rbx,%rsi)
	addq	$32, %rsi
.L394:
	vmovdqa	%ymm0, %ymm13
	movq	-688(%rbp), %rdi
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %r8
	vpmulld	%ymm13, %ymm14, %ymm15
	vmovdqu	%ymm10, (%rdi,%rsi)
	vpmulld	%ymm8, %ymm15, %ymm6
	vmovdqu	%ymm6, (%r8,%rsi)
	addq	$32, %rsi
.L393:
	vmovdqa	%ymm0, %ymm2
	movq	-688(%rbp), %rbx
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rdi
	vpmulld	%ymm2, %ymm14, %ymm5
	vmovdqu	%ymm10, (%rbx,%rsi)
	vpmulld	%ymm8, %ymm5, %ymm4
	vmovdqu	%ymm4, (%rdi,%rsi)
	addq	$32, %rsi
.L392:
	vmovdqa	%ymm0, %ymm3
	movq	-688(%rbp), %r8
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rbx
	vpmulld	%ymm3, %ymm14, %ymm1
	vmovdqu	%ymm10, (%r8,%rsi)
	vpmulld	%ymm8, %ymm1, %ymm7
	vmovdqu	%ymm7, (%rbx,%rsi)
	addq	$32, %rsi
.L391:
	vmovdqa	%ymm0, %ymm9
	movq	-688(%rbp), %rdi
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %r8
	vpmulld	%ymm9, %ymm14, %ymm13
	vpaddd	%ymm12, %ymm9, %ymm6
	vmovdqu	%ymm10, (%rdi,%rsi)
	vpmulld	%ymm8, %ymm13, %ymm15
	vmovdqu	%ymm15, (%r8,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %r13
	je	.L428
.L433:
	movq	-688(%rbp), %rdi
	movq	-720(%rbp), %rbx
.L305:
	vpaddd	%ymm11, %ymm0, %ymm2
	vpmulld	%ymm0, %ymm14, %ymm5
	vmovdqu	%ymm10, (%rdi,%rsi)
	vpaddd	%ymm11, %ymm2, %ymm1
	vpmulld	%ymm2, %ymm14, %ymm3
	vmovdqu	%ymm10, 32(%rdi,%rsi)
	vpmulld	%ymm1, %ymm14, %ymm0
	vpaddd	%ymm11, %ymm1, %ymm9
	vmovdqu	%ymm10, 64(%rdi,%rsi)
	vpmulld	%ymm9, %ymm14, %ymm6
	vpaddd	%ymm11, %ymm9, %ymm15
	vmovdqu	%ymm10, 96(%rdi,%rsi)
	vmovdqu	%ymm10, 128(%rdi,%rsi)
	vmovdqu	%ymm10, 160(%rdi,%rsi)
	vpmulld	%ymm8, %ymm5, %ymm4
	vpaddd	%ymm11, %ymm15, %ymm5
	vmovdqu	%ymm10, 192(%rdi,%rsi)
	vpmulld	%ymm8, %ymm3, %ymm7
	vpmulld	%ymm5, %ymm14, %ymm3
	vmovdqu	%ymm10, 224(%rdi,%rsi)
	vpmulld	%ymm8, %ymm0, %ymm13
	vpmulld	%ymm8, %ymm6, %ymm2
	vmovdqu	%ymm4, (%rbx,%rsi)
	vpmulld	%ymm15, %ymm14, %ymm4
	vmovdqu	%ymm7, 32(%rbx,%rsi)
	vpaddd	%ymm11, %ymm5, %ymm7
	vpmulld	%ymm8, %ymm3, %ymm9
	vmovdqu	%ymm13, 64(%rbx,%rsi)
	vpaddd	%ymm11, %ymm7, %ymm13
	vpmulld	%ymm7, %ymm14, %ymm0
	vpmulld	%ymm13, %ymm14, %ymm6
	vmovdqu	%ymm2, 96(%rbx,%rsi)
	vpmulld	%ymm8, %ymm4, %ymm1
	vmovdqu	%ymm9, 160(%rbx,%rsi)
	vpmulld	%ymm8, %ymm0, %ymm15
	vpaddd	%ymm11, %ymm13, %ymm0
	vpmulld	%ymm8, %ymm6, %ymm2
	vpaddd	%ymm12, %ymm13, %ymm6
	vmovdqu	%ymm1, 128(%rbx,%rsi)
	vmovdqu	%ymm15, 192(%rbx,%rsi)
	vmovdqu	%ymm2, 224(%rbx,%rsi)
	addq	$256, %rsi
	cmpq	%rsi, %r13
	jne	.L305
.L428:
	movl	%edx, %esi
	vextracti128	$0x1, %ymm6, %xmm8
	andl	$-8, %esi
	vpextrd	$3, %xmm8, %r8d
	movl	%esi, %ebx
	cmpl	%esi, %edx
	je	.L306
.L304:
	subl	%esi, %edx
	leal	2(%rax), %r13d
	leal	-1(%rdx), %r8d
	cmpl	$2, %r8d
	jbe	.L307
	vmovd	%r9d, %xmm12
	vmovd	%r11d, %xmm5
	vmovd	%ebx, %xmm10
	movq	-688(%rbp), %r13
	vpshufd	$0, %xmm5, %xmm4
	vpshufd	$0, %xmm12, %xmm14
	vpshufd	$0, %xmm10, %xmm11
	movq	-720(%rbp), %rdi
	vpmulld	%xmm4, %xmm14, %xmm1
	vpaddd	.LC8(%rip), %xmm11, %xmm7
	vpaddd	.LC19(%rip), %xmm11, %xmm15
	vpextrd	$3, %xmm15, %r8d
	vmovdqu	%xmm1, 0(%r13,%rsi,4)
	leal	2(%rax), %r13d
	vmovd	%r13d, %xmm3
	vpshufd	$0, %xmm3, %xmm9
	vpmulld	%xmm9, %xmm7, %xmm13
	vpmulld	%xmm4, %xmm13, %xmm0
	vmovdqu	%xmm0, (%rdi,%rsi,4)
	movl	%edx, %esi
	andl	$-4, %esi
	addl	%esi, %ebx
	cmpl	%esi, %edx
	je	.L306
.L307:
	movslq	%ebx, %r8
	imull	%r11d, %r9d
	movq	-688(%rbp), %rdi
	leaq	0(,%r8,4), %rdx
	movq	%rdx, -752(%rbp)
	movl	%ebx, %edx
	imull	%r13d, %edx
	movl	%r9d, -656(%rbp)
	movl	-656(%rbp), %esi
	movl	%esi, (%rdi,%r8,4)
	movq	-720(%rbp), %rsi
	movl	%edx, %r9d
	imull	%r11d, %r9d
	movl	%r9d, (%rsi,%r8,4)
	leal	1(%rbx), %r8d
	cmpl	%r8d, %r10d
	jle	.L306
	movl	-656(%rbp), %r8d
	movq	%rdi, %r9
	addl	%r13d, %edx
	movq	-752(%rbp), %rdi
	movl	%r8d, 4(%r9,%rdi)
	movl	%edx, %r8d
	imull	%r11d, %r8d
	movl	%r8d, 4(%rsi,%rdi)
	leal	2(%rbx), %r8d
	cmpl	%r8d, %r10d
	jle	.L306
	addl	%r13d, %edx
	movq	%rdi, %r10
	movl	-656(%rbp), %edi
	leal	3(%rbx), %r8d
	imull	%r11d, %edx
	movl	%edi, 8(%r9,%r10)
	movl	%edx, 8(%rsi,%r10)
.L306:
	movslq	%r8d, %rbx
	cmpl	%ebx, %r12d
	jle	.L438
.L303:
	movl	%r12d, %r13d
	movl	$1, %edi
	subl	%ebx, %r13d
	cmpl	%ebx, %r12d
	cmovg	%r13d, %edi
	decl	%r13d
	cmpl	$6, %r13d
	jbe	.L331
	cmpl	%ebx, %r12d
	jle	.L331
	movl	%edi, %r10d
	leal	2(%rax), %r13d
	vmovd	%r11d, %xmm8
	movslq	%ebx, %rsi
	shrl	$3, %r10d
	vmovd	%r13d, %xmm11
	leal	1(%r14), %r14d
	salq	$2, %rsi
	salq	$5, %r10
	movq	-688(%rbp), %rdx
	vmovd	%ebx, %xmm6
	vpbroadcastd	%xmm8, %ymm10
	leaq	-32(%r10), %r8
	vpbroadcastd	%xmm11, %ymm12
	vmovd	%r14d, %xmm5
	vmovdqa	.LC5(%rip), %ymm4
	shrq	$5, %r8
	leaq	(%rdx,%rsi), %r9
	vpbroadcastd	%xmm6, %ymm2
	xorl	%edx, %edx
	incq	%r8
	vpmulld	%ymm10, %ymm12, %ymm14
	vpaddd	.LC12(%rip), %ymm2, %ymm0
	addq	-720(%rbp), %rsi
	vpbroadcastd	%xmm5, %ymm1
	andl	$7, %r8d
	je	.L310
	cmpq	$1, %r8
	je	.L397
	cmpq	$2, %r8
	je	.L398
	cmpq	$3, %r8
	je	.L399
	cmpq	$4, %r8
	je	.L400
	cmpq	$5, %r8
	je	.L401
	cmpq	$6, %r8
	jne	.L445
.L402:
	vmovdqa	%ymm0, %ymm13
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm13, %ymm1, %ymm15
	vpmulld	%ymm10, %ymm15, %ymm6
	vmovdqu	%ymm6, (%rsi,%rdx)
	addq	$32, %rdx
.L401:
	vmovdqa	%ymm0, %ymm2
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm2, %ymm1, %ymm8
	vpmulld	%ymm10, %ymm8, %ymm11
	vmovdqu	%ymm11, (%rsi,%rdx)
	addq	$32, %rdx
.L400:
	vmovdqa	%ymm0, %ymm12
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm12, %ymm1, %ymm5
	vpmulld	%ymm10, %ymm5, %ymm7
	vmovdqu	%ymm7, (%rsi,%rdx)
	addq	$32, %rdx
.L399:
	vmovdqa	%ymm0, %ymm3
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm3, %ymm1, %ymm9
	vpmulld	%ymm10, %ymm9, %ymm13
	vmovdqu	%ymm13, (%rsi,%rdx)
	addq	$32, %rdx
.L398:
	vmovdqa	%ymm0, %ymm15
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm15, %ymm1, %ymm6
	vpmulld	%ymm10, %ymm6, %ymm2
	vmovdqu	%ymm2, (%rsi,%rdx)
	addq	$32, %rdx
.L397:
	vmovdqa	%ymm0, %ymm8
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm8, %ymm1, %ymm11
	vpmulld	%ymm10, %ymm11, %ymm12
	vmovdqu	%ymm12, (%rsi,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %r10
	je	.L427
.L310:
	vpaddd	%ymm4, %ymm0, %ymm5
	vpmulld	%ymm0, %ymm1, %ymm7
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm5, %ymm9
	vpmulld	%ymm5, %ymm1, %ymm13
	vmovdqu	%ymm14, 32(%r9,%rdx)
	vpaddd	%ymm4, %ymm9, %ymm6
	vpmulld	%ymm9, %ymm1, %ymm2
	vmovdqu	%ymm14, 64(%r9,%rdx)
	vpmulld	%ymm6, %ymm1, %ymm11
	vpaddd	%ymm4, %ymm6, %ymm0
	vmovdqu	%ymm14, 96(%r9,%rdx)
	vmovdqu	%ymm14, 128(%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm9
	vpmulld	%ymm10, %ymm7, %ymm3
	vmovdqu	%ymm14, 160(%r9,%rdx)
	vpmulld	%ymm10, %ymm13, %ymm15
	vpaddd	%ymm4, %ymm9, %ymm6
	vmovdqu	%ymm14, 192(%r9,%rdx)
	vpmulld	%ymm10, %ymm2, %ymm8
	vpmulld	%ymm0, %ymm1, %ymm7
	vmovdqu	%ymm14, 224(%r9,%rdx)
	vpaddd	%ymm4, %ymm6, %ymm0
	vpmulld	%ymm10, %ymm11, %ymm12
	vpmulld	%ymm5, %ymm1, %ymm13
	vpmulld	%ymm9, %ymm1, %ymm2
	vpmulld	%ymm6, %ymm1, %ymm11
	vmovdqu	%ymm3, (%rsi,%rdx)
	vmovdqu	%ymm15, 32(%rsi,%rdx)
	vmovdqu	%ymm8, 64(%rsi,%rdx)
	vpmulld	%ymm10, %ymm7, %ymm3
	vmovdqu	%ymm12, 96(%rsi,%rdx)
	vpmulld	%ymm10, %ymm13, %ymm15
	vpmulld	%ymm10, %ymm2, %ymm8
	vpmulld	%ymm10, %ymm11, %ymm12
	vmovdqu	%ymm3, 128(%rsi,%rdx)
	vmovdqu	%ymm15, 160(%rsi,%rdx)
	vmovdqu	%ymm8, 192(%rsi,%rdx)
	vmovdqu	%ymm12, 224(%rsi,%rdx)
	addq	$256, %rdx
	cmpq	%rdx, %r10
	jne	.L310
.L427:
	movl	%edi, %esi
	andl	$-8, %esi
	leal	(%rsi,%rbx), %edx
	cmpl	%esi, %edi
	je	.L438
.L309:
	subl	%esi, %edi
	leal	-1(%rdi), %r9d
	cmpl	$2, %r9d
	jbe	.L446
	vmovd	%edx, %xmm5
	incl	%eax
	vmovd	%r13d, %xmm10
	addq	%rsi, %rbx
	vpshufd	$0, %xmm5, %xmm7
	vmovd	%eax, %xmm9
	vmovd	%r11d, %xmm4
	movq	-688(%rbp), %r10
	vpshufd	$0, %xmm9, %xmm13
	vpshufd	$0, %xmm4, %xmm1
	vpaddd	.LC8(%rip), %xmm7, %xmm3
	movq	-720(%rbp), %r14
	vpshufd	$0, %xmm10, %xmm14
	vpmulld	%xmm13, %xmm3, %xmm15
	vpmulld	%xmm1, %xmm14, %xmm0
	vpmulld	%xmm1, %xmm15, %xmm6
	vmovdqu	%xmm0, (%r10,%rbx,4)
	vmovdqu	%xmm6, (%r14,%rbx,4)
	movl	%edi, %ebx
	andl	$-4, %ebx
	addl	%ebx, %edx
	cmpl	%ebx, %edi
	je	.L438
.L314:
	movl	%eax, %esi
	imull	%r11d, %r13d
	movq	-688(%rbp), %r8
	movslq	%edx, %r9
	imull	%edx, %esi
	movq	-720(%rbp), %r14
	leal	1(%rdx), %ebx
	leaq	0(,%r9,4), %rdi
	movl	%r13d, (%r8,%r9,4)
	movl	%esi, %r10d
	imull	%r11d, %r10d
	movl	%r10d, (%r14,%r9,4)
	cmpl	%ebx, %r12d
	jle	.L438
	addl	%eax, %esi
	addl	$2, %edx
	movl	%r13d, 4(%r8,%rdi)
	movl	%esi, %r9d
	imull	%r11d, %r9d
	movl	%r9d, 4(%r14,%rdi)
	cmpl	%edx, %r12d
	jle	.L438
	addl	%eax, %esi
	movl	%r13d, 8(%r8,%rdi)
	imull	%r11d, %esi
	movl	%esi, 8(%r14,%rdi)
	vzeroupper
	jmp	.L302
.L438:
	vzeroupper
	jmp	.L302
.L435:
	vzeroupper
	jmp	.L293
.L317:
	movl	$37, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cerr, %edi
.LEHB3:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$_ZSt4cerr, %edi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L325
.L444:
	vmovdqa	%ymm0, %ymm15
	movq	-688(%rbp), %rsi
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %r8
	vpmulld	%ymm15, %ymm14, %ymm6
	vmovdqu	%ymm10, (%rsi)
	movl	$32, %esi
	vpmulld	%ymm8, %ymm6, %ymm2
	vmovdqu	%ymm2, (%r8)
	jmp	.L396
.L445:
	vmovdqa	%ymm0, %ymm7
	vmovdqu	%ymm14, (%r9)
	vpaddd	%ymm4, %ymm0, %ymm0
	movl	$32, %edx
	vpmulld	%ymm7, %ymm1, %ymm3
	vpmulld	%ymm10, %ymm3, %ymm9
	vmovdqu	%ymm9, (%rsi)
	jmp	.L402
.L446:
	incl	%eax
	jmp	.L314
.L330:
	xorl	%esi, %esi
	leal	3(%rax), %r9d
	jmp	.L304
.L331:
	movl	%ebx, %edx
	xorl	%esi, %esi
	leal	2(%rax), %r13d
	jmp	.L309
.L442:
	call	_ZSt16__throw_bad_castv
.LEHE3:
.L335:
	movq	%rax, %r15
	jmp	.L326
	.section	.gcc_except_table
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
	.uleb128 .L335-.LFB3107
	.uleb128 0
	.uleb128 .LEHB2-.LFB3107
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3107
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L335-.LFB3107
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
.L326:
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
	movq	%r15, %rdi
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
	.uleb128 .LEHB4-.LCOLDB28
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC3107:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE28:
	.section	.text.startup
.LHOTE28:
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
	.globl	lock
	.bss
	.align 32
	.type	lock, @object
	.size	lock, 1120
lock:
	.zero	1120
	.globl	vizSul
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
	.globl	m
	.align 8
	.type	m, @object
	.size	m, 8
m:
	.zero	8
	.globl	NP
	.align 8
	.type	NP, @object
	.size	NP, 8
NP:
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
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.set	.LC2,.LC11+8
	.set	.LC3,.LC7
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.section	.rodata.cst32
	.align 32
.LC5:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC6:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC7:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.set	.LC8,.LC12
	.set	.LC9,.LC6
	.set	.LC10,.LC7
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC11:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst32
	.align 32
.LC12:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC13:
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.long	0
	.long	-1075838976
	.align 32
.LC14:
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.long	0
	.long	-1067909120
	.set	.LC15,.LC13
	.set	.LC16,.LC14
	.set	.LC17,.LC14
	.align 32
.LC18:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.set	.LC19,.LC0
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.4.1 20231218 (Red Hat 11.4.1-3)"
	.section	.note.GNU-stack,"",@progbits
