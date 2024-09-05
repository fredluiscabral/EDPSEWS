	.file	"EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp"
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
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB3808:
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
	je	.L10
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L5
	movsbl	67(%r12), %esi
.L6:
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
.L5:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r12), %rcx
	movl	$10, %esi
	movq	48(%rcx), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L6
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L6
.L10:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE3808:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB3802:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3802
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
	movq	%rdi, -296(%rbp)
	call	omp_get_thread_num
	movl	%eax, %ebx
	movl	%eax, -156(%rbp)
	call	omp_get_num_threads
	movl	%ebx, %esi
	movslq	%eax, %r12
	movl	%eax, -80(%rbp)
	movq	nN(%rip), %rax
	cqto
	idivq	%r12
	imull	%eax, %esi
	leal	1(%rsi), %ecx
	addl	%esi, %eax
	cmpl	%edx, %ebx
	jge	.L305
	addl	%ebx, %ecx
	leal	1(%rbx,%rax), %r8d
	movl	%ecx, -196(%rbp)
	movl	%r8d, -124(%rbp)
.L115:
	movl	-156(%rbp), %r9d
	testl	%r9d, %r9d
	jne	.L113
	movl	-80(%rbp), %r11d
	testl	%r11d, %r11d
	jle	.L113
	salq	$5, %r12
	xorl	%ebx, %ebx
	leaq	-32(%r12), %r14
	shrq	$5, %r14
	incq	%r14
	andl	$3, %r14d
	je	.L114
	cmpq	$1, %r14
	je	.L245
	cmpq	$2, %r14
	jne	.L306
.L246:
	leaq	semaphores_left(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	addq	$32, %rbx
.L245:
	leaq	semaphores_left(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	addq	$32, %rbx
	cmpq	%r12, %rbx
	je	.L113
.L114:
	leaq	semaphores_left(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_left+32(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right+32(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_left+64(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right+64(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_left+96(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	leaq	semaphores_right+96(%rbx), %rdi
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	sem_init
	subq	$-128, %rbx
	cmpq	%r12, %rbx
	jne	.L114
.L113:
	call	GOMP_barrier
	vmovsd	.LC1(%rip), %xmm6
	vmulsd	tempoFinal(%rip), %xmm6, %xmm0
	vcomisd	.LC2(%rip), %xmm0
	jbe	.L303
	movslq	-156(%rbp), %r10
	movl	-80(%rbp), %edx
	movq	%r15, %r14
	movl	$0, -200(%rbp)
	movslq	-196(%rbp), %rsi
	vmovapd	.LC7(%rip), %ymm15
	movq	%r13, %r15
	movq	%r10, %r12
	salq	$5, %r10
	decl	%edx
	leaq	semaphores_left(%r10), %rax
	movq	%rsi, -256(%rbp)
	negq	%rsi
	addq	$semaphores_right, %r10
	movq	%rax, -240(%rbp)
	leal	1(%r12), %eax
	salq	$3, %rsi
	cltq
	movq	%r10, -248(%rbp)
	salq	$5, %rax
	movl	%edx, -160(%rbp)
	addq	$semaphores_left, %rax
	movq	%rsi, -280(%rbp)
	movq	%rax, -288(%rbp)
	leal	-1(%r12), %eax
	cltq
	salq	$5, %rax
	addq	$semaphores_right, %rax
	movq	%rax, -272(%rbp)
	.p2align 4,,10
	.p2align 3
.L51:
	incl	-200(%rbp)
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	-200(%rbp), %r13d
	movl	-124(%rbp), %ecx
	vcvtsi2sdl	%r13d, %xmm1, %xmm2
	vmulsd	deltaT(%rip), %xmm2, %xmm3
	movl	-196(%rbp), %r13d
	vmovsd	%xmm3, -264(%rbp)
	cmpl	%ecx, %r13d
	jg	.L16
	movq	N(%rip), %r8
	movq	NP(%rip), %rdi
	movq	m(%rip), %r12
	leaq	-1(%r8), %r9
	leaq	1(%rdi), %r11
	movq	%r9, -112(%rbp)
	movq	%r12, -96(%rbp)
	movq	%r11, -152(%rbp)
	cmpq	$1, %r9
	jle	.L16
	movq	-256(%rbp), %r10
	leaq	-2(%r8), %rcx
	leaq	-3(%r8), %rsi
	movq	%r15, -104(%rbp)
	leaq	0(,%r11,8), %rbx
	movq	%rcx, -184(%rbp)
	imulq	%r10, %r11
	movq	%rbx, -176(%rbp)
	addq	%r10, %r12
	movq	%rsi, -168(%rbp)
	addq	%r11, %r9
	leaq	8(%r15,%r11,8), %rdx
	leaq	(%r15,%r9,8), %rax
	movq	%rcx, %r9
	andq	$-8, %rcx
	movq	%r11, %r15
	subq	%rcx, %r8
	movq	%rax, -120(%rbp)
	movl	%ecx, %edi
	movq	%r10, %rax
	imulq	%rbx, %rax
	movq	%r8, -208(%rbp)
	shrq	$3, %r9
	incl	%edi
	leaq	1(%rcx), %rbx
	leaq	-2(%r8), %r8
	movq	%r9, -88(%rbp)
	movq	%rcx, -192(%rbp)
	movl	%edi, -224(%rbp)
	addq	%r14, %rax
	movq	%rbx, -232(%rbp)
	movq	%r8, -216(%rbp)
	.p2align 4,,10
	.p2align 3
.L18:
	movq	-104(%rbp), %rcx
	movq	-152(%rbp), %r10
	leal	1(%r13), %r11d
	leal	-1(%r13), %esi
	movslq	%r11d, %rdi
	movq	-168(%rbp), %rbx
	movslq	%esi, %rsi
	movl	%r11d, -128(%rbp)
	subq	%r14, %rcx
	imulq	%r10, %rdi
	imulq	%r10, %rsi
	cmpq	$64, %rcx
	seta	%cl
	cmpq	$2, %rbx
	seta	%r11b
	leaq	16(,%rdi,8), %r9
	andl	%r11d, %ecx
	cmpq	$alfa, -120(%rbp)
	leaq	16(,%rsi,8), %r8
	setbe	%r10b
	cmpq	$alfa+8, %rdx
	setnb	%r11b
	orl	%r11d, %r10d
	andl	%ecx, %r10d
	cmpq	$beta_coef, -120(%rbp)
	setbe	%cl
	cmpq	$beta_coef+8, %rdx
	setnb	%r11b
	orl	%r11d, %ecx
	leaq	(%r14,%r8), %r11
	andl	%r10d, %ecx
	movq	%rdx, %r10
	subq	%r11, %r10
	cmpq	$48, %r10
	seta	%r11b
	testb	%r11b, %cl
	je	.L96
	leaq	(%r14,%r9), %r10
	movq	%rdx, %rcx
	subq	%r10, %rcx
	cmpq	$48, %rcx
	jbe	.L96
	cmpq	$6, %rbx
	jbe	.L97
	vmovd	%r13d, %xmm7
	leaq	-8(%r14,%r9), %r11
	leaq	-8(%r14,%r8), %r10
	xorl	%ecx, %ecx
	vpbroadcastd	%xmm7, %ymm4
	leaq	8(%rax), %rbx
	leaq	16(%rax), %r9
	xorl	%r8d, %r8d
	vpbroadcastq	-96(%rbp), %ymm12
	vmovdqa	.LC0(%rip), %ymm8
	vpxor	%xmm9, %xmm9, %xmm9
	vmovdqa	%ymm4, -80(%rbp)
	vbroadcastsd	alfa(%rip), %ymm11
	vbroadcastsd	beta_coef(%rip), %ymm10
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L98:
	vptest	%ymm0, %ymm0
	jne	.L307
.L99:
	incq	%r8
	addq	$64, %rcx
	cmpq	-88(%rbp), %r8
	je	.L308
.L100:
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
	vmaskmovpd	(%r11,%rcx), %ymm1, %ymm13
	vmaskmovpd	(%r10,%rcx), %ymm1, %ymm3
	vaddpd	%ymm3, %ymm13, %ymm3
	vpcmpeqq	%ymm9, %ymm4, %ymm0
	vmaskmovpd	(%rax,%rcx), %ymm1, %ymm13
	vmaskmovpd	32(%r11,%rcx), %ymm0, %ymm14
	vmaskmovpd	32(%r10,%rcx), %ymm0, %ymm5
	vmaskmovpd	32(%rax,%rcx), %ymm0, %ymm4
	vaddpd	%ymm5, %ymm14, %ymm2
	vmaskmovpd	(%r9,%rcx), %ymm1, %ymm5
	vmaskmovpd	32(%r9,%rcx), %ymm0, %ymm14
	vaddpd	%ymm13, %ymm5, %ymm5
	vaddpd	%ymm4, %ymm14, %ymm14
	vmaskmovpd	(%rbx,%rcx), %ymm1, %ymm7
	vmaskmovpd	32(%rbx,%rcx), %ymm0, %ymm6
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
	je	.L98
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%rdx,%rcx)
	je	.L99
	.p2align 4,,10
	.p2align 3
.L307:
	vmaskmovpd	%ymm6, %ymm0, 32(%rdx,%rcx)
	incq	%r8
	addq	$64, %rcx
	cmpq	-88(%rbp), %r8
	jne	.L100
.L308:
	movq	-192(%rbp), %r9
	movq	-184(%rbp), %rbx
	cmpq	%rbx, %r9
	je	.L112
	movq	-208(%rbp), %r10
	movq	-216(%rbp), %r11
	leaq	-3(%r10), %rcx
	movq	%r11, -136(%rbp)
	cmpq	$2, %rcx
	jbe	.L123
	movq	-232(%rbp), %rbx
	movl	-224(%rbp), %r11d
	movq	%rbx, -144(%rbp)
	movl	%r11d, -80(%rbp)
.L121:
	vbroadcastss	-80(%rbp), %xmm11
	vmovd	%r13d, %xmm9
	leaq	1(%r15,%r9), %rcx
	vpaddd	.LC8(%rip), %xmm11, %xmm10
	vpshufd	$0, %xmm9, %xmm8
	salq	$3, %rcx
	leaq	1(%r9,%rdi), %r10
	vmovddup	-96(%rbp), %xmm12
	vpaddd	%xmm8, %xmm10, %xmm0
	leaq	1(%r9,%rsi), %r9
	vpxor	%xmm3, %xmm3, %xmm3
	vmovddup	beta_coef(%rip), %xmm5
	vpsrldq	$8, %xmm0, %xmm4
	vpmovsxdq	%xmm0, %xmm1
	leaq	(%r14,%r10,8), %r11
	vmovddup	alfa(%rip), %xmm14
	vpmovsxdq	%xmm4, %xmm7
	vpaddq	%xmm12, %xmm1, %xmm2
	leaq	(%r14,%r9,8), %r10
	movq	-104(%rbp), %r9
	vpand	.LC9(%rip), %xmm2, %xmm13
	vpaddq	%xmm12, %xmm7, %xmm6
	vpand	.LC9(%rip), %xmm6, %xmm12
	leaq	8(%r14,%rcx), %r8
	leaq	(%r14,%rcx), %rbx
	addq	%rcx, %r9
	vpcmpeqq	%xmm3, %xmm13, %xmm1
	vpcmpeqq	%xmm3, %xmm12, %xmm0
	vmaskmovpd	(%rbx), %xmm1, %xmm9
	vmaskmovpd	16(%rbx), %xmm0, %xmm8
	vmaskmovpd	(%r11), %xmm1, %xmm11
	vmaskmovpd	(%r10), %xmm1, %xmm13
	vmaskmovpd	(%r8), %xmm1, %xmm7
	vaddpd	%xmm13, %xmm11, %xmm3
	vmaskmovpd	16(%r11), %xmm0, %xmm10
	vmaskmovpd	16(%r10), %xmm0, %xmm2
	vaddpd	%xmm2, %xmm10, %xmm12
	vmaskmovpd	16(%r8), %xmm0, %xmm4
	vmaskmovpd	-8(%r14,%rcx), %xmm1, %xmm6
	vmaskmovpd	(%r8), %xmm0, %xmm11
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
	jne	.L309
.L103:
	vptest	%xmm0, %xmm0
	jne	.L310
.L104:
	movq	-136(%rbp), %rbx
	movl	-80(%rbp), %r8d
	movq	-144(%rbp), %r9
	movq	%rbx, %rcx
	andq	$-4, %rcx
	addl	%ecx, %r8d
	addq	%rcx, %r9
	cmpq	%rcx, %rbx
	je	.L112
.L102:
	movq	-96(%rbp), %r10
	leal	0(%r13,%r8), %r11d
	addq	%r10, %r11
	andl	$1, %r11d
	jne	.L106
	leaq	(%r15,%r9), %rcx
	leaq	(%rsi,%r9), %rbx
	addq	%rdi, %r9
	vmovsd	.LC3(%rip), %xmm12
	vmovsd	(%r14,%rbx,8), %xmm1
	vmovsd	-8(%r14,%rcx,8), %xmm3
	vaddsd	(%r14,%r9,8), %xmm1, %xmm0
	vaddsd	8(%r14,%rcx,8), %xmm3, %xmm7
	vmovsd	(%r14,%rcx,8), %xmm8
	movq	-104(%rbp), %r9
	vfnmadd231sd	%xmm12, %xmm8, %xmm0
	vfnmadd132sd	%xmm8, %xmm7, %xmm12
	vmulsd	beta_coef(%rip), %xmm12, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm6
	vmovsd	%xmm6, (%r9,%rcx,8)
.L106:
	leal	1(%r8), %r11d
	movslq	%r11d, %rcx
	cmpq	%rcx, -112(%rbp)
	jle	.L112
	movq	-96(%rbp), %r10
	addl	%r13d, %r11d
	addq	%r10, %r11
	andl	$1, %r11d
	jne	.L107
	leaq	(%r15,%rcx), %r9
	leaq	(%rsi,%rcx), %rbx
	addq	%rdi, %rcx
	movq	-104(%rbp), %r11
	vmovsd	(%r14,%rbx,8), %xmm10
	vmovsd	-8(%r14,%r9,8), %xmm5
	vaddsd	(%r14,%rcx,8), %xmm10, %xmm13
	vaddsd	8(%r14,%r9,8), %xmm5, %xmm14
	vmovsd	(%r14,%r9,8), %xmm11
	vmovsd	.LC3(%rip), %xmm2
	vfnmadd231sd	%xmm2, %xmm11, %xmm13
	vfnmadd132sd	%xmm11, %xmm14, %xmm2
	vmulsd	beta_coef(%rip), %xmm2, %xmm9
	vfmadd132sd	alfa(%rip), %xmm9, %xmm13
	vaddsd	%xmm11, %xmm13, %xmm8
	vmovsd	%xmm8, (%r11,%r9,8)
.L107:
	addl	$2, %r8d
	movslq	%r8d, %rcx
	cmpq	%rcx, -112(%rbp)
	jle	.L112
	addl	%r13d, %r8d
	movq	-96(%rbp), %r13
	addq	%r13, %r8
	andl	$1, %r8d
	jne	.L112
	leaq	(%r15,%rcx), %r8
	addq	%rcx, %rdi
	addq	%rsi, %rcx
	vmovsd	.LC3(%rip), %xmm7
	vmovsd	(%r14,%rdi,8), %xmm1
	vmovsd	8(%r14,%r8,8), %xmm3
	vaddsd	(%r14,%rcx,8), %xmm1, %xmm0
	vaddsd	-8(%r14,%r8,8), %xmm3, %xmm4
	vmovsd	(%r14,%r8,8), %xmm12
	movq	-104(%rbp), %rdi
	vfnmadd231sd	%xmm7, %xmm12, %xmm0
	vfnmadd132sd	%xmm12, %xmm4, %xmm7
	vmulsd	beta_coef(%rip), %xmm7, %xmm6
	vfmadd132sd	alfa(%rip), %xmm6, %xmm0
	vaddsd	%xmm0, %xmm12, %xmm11
	vmovsd	%xmm11, (%rdi,%r8,8)
.L112:
	movq	-176(%rbp), %rsi
	movl	-128(%rbp), %r13d
	incq	%r12
	addq	%rsi, -120(%rbp)
	addq	-152(%rbp), %r15
	addq	%rsi, %rdx
	addq	%rsi, %rax
	cmpl	%r13d, -124(%rbp)
	jge	.L18
	movq	-104(%rbp), %r15
.L16:
	movq	-240(%rbp), %rdi
	vzeroupper
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movl	-156(%rbp), %r12d
	testl	%r12d, %r12d
	jg	.L311
	movl	-160(%rbp), %edx
	cmpl	%edx, -156(%rbp)
	jl	.L312
	movl	-156(%rbp), %eax
	testl	%eax, %eax
	jne	.L21
.L23:
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L94
	movq	NP(%rip), %rbx
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%rbx), %esi
	leaq	8(%r15,%rbx,8), %rdi
	call	MPI_Send
	movl	$1275070475, %edx
	xorl	%r8d, %r8d
	movq	%r15, %rdi
	movl	NP(%rip), %ecx
	subq	$8, %rsp
	movq	-296(%rbp), %r10
	movl	$1140850688, %r9d
	pushq	(%r10)
	leal	1(%rcx), %esi
	movl	vizNorte(%rip), %ecx
	call	MPI_Recv
	popq	%rdx
	popq	%rcx
.L94:
	movl	-160(%rbp), %r8d
	testl	%r8d, %r8d
	je	.L95
.L24:
	movl	-124(%rbp), %esi
	cmpl	%esi, -196(%rbp)
	jg	.L93
.L92:
	movq	NP(%rip), %rbx
	movq	N(%rip), %r10
	movq	m(%rip), %r8
	leaq	1(%rbx), %r13
	cmpq	$2, %r10
	jle	.L93
	leaq	-1(%r8,%r10), %r9
	movl	-124(%rbp), %esi
	negq	%r8
	movq	%r13, %rbx
	movq	-256(%rbp), %rdi
	leaq	0(,%r13,8), %rcx
	movq	%r14, -104(%rbp)
	leaq	-8(%rcx), %r12
	incl	%esi
	movq	-280(%rbp), %rdx
	vmovsd	.LC3(%rip), %xmm2
	imulq	%rdi, %rcx
	movl	%esi, -88(%rbp)
	vmovsd	.LC4(%rip), %xmm1
	addq	%rdi, %r9
	imulq	%rdi, %rbx
	leaq	(%rdx,%r8,8), %rax
	movq	%r12, -96(%rbp)
	movl	-196(%rbp), %r12d
	movq	%r15, -80(%rbp)
	addq	%rcx, %rax
	leaq	(%r14,%rax), %r11
	movl	$2, %eax
	subq	%r10, %rax
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L26:
	leal	1(%r12), %r14d
	decl	%r12d
	movq	-80(%rbp), %r8
	movq	%r15, %rcx
	movslq	%r14d, %rdi
	movslq	%r12d, %r12
	leaq	(%r15,%r9), %rdx
	negq	%rcx
	imulq	%r13, %rdi
	leaq	(%r8,%rbx,8), %rsi
	imulq	%r13, %r12
	subq	%rbx, %rdi
	subq	%rbx, %r12
	andl	$3, %ecx
	je	.L89
	cmpq	$1, %rcx
	je	.L241
	cmpq	$2, %rcx
	je	.L242
	movq	%rdx, %rax
	shrq	$63, %rax
	leaq	(%rdx,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L198
	vmovsd	(%rsi), %xmm12
	vaddsd	16(%rsi), %xmm12, %xmm0
	vmovsd	beta_coef(%rip), %xmm14
	vmovsd	alfa(%rip), %xmm15
	vmovsd	8(%rsi,%r12,8), %xmm9
	vaddsd	8(%rsi,%rdi,8), %xmm9, %xmm8
	vmulsd	%xmm14, %xmm0, %xmm7
	vaddsd	%xmm15, %xmm14, %xmm3
	vfmadd132sd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	%xmm15, %xmm7, %xmm8
	vaddsd	(%r11,%rdx,8), %xmm8, %xmm4
	vdivsd	%xmm3, %xmm4, %xmm6
	vmovsd	%xmm6, 8(%rsi)
.L198:
	incq	%rdx
	addq	$8, %rsi
.L242:
	movq	%rdx, %r8
	shrq	$63, %r8
	leaq	(%rdx,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L201
	vmovsd	(%rsi), %xmm15
	vaddsd	16(%rsi), %xmm15, %xmm14
	vmovsd	beta_coef(%rip), %xmm10
	vmovsd	alfa(%rip), %xmm11
	vmovsd	8(%rsi,%r12,8), %xmm13
	vaddsd	8(%rsi,%rdi,8), %xmm13, %xmm5
	vmulsd	%xmm10, %xmm14, %xmm9
	vaddsd	%xmm11, %xmm10, %xmm12
	vfmadd132sd	%xmm2, %xmm1, %xmm12
	vfmadd132sd	%xmm11, %xmm9, %xmm5
	vaddsd	(%r11,%rdx,8), %xmm5, %xmm8
	vdivsd	%xmm12, %xmm8, %xmm0
	vmovsd	%xmm0, 8(%rsi)
.L201:
	incq	%rdx
	addq	$8, %rsi
.L241:
	movq	%rdx, %rax
	shrq	$63, %rax
	leaq	(%rdx,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L204
	vmovsd	(%rsi), %xmm11
	vaddsd	16(%rsi), %xmm11, %xmm10
	vmovsd	beta_coef(%rip), %xmm3
	vmovsd	alfa(%rip), %xmm7
	vmovsd	8(%rsi,%r12,8), %xmm4
	vaddsd	8(%rsi,%rdi,8), %xmm4, %xmm6
	vmulsd	%xmm3, %xmm10, %xmm13
	vaddsd	%xmm7, %xmm3, %xmm15
	vfmadd132sd	%xmm2, %xmm1, %xmm15
	vfmadd132sd	%xmm7, %xmm13, %xmm6
	vaddsd	(%r11,%rdx,8), %xmm6, %xmm5
	vdivsd	%xmm15, %xmm5, %xmm14
	vmovsd	%xmm14, 8(%rsi)
.L204:
	incq	%rdx
	addq	$8, %rsi
	cmpq	%rdx, %r9
	je	.L292
.L89:
	movq	%rdx, %r8
	shrq	$63, %r8
	leaq	(%rdx,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L88
	vmovsd	(%rsi), %xmm7
	vaddsd	16(%rsi), %xmm7, %xmm3
	vmovsd	beta_coef(%rip), %xmm8
	vmovsd	alfa(%rip), %xmm9
	vmovsd	8(%rsi,%r12,8), %xmm12
	vaddsd	8(%rsi,%rdi,8), %xmm12, %xmm0
	vmulsd	%xmm8, %xmm3, %xmm4
	vaddsd	%xmm9, %xmm8, %xmm11
	vfmadd132sd	%xmm2, %xmm1, %xmm11
	vfmadd132sd	%xmm9, %xmm4, %xmm0
	vaddsd	(%r11,%rdx,8), %xmm0, %xmm6
	vdivsd	%xmm11, %xmm6, %xmm10
	vmovsd	%xmm10, 8(%rsi)
.L88:
	incq	%rdx
	leaq	8(%rsi), %rax
	movq	%rdx, %r10
	shrq	$63, %r10
	leaq	(%rdx,%r10), %r8
	andl	$1, %r8d
	subq	%r10, %r8
	cmpq	$1, %r8
	jne	.L207
	vmovsd	8(%rsi), %xmm9
	vaddsd	16(%rax), %xmm9, %xmm8
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm13
	vmovsd	8(%rax,%r12,8), %xmm15
	vaddsd	8(%rax,%rdi,8), %xmm15, %xmm14
	vmulsd	%xmm5, %xmm8, %xmm12
	vaddsd	%xmm13, %xmm5, %xmm7
	vfmadd132sd	%xmm2, %xmm1, %xmm7
	vfmadd132sd	%xmm13, %xmm12, %xmm14
	vaddsd	(%r11,%rdx,8), %xmm14, %xmm0
	vdivsd	%xmm7, %xmm0, %xmm3
	vmovsd	%xmm3, 8(%rax)
.L207:
	leaq	1(%rdx), %rcx
	movq	%rcx, %r10
	shrq	$63, %r10
	leaq	(%rcx,%r10), %rsi
	andl	$1, %esi
	subq	%r10, %rsi
	cmpq	$1, %rsi
	jne	.L209
	vmovsd	8(%rax), %xmm13
	vaddsd	24(%rax), %xmm13, %xmm5
	vmovsd	beta_coef(%rip), %xmm11
	vmovsd	alfa(%rip), %xmm6
	vmovsd	16(%rax,%r12,8), %xmm4
	vaddsd	16(%rax,%rdi,8), %xmm4, %xmm10
	vmulsd	%xmm11, %xmm5, %xmm15
	vaddsd	%xmm6, %xmm11, %xmm9
	vfmadd132sd	%xmm2, %xmm1, %xmm9
	vfmadd132sd	%xmm6, %xmm15, %xmm10
	vaddsd	(%r11,%rcx,8), %xmm10, %xmm14
	vdivsd	%xmm9, %xmm14, %xmm8
	vmovsd	%xmm8, 16(%rax)
.L209:
	leaq	2(%rdx), %r8
	movq	%r8, %rcx
	shrq	$63, %rcx
	leaq	(%r8,%rcx), %r10
	andl	$1, %r10d
	subq	%rcx, %r10
	cmpq	$1, %r10
	jne	.L211
	vmovsd	16(%rax), %xmm6
	vaddsd	32(%rax), %xmm6, %xmm11
	vmovsd	beta_coef(%rip), %xmm7
	vmovsd	alfa(%rip), %xmm12
	vmovsd	24(%rax,%r12,8), %xmm0
	vaddsd	24(%rax,%rdi,8), %xmm0, %xmm3
	vmulsd	%xmm7, %xmm11, %xmm4
	vaddsd	%xmm12, %xmm7, %xmm13
	vfmadd132sd	%xmm2, %xmm1, %xmm13
	vfmadd132sd	%xmm12, %xmm4, %xmm3
	vaddsd	(%r11,%r8,8), %xmm3, %xmm10
	vdivsd	%xmm13, %xmm10, %xmm5
	vmovsd	%xmm5, 24(%rax)
.L211:
	addq	$3, %rdx
	leaq	24(%rax), %rsi
	cmpq	%rdx, %r9
	jne	.L89
.L292:
	movl	%r14d, %r12d
	incq	%r9
	addq	%r13, %rbx
	addq	-96(%rbp), %r11
	cmpl	%r14d, -88(%rbp)
	jne	.L26
	movq	-80(%rbp), %r15
	movq	-104(%rbp), %r14
.L93:
	movq	-240(%rbp), %rdi
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movl	-156(%rbp), %ebx
	vmovapd	.LC7(%rip), %ymm15
	testl	%ebx, %ebx
	jg	.L313
	movl	-160(%rbp), %edi
	cmpl	%edi, -156(%rbp)
	jl	.L314
	movl	-156(%rbp), %edx
	testl	%edx, %edx
	jne	.L33
.L31:
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L86
	movq	NP(%rip), %r8
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	leal	1(%r8), %esi
	leaq	8(%r15,%r8,8), %rdi
	xorl	%r8d, %r8d
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	movq	-296(%rbp), %r10
	movl	NP(%rip), %ecx
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	movq	%r15, %rdi
	pushq	(%r10)
	movl	$1140850688, %r9d
	leal	1(%rcx), %esi
	movl	vizNorte(%rip), %ecx
	call	MPI_Recv
	vmovapd	.LC7(%rip), %ymm15
	popq	%r9
	popq	%r10
.L86:
	movl	-160(%rbp), %esi
	testl	%esi, %esi
	je	.L87
.L32:
	movl	-124(%rbp), %edi
	cmpl	%edi, -196(%rbp)
	jg	.L85
.L84:
	movq	N(%rip), %r8
	movq	NP(%rip), %rsi
	movq	m(%rip), %r10
	leaq	-1(%r8), %rcx
	leaq	1(%rsi), %r12
	movq	%rcx, -112(%rbp)
	movq	%r10, -96(%rbp)
	movq	%r12, -152(%rbp)
	cmpq	$1, %rcx
	jle	.L85
	movq	-256(%rbp), %r11
	leaq	-2(%r8), %rdi
	leaq	-3(%r8), %rbx
	movq	%r14, -104(%rbp)
	leaq	0(,%r12,8), %r9
	movq	%rdi, -184(%rbp)
	imulq	%r11, %r12
	movq	%r9, %rax
	addq	%r11, %r10
	movq	%r9, -176(%rbp)
	imulq	%r11, %rax
	movq	%rbx, -168(%rbp)
	addq	%r12, %rcx
	leaq	8(%r14,%r12,8), %rdx
	leaq	(%r14,%rcx,8), %r13
	movq	%rdi, %rcx
	andq	$-8, %rdi
	addq	%r15, %rax
	subq	%rdi, %r8
	movl	%edi, %esi
	shrq	$3, %rcx
	leaq	1(%rdi), %r9
	movq	%r8, -208(%rbp)
	incl	%esi
	leaq	-2(%r8), %r8
	movq	%r10, %r14
	movq	%rcx, -88(%rbp)
	movq	%rdi, -192(%rbp)
	movl	%esi, -232(%rbp)
	movq	%r9, -224(%rbp)
	movq	%r8, -216(%rbp)
	movq	%r13, -120(%rbp)
	movl	-196(%rbp), %r13d
	.p2align 4,,10
	.p2align 3
.L35:
	movq	-104(%rbp), %rcx
	movq	-152(%rbp), %r11
	leal	1(%r13), %r10d
	leal	-1(%r13), %ebx
	movslq	%r10d, %rdi
	movslq	%ebx, %rsi
	movq	-168(%rbp), %rbx
	movl	%r10d, -128(%rbp)
	subq	%r15, %rcx
	imulq	%r11, %rdi
	imulq	%r11, %rsi
	cmpq	$64, %rcx
	seta	%cl
	cmpq	$2, %rbx
	seta	%r10b
	leaq	16(,%rdi,8), %r9
	andl	%r10d, %ecx
	cmpq	$alfa, -120(%rbp)
	leaq	16(,%rsi,8), %r8
	setbe	%r10b
	cmpq	$alfa+8, %rdx
	setnb	%r11b
	orl	%r11d, %r10d
	andl	%ecx, %r10d
	cmpq	$beta_coef, -120(%rbp)
	setbe	%cl
	cmpq	$beta_coef+8, %rdx
	setnb	%r11b
	orl	%r11d, %ecx
	leaq	(%r15,%r8), %r11
	andl	%r10d, %ecx
	movq	%rdx, %r10
	subq	%r11, %r10
	cmpq	$48, %r10
	seta	%r11b
	testb	%r11b, %cl
	je	.L65
	leaq	(%r15,%r9), %r10
	movq	%rdx, %rcx
	subq	%r10, %rcx
	cmpq	$48, %rcx
	jbe	.L65
	cmpq	$6, %rbx
	jbe	.L66
	vmovd	%r13d, %xmm14
	leaq	-8(%r15,%r9), %r11
	leaq	-8(%r15,%r8), %r10
	xorl	%ecx, %ecx
	vpbroadcastd	%xmm14, %ymm9
	leaq	8(%rax), %rbx
	leaq	16(%rax), %r9
	xorl	%r8d, %r8d
	vmovdqa	%ymm9, -80(%rbp)
	vpbroadcastq	-96(%rbp), %ymm12
	vbroadcastsd	alfa(%rip), %ymm11
	vpxor	%xmm9, %xmm9, %xmm9
	vbroadcastsd	beta_coef(%rip), %ymm10
	vmovdqa	.LC0(%rip), %ymm8
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L67:
	vptest	%ymm0, %ymm0
	jne	.L315
.L68:
	incq	%r8
	addq	$64, %rcx
	cmpq	-88(%rbp), %r8
	je	.L316
.L69:
	vmovdqa	%ymm8, %ymm7
	vpaddd	-80(%rbp), %ymm7, %ymm0
	vpaddd	.LC5(%rip), %ymm8, %ymm8
	vextracti128	$0x1, %ymm0, %xmm13
	vpmovsxdq	%xmm0, %ymm3
	vpmovsxdq	%xmm13, %ymm5
	vpaddq	%ymm12, %ymm3, %ymm6
	vpand	.LC6(%rip), %ymm6, %ymm4
	vpaddq	%ymm12, %ymm5, %ymm2
	vpand	.LC6(%rip), %ymm2, %ymm14
	vpcmpeqq	%ymm9, %ymm4, %ymm1
	vmaskmovpd	(%r11,%rcx), %ymm1, %ymm4
	vmaskmovpd	(%r10,%rcx), %ymm1, %ymm3
	vaddpd	%ymm4, %ymm3, %ymm3
	vpcmpeqq	%ymm9, %ymm14, %ymm0
	vmaskmovpd	32(%r11,%rcx), %ymm0, %ymm13
	vmaskmovpd	32(%r10,%rcx), %ymm0, %ymm5
	vaddpd	%ymm13, %ymm5, %ymm2
	vmaskmovpd	32(%rax,%rcx), %ymm0, %ymm14
	vmaskmovpd	(%rax,%rcx), %ymm1, %ymm5
	vmaskmovpd	(%r9,%rcx), %ymm1, %ymm13
	vaddpd	%ymm13, %ymm5, %ymm13
	vmaskmovpd	32(%r9,%rcx), %ymm0, %ymm4
	vaddpd	%ymm4, %ymm14, %ymm4
	vmaskmovpd	(%rbx,%rcx), %ymm1, %ymm7
	vmaskmovpd	32(%rbx,%rcx), %ymm0, %ymm6
	vfnmadd231pd	%ymm15, %ymm7, %ymm3
	vfnmadd231pd	%ymm15, %ymm6, %ymm2
	vfnmadd231pd	%ymm15, %ymm7, %ymm13
	vptest	%ymm1, %ymm1
	vfnmadd231pd	%ymm15, %ymm6, %ymm4
	vmulpd	%ymm13, %ymm10, %ymm5
	vmulpd	%ymm4, %ymm10, %ymm14
	vfmadd132pd	%ymm11, %ymm5, %ymm3
	vfmadd132pd	%ymm11, %ymm14, %ymm2
	vaddpd	%ymm7, %ymm3, %ymm7
	vaddpd	%ymm6, %ymm2, %ymm6
	je	.L67
	vptest	%ymm0, %ymm0
	vmaskmovpd	%ymm7, %ymm1, (%rdx,%rcx)
	je	.L68
	.p2align 4,,10
	.p2align 3
.L315:
	vmaskmovpd	%ymm6, %ymm0, 32(%rdx,%rcx)
	incq	%r8
	addq	$64, %rcx
	cmpq	-88(%rbp), %r8
	jne	.L69
.L316:
	movq	-192(%rbp), %r9
	movq	-184(%rbp), %rbx
	cmpq	%rbx, %r9
	je	.L81
	movq	-208(%rbp), %r10
	movq	-216(%rbp), %r11
	leaq	-3(%r10), %rcx
	movq	%r11, -136(%rbp)
	cmpq	$2, %rcx
	jbe	.L122
	movl	-232(%rbp), %ebx
	movq	-224(%rbp), %r11
	movl	%ebx, -80(%rbp)
	movq	%r11, -144(%rbp)
.L119:
	vbroadcastss	-80(%rbp), %xmm11
	vmovd	%r13d, %xmm9
	leaq	1(%r9,%r12), %rcx
	vpaddd	.LC8(%rip), %xmm11, %xmm10
	vpshufd	$0, %xmm9, %xmm8
	salq	$3, %rcx
	leaq	1(%r9,%rdi), %r10
	vmovddup	-96(%rbp), %xmm12
	vpaddd	%xmm8, %xmm10, %xmm0
	leaq	1(%r9,%rsi), %r9
	vpxor	%xmm3, %xmm3, %xmm3
	vmovddup	beta_coef(%rip), %xmm13
	vpsrldq	$8, %xmm0, %xmm5
	vpmovsxdq	%xmm0, %xmm1
	leaq	(%r15,%r10,8), %r11
	vmovddup	alfa(%rip), %xmm4
	vpmovsxdq	%xmm5, %xmm7
	vpaddq	%xmm12, %xmm1, %xmm2
	leaq	(%r15,%r9,8), %r10
	movq	-104(%rbp), %r9
	vpand	.LC9(%rip), %xmm2, %xmm14
	vpaddq	%xmm12, %xmm7, %xmm6
	vpand	.LC9(%rip), %xmm6, %xmm12
	leaq	8(%r15,%rcx), %r8
	leaq	(%r15,%rcx), %rbx
	addq	%rcx, %r9
	vpcmpeqq	%xmm3, %xmm14, %xmm1
	vpcmpeqq	%xmm3, %xmm12, %xmm0
	vmaskmovpd	(%rbx), %xmm1, %xmm9
	vmaskmovpd	16(%rbx), %xmm0, %xmm8
	vmaskmovpd	(%r11), %xmm1, %xmm11
	vmaskmovpd	(%r10), %xmm1, %xmm2
	vmaskmovpd	(%r8), %xmm1, %xmm5
	vaddpd	%xmm11, %xmm2, %xmm12
	vmaskmovpd	16(%r11), %xmm0, %xmm10
	vmaskmovpd	16(%r10), %xmm0, %xmm14
	vmaskmovpd	16(%r8), %xmm0, %xmm11
	vaddpd	%xmm10, %xmm14, %xmm6
	vmaskmovpd	-8(%r15,%rcx), %xmm1, %xmm7
	vmaskmovpd	(%r8), %xmm0, %xmm3
	vaddpd	%xmm5, %xmm7, %xmm2
	vaddpd	%xmm11, %xmm3, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm2
	vptest	%xmm1, %xmm1
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm10
	vfnmadd231pd	.LC10(%rip), %xmm9, %xmm12
	vfnmadd231pd	.LC10(%rip), %xmm8, %xmm6
	vmulpd	%xmm10, %xmm13, %xmm14
	vmulpd	%xmm2, %xmm13, %xmm13
	vfmadd132pd	%xmm4, %xmm13, %xmm12
	vfmadd132pd	%xmm6, %xmm14, %xmm4
	vaddpd	%xmm9, %xmm12, %xmm9
	vaddpd	%xmm8, %xmm4, %xmm4
	jne	.L317
.L72:
	vptest	%xmm0, %xmm0
	jne	.L318
.L73:
	movq	-136(%rbp), %rbx
	movl	-80(%rbp), %r8d
	movq	-144(%rbp), %r9
	movq	%rbx, %rcx
	andq	$-4, %rcx
	addl	%ecx, %r8d
	addq	%rcx, %r9
	cmpq	%rbx, %rcx
	je	.L81
.L71:
	movq	-96(%rbp), %r10
	leal	(%r8,%r13), %r11d
	addq	%r10, %r11
	andl	$1, %r11d
	jne	.L75
	leaq	(%r9,%r12), %rcx
	leaq	(%r9,%rsi), %rbx
	addq	%rdi, %r9
	vmovsd	.LC3(%rip), %xmm6
	vmovsd	(%r15,%rbx,8), %xmm1
	vmovsd	-8(%r15,%rcx,8), %xmm12
	vaddsd	(%r15,%r9,8), %xmm1, %xmm0
	vaddsd	8(%r15,%rcx,8), %xmm12, %xmm5
	vmovsd	(%r15,%rcx,8), %xmm8
	movq	-104(%rbp), %r9
	vfnmadd231sd	%xmm6, %xmm8, %xmm0
	vfnmadd132sd	%xmm8, %xmm5, %xmm6
	vmulsd	beta_coef(%rip), %xmm6, %xmm11
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm7
	vmovsd	%xmm7, (%r9,%rcx,8)
.L75:
	leal	1(%r8), %r11d
	movslq	%r11d, %rcx
	cmpq	%rcx, -112(%rbp)
	jle	.L81
	movq	-96(%rbp), %r10
	addl	%r13d, %r11d
	addq	%r10, %r11
	andl	$1, %r11d
	jne	.L76
	leaq	(%rcx,%r12), %r9
	leaq	(%rcx,%rsi), %rbx
	addq	%rdi, %rcx
	movq	-104(%rbp), %r11
	vmovsd	(%r15,%rbx,8), %xmm3
	vmovsd	-8(%r15,%r9,8), %xmm13
	vaddsd	(%r15,%rcx,8), %xmm3, %xmm2
	vaddsd	8(%r15,%r9,8), %xmm13, %xmm9
	vmovsd	(%r15,%r9,8), %xmm10
	vmovsd	.LC3(%rip), %xmm14
	vfnmadd231sd	%xmm14, %xmm10, %xmm2
	vfnmadd132sd	%xmm10, %xmm9, %xmm14
	vmulsd	beta_coef(%rip), %xmm14, %xmm4
	vfmadd132sd	alfa(%rip), %xmm4, %xmm2
	vaddsd	%xmm10, %xmm2, %xmm8
	vmovsd	%xmm8, (%r11,%r9,8)
.L76:
	addl	$2, %r8d
	movslq	%r8d, %rcx
	cmpq	%rcx, -112(%rbp)
	jle	.L81
	addl	%r13d, %r8d
	movq	-96(%rbp), %r13
	addq	%r13, %r8
	andl	$1, %r8d
	jne	.L81
	leaq	(%rcx,%r12), %r8
	addq	%rcx, %rsi
	addq	%rdi, %rcx
	vmovsd	.LC3(%rip), %xmm12
	vmovsd	(%r15,%rsi,8), %xmm1
	vmovsd	-8(%r15,%r8,8), %xmm5
	vaddsd	(%r15,%rcx,8), %xmm1, %xmm0
	vaddsd	8(%r15,%r8,8), %xmm5, %xmm11
	vmovsd	(%r15,%r8,8), %xmm6
	movq	-104(%rbp), %rdi
	vfnmadd231sd	%xmm12, %xmm6, %xmm0
	vfnmadd132sd	%xmm6, %xmm11, %xmm12
	vmulsd	beta_coef(%rip), %xmm12, %xmm7
	vfmadd132sd	alfa(%rip), %xmm7, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm10
	vmovsd	%xmm10, (%rdi,%r8,8)
.L81:
	movq	-176(%rbp), %rbx
	movl	-128(%rbp), %r13d
	incq	%r14
	addq	%rbx, -120(%rbp)
	addq	-152(%rbp), %r12
	addq	%rbx, %rdx
	addq	%rbx, %rax
	cmpl	%r13d, -124(%rbp)
	jge	.L35
	movq	-104(%rbp), %r14
.L85:
	movq	-240(%rbp), %rdi
	vzeroupper
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movl	-156(%rbp), %r12d
	testl	%r12d, %r12d
	jg	.L319
	movl	-160(%rbp), %edx
	cmpl	%edx, -156(%rbp)
	jl	.L320
	movl	-156(%rbp), %eax
	testl	%eax, %eax
	jne	.L38
.L40:
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L63
	movq	NP(%rip), %r11
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r11), %esi
	leaq	8(%r14,%r11,8), %rdi
	call	MPI_Send
	movq	-296(%rbp), %r10
	subq	$8, %rsp
	movl	NP(%rip), %edi
	movl	vizNorte(%rip), %ecx
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	pushq	(%r10)
	leal	1(%rdi), %esi
	movq	%r14, %rdi
	call	MPI_Recv
	popq	%r13
	popq	%rax
.L63:
	movl	-160(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L64
.L41:
	movl	-124(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	jg	.L62
.L61:
	movq	NP(%rip), %rdi
	movq	N(%rip), %r10
	movq	m(%rip), %r11
	leaq	1(%rdi), %r13
	cmpq	$2, %r10
	jle	.L62
	leaq	-1(%r11,%r10), %r9
	movl	-124(%rbp), %esi
	negq	%r11
	movq	%r13, %rbx
	movq	-256(%rbp), %r8
	leaq	0(,%r13,8), %rcx
	movq	%r15, -104(%rbp)
	leaq	-8(%rcx), %r12
	incl	%esi
	movq	-280(%rbp), %rdx
	vmovsd	.LC3(%rip), %xmm2
	imulq	%r8, %rcx
	movl	%esi, -88(%rbp)
	vmovsd	.LC4(%rip), %xmm1
	addq	%r8, %r9
	imulq	%r8, %rbx
	leaq	(%rdx,%r11,8), %rax
	movq	%r12, -96(%rbp)
	movl	-196(%rbp), %r12d
	movq	%r14, -80(%rbp)
	addq	%rcx, %rax
	leaq	(%r15,%rax), %r11
	movl	$2, %eax
	subq	%r10, %rax
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L43:
	leal	1(%r12), %r15d
	decl	%r12d
	movq	-80(%rbp), %r8
	movq	%r14, %rcx
	movslq	%r15d, %rdi
	movslq	%r12d, %r12
	leaq	(%r14,%r9), %rdx
	negq	%rcx
	imulq	%r13, %rdi
	leaq	(%r8,%rbx,8), %rsi
	imulq	%r13, %r12
	subq	%rbx, %rdi
	subq	%rbx, %r12
	andl	$3, %ecx
	je	.L58
	cmpq	$1, %rcx
	je	.L237
	cmpq	$2, %rcx
	je	.L238
	movq	%rdx, %rax
	shrq	$63, %rax
	leaq	(%rdx,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L168
	vmovsd	(%rsi), %xmm6
	vaddsd	16(%rsi), %xmm6, %xmm0
	vmovsd	beta_coef(%rip), %xmm9
	vmovsd	alfa(%rip), %xmm15
	vmovsd	8(%rsi,%r12,8), %xmm4
	vaddsd	8(%rsi,%rdi,8), %xmm4, %xmm8
	vmulsd	%xmm9, %xmm0, %xmm12
	vaddsd	%xmm15, %xmm9, %xmm11
	vfmadd132sd	%xmm2, %xmm1, %xmm11
	vfmadd132sd	%xmm15, %xmm12, %xmm8
	vaddsd	(%r11,%rdx,8), %xmm8, %xmm5
	vdivsd	%xmm11, %xmm5, %xmm7
	vmovsd	%xmm7, 8(%rsi)
.L168:
	incq	%rdx
	addq	$8, %rsi
.L238:
	movq	%rdx, %r8
	shrq	$63, %r8
	leaq	(%rdx,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L171
	vmovsd	(%rsi), %xmm15
	vaddsd	16(%rsi), %xmm15, %xmm9
	vmovsd	beta_coef(%rip), %xmm3
	vmovsd	alfa(%rip), %xmm10
	vmovsd	8(%rsi,%r12,8), %xmm14
	vaddsd	8(%rsi,%rdi,8), %xmm14, %xmm13
	vmulsd	%xmm3, %xmm9, %xmm4
	vaddsd	%xmm10, %xmm3, %xmm6
	vfmadd132sd	%xmm2, %xmm1, %xmm6
	vfmadd132sd	%xmm10, %xmm4, %xmm13
	vaddsd	(%r11,%rdx,8), %xmm13, %xmm8
	vdivsd	%xmm6, %xmm8, %xmm0
	vmovsd	%xmm0, 8(%rsi)
.L171:
	incq	%rdx
	addq	$8, %rsi
.L237:
	movq	%rdx, %rax
	shrq	$63, %rax
	leaq	(%rdx,%rax), %r10
	andl	$1, %r10d
	subq	%rax, %r10
	cmpq	$1, %r10
	jne	.L174
	vmovsd	(%rsi), %xmm10
	vaddsd	16(%rsi), %xmm10, %xmm3
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm12
	vmovsd	8(%rsi,%r12,8), %xmm11
	vaddsd	8(%rsi,%rdi,8), %xmm11, %xmm7
	vmulsd	%xmm5, %xmm3, %xmm14
	vaddsd	%xmm12, %xmm5, %xmm15
	vfmadd132sd	%xmm2, %xmm1, %xmm15
	vfmadd132sd	%xmm12, %xmm14, %xmm7
	vaddsd	(%r11,%rdx,8), %xmm7, %xmm13
	vdivsd	%xmm15, %xmm13, %xmm9
	vmovsd	%xmm9, 8(%rsi)
.L174:
	incq	%rdx
	addq	$8, %rsi
	cmpq	%rdx, %r9
	je	.L291
.L58:
	movq	%rdx, %r8
	shrq	$63, %r8
	leaq	(%rdx,%r8), %rcx
	andl	$1, %ecx
	subq	%r8, %rcx
	cmpq	$1, %rcx
	jne	.L57
	vmovsd	(%rsi), %xmm12
	vaddsd	16(%rsi), %xmm12, %xmm5
	vmovsd	beta_coef(%rip), %xmm6
	vmovsd	alfa(%rip), %xmm8
	vmovsd	8(%rsi,%r12,8), %xmm4
	vaddsd	8(%rsi,%rdi,8), %xmm4, %xmm0
	vmulsd	%xmm6, %xmm5, %xmm11
	vaddsd	%xmm8, %xmm6, %xmm10
	vfmadd132sd	%xmm2, %xmm1, %xmm10
	vfmadd132sd	%xmm8, %xmm11, %xmm0
	vaddsd	(%r11,%rdx,8), %xmm0, %xmm7
	vdivsd	%xmm10, %xmm7, %xmm3
	vmovsd	%xmm3, 8(%rsi)
.L57:
	incq	%rdx
	leaq	8(%rsi), %rax
	movq	%rdx, %r10
	shrq	$63, %r10
	leaq	(%rdx,%r10), %r8
	andl	$1, %r8d
	subq	%r10, %r8
	cmpq	$1, %r8
	jne	.L177
	vmovsd	8(%rsi), %xmm8
	vaddsd	16(%rax), %xmm8, %xmm6
	vmovsd	beta_coef(%rip), %xmm13
	vmovsd	alfa(%rip), %xmm14
	vmovsd	8(%rax,%r12,8), %xmm15
	vaddsd	8(%rax,%rdi,8), %xmm15, %xmm9
	vmulsd	%xmm13, %xmm6, %xmm4
	vaddsd	%xmm14, %xmm13, %xmm12
	vfmadd132sd	%xmm2, %xmm1, %xmm12
	vfmadd132sd	%xmm14, %xmm4, %xmm9
	vaddsd	(%r11,%rdx,8), %xmm9, %xmm0
	vdivsd	%xmm12, %xmm0, %xmm5
	vmovsd	%xmm5, 8(%rax)
.L177:
	leaq	1(%rdx), %rcx
	movq	%rcx, %r10
	shrq	$63, %r10
	leaq	(%rcx,%r10), %rsi
	andl	$1, %esi
	subq	%r10, %rsi
	cmpq	$1, %rsi
	jne	.L179
	vmovsd	8(%rax), %xmm14
	vaddsd	24(%rax), %xmm14, %xmm13
	vmovsd	beta_coef(%rip), %xmm7
	vmovsd	alfa(%rip), %xmm11
	vmovsd	16(%rax,%r12,8), %xmm10
	vaddsd	16(%rax,%rdi,8), %xmm10, %xmm3
	vmulsd	%xmm7, %xmm13, %xmm15
	vaddsd	%xmm11, %xmm7, %xmm8
	vfmadd132sd	%xmm2, %xmm1, %xmm8
	vfmadd132sd	%xmm11, %xmm15, %xmm3
	vaddsd	(%r11,%rcx,8), %xmm3, %xmm9
	vdivsd	%xmm8, %xmm9, %xmm6
	vmovsd	%xmm6, 16(%rax)
.L179:
	leaq	2(%rdx), %r8
	movq	%r8, %rcx
	shrq	$63, %rcx
	leaq	(%r8,%rcx), %r10
	andl	$1, %r10d
	subq	%rcx, %r10
	cmpq	$1, %r10
	jne	.L181
	vmovsd	16(%rax), %xmm11
	vaddsd	32(%rax), %xmm11, %xmm7
	vmovsd	beta_coef(%rip), %xmm5
	vmovsd	alfa(%rip), %xmm12
	vmovsd	24(%rax,%r12,8), %xmm4
	vaddsd	24(%rax,%rdi,8), %xmm4, %xmm0
	vmulsd	%xmm5, %xmm7, %xmm10
	vaddsd	%xmm12, %xmm5, %xmm3
	vfmadd132sd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	%xmm12, %xmm10, %xmm0
	vaddsd	(%r11,%r8,8), %xmm0, %xmm14
	vdivsd	%xmm3, %xmm14, %xmm13
	vmovsd	%xmm13, 24(%rax)
.L181:
	addq	$3, %rdx
	leaq	24(%rax), %rsi
	cmpq	%rdx, %r9
	jne	.L58
.L291:
	movl	%r15d, %r12d
	incq	%r9
	addq	%r13, %rbx
	addq	-96(%rbp), %r11
	cmpl	%r15d, -88(%rbp)
	jne	.L43
	movq	-104(%rbp), %r15
	movq	-80(%rbp), %r14
.L62:
	movq	-240(%rbp), %rdi
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movl	-156(%rbp), %ebx
	testl	%ebx, %ebx
	jg	.L321
	movl	-160(%rbp), %eax
	cmpl	%eax, %ebx
	jl	.L49
	incq	m(%rip)
	testl	%ebx, %ebx
	jne	.L50
.L47:
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L55
	movq	NP(%rip), %rdx
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	leal	1(%rdx), %esi
	leaq	8(%r14,%rdx,8), %rdi
	movl	$1275070475, %edx
	call	MPI_Send
	movq	-296(%rbp), %r8
	subq	$8, %rsp
	movl	NP(%rip), %eax
	movl	vizNorte(%rip), %ecx
	movq	%r14, %rdi
	movl	$1140850688, %r9d
	movl	$1275070475, %edx
	pushq	(%r8)
	leal	1(%rax), %esi
	xorl	%r8d, %r8d
	call	MPI_Recv
	popq	%rsi
	popq	%rdi
.L55:
	movl	-160(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L56
.L54:
	call	GOMP_barrier
	vmovsd	.LC1(%rip), %xmm15
	vmulsd	tempoFinal(%rip), %xmm15, %xmm9
	vcomisd	-264(%rbp), %xmm9
	vmovapd	.LC7(%rip), %ymm15
	ja	.L51
	vzeroupper
.L303:
	leaq	-48(%rbp), %rsp
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
	.p2align 4,,10
	.p2align 3
.L96:
	.cfi_restore_state
	movq	-112(%rbp), %r10
	leaq	-16(%r14,%r9), %rsi
	leaq	-16(%r14,%r8), %r11
	movq	%rax, %r9
	movl	$1, %ecx
	leaq	-1(%r10), %rbx
	andl	$3, %ebx
	je	.L111
	cmpq	$1, %rbx
	je	.L243
	cmpq	$2, %rbx
	je	.L244
	testb	$1, %r12b
	je	.L213
	vmovsd	8(%rax), %xmm10
	vmovsd	(%rax), %xmm5
	vaddsd	16(%rax), %xmm5, %xmm14
	vmovsd	8(%r11), %xmm13
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm14
	vaddsd	8(%rsi), %xmm13, %xmm2
	vmulsd	beta_coef(%rip), %xmm14, %xmm9
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm2
	vfmadd132sd	alfa(%rip), %xmm9, %xmm2
	vaddsd	%xmm10, %xmm2, %xmm8
	vmovsd	%xmm8, (%rdx)
.L213:
	movl	$2, %ecx
	leaq	8(%rax), %r9
.L244:
	leaq	(%r12,%rcx), %r13
	andl	$1, %r13d
	jne	.L216
	vmovsd	8(%r9), %xmm12
	vmovsd	(%r9), %xmm7
	vaddsd	16(%r9), %xmm7, %xmm3
	vmovsd	(%r11,%rcx,8), %xmm1
	vfnmadd231sd	.LC3(%rip), %xmm12, %xmm3
	vaddsd	(%rsi,%rcx,8), %xmm1, %xmm0
	vmulsd	beta_coef(%rip), %xmm3, %xmm4
	vfnmadd231sd	.LC3(%rip), %xmm12, %xmm0
	vfmadd132sd	alfa(%rip), %xmm4, %xmm0
	vaddsd	%xmm12, %xmm0, %xmm6
	vmovsd	%xmm6, -8(%rdx,%rcx,8)
.L216:
	incq	%rcx
	addq	$8, %r9
.L243:
	leaq	(%r12,%rcx), %r8
	andl	$1, %r8d
	jne	.L219
	vmovsd	8(%r9), %xmm11
	vmovsd	(%r9), %xmm2
	vaddsd	16(%r9), %xmm2, %xmm5
	vmovsd	(%r11,%rcx,8), %xmm10
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm5
	vaddsd	(%rsi,%rcx,8), %xmm10, %xmm13
	vmulsd	beta_coef(%rip), %xmm5, %xmm14
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm13
	vfmadd132sd	alfa(%rip), %xmm14, %xmm13
	vaddsd	%xmm11, %xmm13, %xmm9
	vmovsd	%xmm9, -8(%rdx,%rcx,8)
.L219:
	incq	%rcx
	addq	$8, %r9
	cmpq	-112(%rbp), %rcx
	je	.L112
.L111:
	leaq	(%r12,%rcx), %rdi
	andl	$1, %edi
	jne	.L110
	vmovsd	8(%r9), %xmm8
	vmovsd	(%r9), %xmm1
	vaddsd	16(%r9), %xmm1, %xmm7
	vmovsd	(%r11,%rcx,8), %xmm12
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm7
	vaddsd	(%rsi,%rcx,8), %xmm12, %xmm0
	vmulsd	beta_coef(%rip), %xmm7, %xmm3
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm0
	vfmadd132sd	alfa(%rip), %xmm3, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm4
	vmovsd	%xmm4, -8(%rdx,%rcx,8)
.L110:
	incq	%rcx
	leaq	8(%r9), %rbx
	leaq	(%r12,%rcx), %r10
	andl	$1, %r10d
	jne	.L222
	vmovsd	8(%rbx), %xmm6
	vmovsd	8(%r9), %xmm13
	vaddsd	16(%rbx), %xmm13, %xmm2
	vmovsd	(%r11,%rcx,8), %xmm11
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm2
	vaddsd	(%rsi,%rcx,8), %xmm11, %xmm10
	vmulsd	beta_coef(%rip), %xmm2, %xmm5
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm10
	vfmadd132sd	alfa(%rip), %xmm5, %xmm10
	vaddsd	%xmm6, %xmm10, %xmm14
	vmovsd	%xmm14, -8(%rdx,%rcx,8)
.L222:
	leaq	1(%rcx), %r9
	leaq	(%r12,%r9), %r13
	andl	$1, %r13d
	jne	.L224
	vmovsd	16(%rbx), %xmm9
	vmovsd	8(%rbx), %xmm0
	vaddsd	24(%rbx), %xmm0, %xmm1
	vmovsd	(%r11,%r9,8), %xmm8
	vfnmadd231sd	.LC3(%rip), %xmm9, %xmm1
	vaddsd	(%rsi,%r9,8), %xmm8, %xmm12
	vmulsd	beta_coef(%rip), %xmm1, %xmm7
	vfnmadd231sd	.LC3(%rip), %xmm9, %xmm12
	vfmadd132sd	alfa(%rip), %xmm7, %xmm12
	vaddsd	%xmm9, %xmm12, %xmm3
	vmovsd	%xmm3, -8(%rdx,%r9,8)
.L224:
	leaq	2(%rcx), %r8
	leaq	(%r12,%r8), %rdi
	andl	$1, %edi
	jne	.L226
	vmovsd	24(%rbx), %xmm4
	vmovsd	16(%rbx), %xmm10
	vaddsd	32(%rbx), %xmm10, %xmm13
	vmovsd	(%r11,%r8,8), %xmm6
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm13
	vaddsd	(%rsi,%r8,8), %xmm6, %xmm11
	vmulsd	beta_coef(%rip), %xmm13, %xmm2
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm11
	vfmadd132sd	alfa(%rip), %xmm2, %xmm11
	vaddsd	%xmm4, %xmm11, %xmm5
	vmovsd	%xmm5, -8(%rdx,%r8,8)
.L226:
	addq	$3, %rcx
	leaq	24(%rbx), %r9
	cmpq	-112(%rbp), %rcx
	jne	.L111
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L65:
	movq	-112(%rbp), %r10
	movl	$1, %r11d
	leaq	-16(%r15,%r9), %rbx
	leaq	-16(%r15,%r8), %rsi
	movq	%rax, %r9
	subq	%r11, %r10
	andl	$3, %r10d
	je	.L80
	cmpq	$1, %r10
	je	.L239
	cmpq	$2, %r10
	je	.L240
	testb	$1, %r14b
	je	.L183
	vmovsd	8(%rax), %xmm3
	vmovsd	(%rax), %xmm13
	vaddsd	16(%rax), %xmm13, %xmm9
	vmovsd	8(%rsi), %xmm2
	vfnmadd231sd	.LC3(%rip), %xmm3, %xmm9
	vaddsd	8(%rbx), %xmm2, %xmm14
	vmulsd	beta_coef(%rip), %xmm9, %xmm4
	vfnmadd231sd	.LC3(%rip), %xmm3, %xmm14
	vfmadd132sd	alfa(%rip), %xmm4, %xmm14
	vaddsd	%xmm3, %xmm14, %xmm8
	vmovsd	%xmm8, (%rdx)
.L183:
	movl	$2, %r11d
	leaq	8(%rax), %r9
.L240:
	leaq	(%r11,%r14), %rcx
	andl	$1, %ecx
	jne	.L186
	vmovsd	8(%r9), %xmm6
	vmovsd	(%r9), %xmm12
	vaddsd	16(%r9), %xmm12, %xmm5
	vmovsd	(%rsi,%r11,8), %xmm1
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm5
	vaddsd	(%rbx,%r11,8), %xmm1, %xmm0
	vmulsd	beta_coef(%rip), %xmm5, %xmm11
	vfnmadd231sd	.LC3(%rip), %xmm6, %xmm0
	vfmadd132sd	alfa(%rip), %xmm11, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm7
	vmovsd	%xmm7, -8(%rdx,%r11,8)
.L186:
	incq	%r11
	addq	$8, %r9
.L239:
	leaq	(%r11,%r14), %r13
	andl	$1, %r13d
	jne	.L189
	vmovsd	8(%r9), %xmm10
	vmovsd	(%r9), %xmm14
	vaddsd	16(%r9), %xmm14, %xmm13
	vmovsd	(%rsi,%r11,8), %xmm3
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm13
	vaddsd	(%rbx,%r11,8), %xmm3, %xmm2
	vmulsd	beta_coef(%rip), %xmm13, %xmm9
	vfnmadd231sd	.LC3(%rip), %xmm10, %xmm2
	vfmadd132sd	alfa(%rip), %xmm9, %xmm2
	vaddsd	%xmm10, %xmm2, %xmm4
	vmovsd	%xmm4, -8(%rdx,%r11,8)
.L189:
	incq	%r11
	addq	$8, %r9
	cmpq	%r11, -112(%rbp)
	je	.L81
.L80:
	leaq	(%r11,%r14), %r8
	andl	$1, %r8d
	jne	.L79
	vmovsd	8(%r9), %xmm8
	vmovsd	(%r9), %xmm1
	vaddsd	16(%r9), %xmm1, %xmm12
	vmovsd	(%rsi,%r11,8), %xmm6
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm12
	vaddsd	(%rbx,%r11,8), %xmm6, %xmm0
	vmulsd	beta_coef(%rip), %xmm12, %xmm5
	vfnmadd231sd	.LC3(%rip), %xmm8, %xmm0
	vfmadd132sd	alfa(%rip), %xmm5, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm11
	vmovsd	%xmm11, -8(%rdx,%r11,8)
.L79:
	incq	%r11
	leaq	8(%r9), %rdi
	leaq	(%r11,%r14), %r10
	andl	$1, %r10d
	jne	.L192
	vmovsd	8(%rdi), %xmm7
	vmovsd	8(%r9), %xmm2
	vaddsd	16(%rdi), %xmm2, %xmm14
	vmovsd	(%rsi,%r11,8), %xmm10
	vfnmadd231sd	.LC3(%rip), %xmm7, %xmm14
	vaddsd	(%rbx,%r11,8), %xmm10, %xmm3
	vmulsd	beta_coef(%rip), %xmm14, %xmm13
	vfnmadd231sd	.LC3(%rip), %xmm7, %xmm3
	vfmadd132sd	alfa(%rip), %xmm13, %xmm3
	vaddsd	%xmm7, %xmm3, %xmm9
	vmovsd	%xmm9, -8(%rdx,%r11,8)
.L192:
	leaq	1(%r11), %r9
	leaq	(%r9,%r14), %rcx
	andl	$1, %ecx
	jne	.L194
	vmovsd	16(%rdi), %xmm4
	vmovsd	8(%rdi), %xmm0
	vaddsd	24(%rdi), %xmm0, %xmm1
	vmovsd	(%rsi,%r9,8), %xmm8
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm1
	vaddsd	(%rbx,%r9,8), %xmm8, %xmm6
	vmulsd	beta_coef(%rip), %xmm1, %xmm12
	vfnmadd231sd	.LC3(%rip), %xmm4, %xmm6
	vfmadd132sd	alfa(%rip), %xmm12, %xmm6
	vaddsd	%xmm4, %xmm6, %xmm5
	vmovsd	%xmm5, -8(%rdx,%r9,8)
.L194:
	leaq	2(%r11), %r13
	leaq	0(%r13,%r14), %r8
	andl	$1, %r8d
	jne	.L196
	vmovsd	24(%rdi), %xmm11
	vmovsd	16(%rdi), %xmm3
	vaddsd	32(%rdi), %xmm3, %xmm2
	vmovsd	(%rsi,%r13,8), %xmm7
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm2
	vaddsd	(%rbx,%r13,8), %xmm7, %xmm10
	vmulsd	beta_coef(%rip), %xmm2, %xmm14
	vfnmadd231sd	.LC3(%rip), %xmm11, %xmm10
	vfmadd132sd	alfa(%rip), %xmm14, %xmm10
	vaddsd	%xmm11, %xmm10, %xmm13
	vmovsd	%xmm13, -8(%rdx,%r13,8)
.L196:
	addq	$3, %r11
	leaq	24(%rdi), %r9
	cmpq	%r11, -112(%rbp)
	jne	.L80
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L310:
	vmaskmovpd	%xmm9, %xmm0, 16(%r9)
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L309:
	vmaskmovpd	%xmm14, %xmm1, (%r9)
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L318:
	vmaskmovpd	%xmm4, %xmm0, 16(%r9)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L317:
	vmaskmovpd	%xmm9, %xmm1, (%r9)
	jmp	.L72
.L97:
	movq	-184(%rbp), %r8
	movl	$1, -80(%rbp)
	xorl	%r9d, %r9d
	movq	$1, -144(%rbp)
	movq	%r8, -136(%rbp)
	jmp	.L121
.L66:
	movq	-184(%rbp), %r8
	movl	$1, -80(%rbp)
	xorl	%r9d, %r9d
	movq	$1, -144(%rbp)
	movq	%r8, -136(%rbp)
	jmp	.L119
.L122:
	movq	-224(%rbp), %r9
	movl	-232(%rbp), %r8d
	jmp	.L71
.L123:
	movq	-232(%rbp), %r9
	movl	-224(%rbp), %r8d
	jmp	.L102
.L311:
	movq	-272(%rbp), %rdi
	call	sem_wait
	movl	-160(%rbp), %edi
	cmpl	%edi, %r12d
	jl	.L322
.L21:
	movl	-160(%rbp), %r9d
	cmpl	%r9d, -156(%rbp)
	jne	.L24
.L95:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L24
	movq	NP(%rip), %r13
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r13), %esi
	incq	%r13
	imulq	nN(%rip), %r13
	leaq	(%r15,%r13,8), %rdi
	call	MPI_Send
	movq	NP(%rip), %r12
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	nN(%rip), %rdx
	movq	-296(%rbp), %rax
	movl	$1140850688, %r9d
	leal	1(%r12), %esi
	incq	%r12
	movl	vizSul(%rip), %ecx
	incq	%rdx
	pushq	(%rax)
	imulq	%r12, %rdx
	leaq	(%r15,%rdx,8), %rdi
	movl	$1275070475, %edx
	call	MPI_Recv
	popq	%rsi
	popq	%rdi
	jmp	.L24
.L319:
	movq	-272(%rbp), %rdi
	call	sem_wait
	movl	-160(%rbp), %r8d
	cmpl	%r8d, %r12d
	jl	.L37
.L38:
	movl	-160(%rbp), %r9d
	cmpl	%r9d, -156(%rbp)
	jne	.L41
.L64:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L41
	movq	NP(%rip), %r13
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r13), %esi
	incq	%r13
	imulq	nN(%rip), %r13
	leaq	(%r14,%r13,8), %rdi
	call	MPI_Send
	movq	NP(%rip), %rbx
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	nN(%rip), %r12
	movq	-296(%rbp), %rdx
	movl	$1140850688, %r9d
	leal	1(%rbx), %esi
	incq	%rbx
	movl	vizSul(%rip), %ecx
	incq	%r12
	pushq	(%rdx)
	movl	$1275070475, %edx
	imulq	%rbx, %r12
	leaq	(%r14,%r12,8), %rdi
	call	MPI_Recv
	popq	%rax
	popq	%rdx
	jmp	.L41
.L313:
	movq	-272(%rbp), %rdi
	vzeroupper
	call	sem_wait
	movl	-160(%rbp), %r9d
	vmovapd	.LC7(%rip), %ymm15
	cmpl	%r9d, %ebx
	jl	.L323
.L33:
	movl	-160(%rbp), %r11d
	cmpl	%r11d, -156(%rbp)
	jne	.L32
.L87:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L32
	movq	NP(%rip), %r13
	movl	$1140850688, %r9d
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r13), %esi
	incq	%r13
	imulq	nN(%rip), %r13
	leaq	(%r15,%r13,8), %rdi
	vzeroupper
	call	MPI_Send
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	NP(%rip), %r12
	movq	nN(%rip), %rbx
	movl	$1140850688, %r9d
	movq	-296(%rbp), %rdx
	movl	vizSul(%rip), %ecx
	leal	1(%r12), %esi
	incq	%rbx
	incq	%r12
	imulq	%r12, %rbx
	pushq	(%rdx)
	movl	$1275070475, %edx
	leaq	(%r15,%rbx,8), %rdi
	call	MPI_Recv
	popq	%r11
	vmovapd	.LC7(%rip), %ymm15
	popq	%rbx
	jmp	.L32
.L321:
	movq	-272(%rbp), %rdi
	call	sem_wait
	movl	-160(%rbp), %r10d
	cmpl	%r10d, %ebx
	jl	.L45
	incq	m(%rip)
	movl	%r10d, %eax
.L50:
	cmpl	%eax, -156(%rbp)
	jne	.L54
.L56:
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.L54
	movq	NP(%rip), %r9
	xorl	%r8d, %r8d
	movl	$1275070475, %edx
	leal	1(%r9), %esi
	incq	%r9
	imulq	nN(%rip), %r9
	leaq	(%r14,%r9,8), %rdi
	movl	$1140850688, %r9d
	call	MPI_Send
	movq	NP(%rip), %r11
	subq	$8, %rsp
	xorl	%r8d, %r8d
	movq	nN(%rip), %r13
	movq	-296(%rbp), %r12
	movl	$1275070475, %edx
	movl	$1140850688, %r9d
	leal	1(%r11), %esi
	incq	%r11
	movl	vizSul(%rip), %ecx
	incq	%r13
	pushq	(%r12)
	imulq	%r11, %r13
	leaq	(%r14,%r13,8), %rdi
	call	MPI_Recv
	popq	%r8
	popq	%r9
	jmp	.L54
.L320:
	movq	-288(%rbp), %rdi
	call	sem_wait
	movl	-156(%rbp), %esi
	testl	%esi, %esi
	je	.L40
	jmp	.L41
.L49:
	movq	-288(%rbp), %rdi
	call	sem_wait
	movl	-156(%rbp), %edi
	incq	m(%rip)
	testl	%edi, %edi
	je	.L47
	jmp	.L54
.L312:
	movq	-288(%rbp), %rdi
	call	sem_wait
	movl	-156(%rbp), %r11d
	testl	%r11d, %r11d
	je	.L23
	jmp	.L24
.L314:
	movq	-288(%rbp), %rdi
	vzeroupper
	call	sem_wait
	movl	-156(%rbp), %eax
	vmovapd	.LC7(%rip), %ymm15
	testl	%eax, %eax
	je	.L31
	jmp	.L32
.L322:
	movq	-288(%rbp), %rdi
	call	sem_wait
	movl	-124(%rbp), %r11d
	cmpl	%r11d, -196(%rbp)
	jle	.L92
	movq	-240(%rbp), %rdi
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movq	-272(%rbp), %rdi
	call	sem_wait
	movq	-288(%rbp), %rdi
	call	sem_wait
.L117:
	movq	-240(%rbp), %rdi
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movq	-272(%rbp), %rdi
	call	sem_wait
.L37:
	movq	-288(%rbp), %rdi
	call	sem_wait
	movl	-124(%rbp), %esi
	cmpl	%esi, -196(%rbp)
	jle	.L61
	movq	-240(%rbp), %rdi
	call	sem_post
	movq	-248(%rbp), %rdi
	call	sem_post
	movq	-272(%rbp), %rdi
	call	sem_wait
.L45:
	movq	-288(%rbp), %rdi
	call	sem_wait
	incq	m(%rip)
	jmp	.L54
.L323:
	movq	-288(%rbp), %rdi
	vzeroupper
	call	sem_wait
	movl	-124(%rbp), %eax
	cmpl	%eax, -196(%rbp)
	vmovapd	.LC7(%rip), %ymm15
	jle	.L84
	vzeroupper
	jmp	.L117
.L305:
	leal	(%rcx,%rdx), %edi
	addl	%edx, %eax
	movl	%edi, -196(%rbp)
	movl	%eax, -124(%rbp)
	jmp	.L115
.L306:
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$semaphores_left, %edi
	movl	$32, %ebx
	call	sem_init
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$semaphores_right, %edi
	call	sem_init
	jmp	.L246
	.cfi_endproc
.LFE3802:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3802:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3802-.LLSDACSB3802
.LLSDACSB3802:
.LLSDACSE3802:
	.text
	.size	main._omp_fn.0, .-main._omp_fn.0
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
	.p2align 4
	.globl	_Z18wait_for_neighborsii
	.type	_Z18wait_for_neighborsii, @function
_Z18wait_for_neighborsii:
.LFB3107:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testl	%edi, %edi
	jle	.L326
	leal	-1(%rdi), %edi
	movslq	%edi, %rdi
	salq	$5, %rdi
	addq	$semaphores_right, %rdi
	call	sem_wait
.L326:
	decl	%ebp
	cmpl	%ebx, %ebp
	jg	.L330
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L330:
	.cfi_restore_state
	leal	1(%rbx), %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movslq	%eax, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	salq	$5, %rdi
	addq	$semaphores_left, %rdi
	jmp	sem_wait
	.cfi_endproc
.LFE3107:
	.size	_Z18wait_for_neighborsii, .-_Z18wait_for_neighborsii
	.p2align 4
	.globl	_Z11signal_doneii
	.type	_Z11signal_doneii, @function
_Z11signal_doneii:
.LFB3108:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rbx
	salq	$5, %rbx
	leaq	semaphores_left(%rbx), %rdi
	call	sem_post
	leaq	semaphores_right(%rbx), %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	sem_post
	.cfi_endproc
.LFE3108:
	.size	_Z11signal_doneii, .-_Z11signal_doneii
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
.LFB3109:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3109
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
	jle	.L334
	addl	%r9d, %r15d
	leal	1(%r9,%rbx), %ebx
.L335:
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
	jl	.L339
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
.L338:
	cmpq	$0, -824(%rbp)
	jle	.L347
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovsd	-840(%rbp), %xmm8
	cmpq	$6, -880(%rbp)
	vcvtsi2sdl	-612(%rbp), %xmm4, %xmm7
	vmulsd	%xmm8, %xmm7, %xmm9
	vsubsd	.LC1(%rip), %xmm9, %xmm10
	vmulsd	%xmm10, %xmm10, %xmm11
	vmovsd	%xmm9, -912(%rbp)
	vmovsd	%xmm11, -624(%rbp)
	jbe	.L374
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
	je	.L341
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
	je	.L475
	.p2align 4,,10
	.p2align 3
.L341:
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
	jne	.L341
.L475:
	movq	-936(%rbp), %r15
	vextractf128	$0x1, %ymm8, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm13
	movq	%r15, %r11
	cmpq	%r15, -928(%rbp)
	je	.L342
	movl	-600(%rbp), %ebx
.L340:
	movq	-880(%rbp), %rsi
	subq	%r11, %rsi
	leaq	1(%rsi), %r13
	cmpq	$2, %rsi
	jbe	.L343
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
	je	.L342
.L343:
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
	jle	.L342
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
	jle	.L342
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
.L342:
	movl	$1, %r9d
.L347:
	movq	-904(%rbp), %rdx
	incl	-612(%rbp)
	addq	%rdx, -872(%rbp)
	movl	-612(%rbp), %edi
	addq	%rdx, -864(%rbp)
	addq	-824(%rbp), %r12
	cmpl	%edi, -616(%rbp)
	jne	.L338
	testb	%r9b, %r9b
	je	.L481
	vmovsd	-912(%rbp), %xmm14
	vmovsd	%xmm13, y(%rip)
	vmovsd	%xmm14, x(%rip)
	vzeroupper
.L339:
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
	je	.L486
	movq	$0, -720(%rbp)
	movq	NP(%rip), %rcx
	xorl	%r15d, %r15d
	movq	$0, -688(%rbp)
.L348:
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
	jne	.L362
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
	je	.L363
	xorl	%r14d, %r14d
	cmpq	$0, N(%rip)
	jle	.L365
	.p2align 4,,10
	.p2align 3
.L364:
	vxorpd	%xmm8, %xmm8, %xmm8
	xorl	%ebx, %ebx
	vcvtsi2sdl	%r14d, %xmm8, %xmm11
	vmovsd	%xmm11, -656(%rbp)
	jmp	.L369
	.p2align 4,,10
	.p2align 3
.L489:
	movsbl	67(%r13), %esi
.L368:
	movq	%r12, %rdi
.LEHB1:
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movq	N(%rip), %r8
	incq	%rbx
	cmpq	%rbx, %r8
	jle	.L487
.L369:
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
	je	.L488
	cmpb	$0, 56(%r13)
	jne	.L489
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rdi
	movl	$10, %esi
	movq	48(%rdi), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L368
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L368
	.p2align 4,,10
	.p2align 3
.L487:
	incq	%r14
	cmpq	%r14, %r8
	jg	.L364
.L365:
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
.LEHE1:
.L371:
	movq	%r15, %rdi
	call	free
	movq	-688(%rbp), %rdi
	call	free
	movq	-720(%rbp), %rdi
	call	free
	leaq	-560(%rbp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L362:
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
.L374:
	.cfi_restore_state
	xorl	%r11d, %r11d
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	jmp	.L340
.L334:
	addl	%edx, %r15d
	addl	%edx, %ebx
	jmp	.L335
.L486:
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
	jle	.L348
	leaq	-2(%r13), %rax
	movl	resto(%rip), %esi
	cqto
	idivq	%r14
	movl	%eax, %r14d
	testl	%esi, %esi
	jle	.L349
	cmpl	%esi, %r12d
	movl	$1, %edx
	cmovle	%r12d, %esi
	testl	%esi, %esi
	movl	%esi, %r10d
	cmovg	%esi, %edx
	cmpl	$7, %esi
	jle	.L376
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
	je	.L479
	cmpq	$1, %rdi
	je	.L437
	cmpq	$2, %rdi
	je	.L438
	cmpq	$3, %rdi
	je	.L439
	cmpq	$4, %rdi
	je	.L440
	cmpq	$5, %rdi
	je	.L441
	cmpq	$6, %rdi
	jne	.L490
.L442:
	vmovdqa	%ymm0, %ymm5
	movq	-688(%rbp), %rbx
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rdi
	vpmulld	%ymm5, %ymm14, %ymm4
	vmovdqu	%ymm10, (%rbx,%rsi)
	vpmulld	%ymm8, %ymm4, %ymm3
	vmovdqu	%ymm3, (%rdi,%rsi)
	addq	$32, %rsi
.L441:
	vmovdqa	%ymm0, %ymm1
	movq	-688(%rbp), %r8
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rbx
	vpmulld	%ymm1, %ymm14, %ymm7
	vmovdqu	%ymm10, (%r8,%rsi)
	vpmulld	%ymm8, %ymm7, %ymm9
	vmovdqu	%ymm9, (%rbx,%rsi)
	addq	$32, %rsi
.L440:
	vmovdqa	%ymm0, %ymm13
	movq	-688(%rbp), %rdi
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %r8
	vpmulld	%ymm13, %ymm14, %ymm15
	vmovdqu	%ymm10, (%rdi,%rsi)
	vpmulld	%ymm8, %ymm15, %ymm6
	vmovdqu	%ymm6, (%r8,%rsi)
	addq	$32, %rsi
.L439:
	vmovdqa	%ymm0, %ymm2
	movq	-688(%rbp), %rbx
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rdi
	vpmulld	%ymm2, %ymm14, %ymm5
	vmovdqu	%ymm10, (%rbx,%rsi)
	vpmulld	%ymm8, %ymm5, %ymm4
	vmovdqu	%ymm4, (%rdi,%rsi)
	addq	$32, %rsi
.L438:
	vmovdqa	%ymm0, %ymm3
	movq	-688(%rbp), %r8
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %rbx
	vpmulld	%ymm3, %ymm14, %ymm1
	vmovdqu	%ymm10, (%r8,%rsi)
	vpmulld	%ymm8, %ymm1, %ymm7
	vmovdqu	%ymm7, (%rbx,%rsi)
	addq	$32, %rsi
.L437:
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
	je	.L474
.L479:
	movq	-688(%rbp), %rdi
	movq	-720(%rbp), %rbx
.L351:
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
	jne	.L351
.L474:
	movl	%edx, %esi
	vextracti128	$0x1, %ymm6, %xmm8
	andl	$-8, %esi
	vpextrd	$3, %xmm8, %r8d
	movl	%esi, %ebx
	cmpl	%esi, %edx
	je	.L352
.L350:
	subl	%esi, %edx
	leal	2(%rax), %r13d
	leal	-1(%rdx), %r8d
	cmpl	$2, %r8d
	jbe	.L353
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
	je	.L352
.L353:
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
	jle	.L352
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
	jle	.L352
	addl	%r13d, %edx
	movq	%rdi, %r10
	movl	-656(%rbp), %edi
	leal	3(%rbx), %r8d
	imull	%r11d, %edx
	movl	%edi, 8(%r9,%r10)
	movl	%edx, 8(%rsi,%r10)
.L352:
	movslq	%r8d, %rbx
	cmpl	%ebx, %r12d
	jle	.L484
.L349:
	movl	%r12d, %r13d
	movl	$1, %edi
	subl	%ebx, %r13d
	cmpl	%ebx, %r12d
	cmovg	%r13d, %edi
	decl	%r13d
	cmpl	$6, %r13d
	jbe	.L377
	cmpl	%ebx, %r12d
	jle	.L377
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
	je	.L356
	cmpq	$1, %r8
	je	.L443
	cmpq	$2, %r8
	je	.L444
	cmpq	$3, %r8
	je	.L445
	cmpq	$4, %r8
	je	.L446
	cmpq	$5, %r8
	je	.L447
	cmpq	$6, %r8
	jne	.L491
.L448:
	vmovdqa	%ymm0, %ymm13
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm13, %ymm1, %ymm15
	vpmulld	%ymm10, %ymm15, %ymm6
	vmovdqu	%ymm6, (%rsi,%rdx)
	addq	$32, %rdx
.L447:
	vmovdqa	%ymm0, %ymm2
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm2, %ymm1, %ymm8
	vpmulld	%ymm10, %ymm8, %ymm11
	vmovdqu	%ymm11, (%rsi,%rdx)
	addq	$32, %rdx
.L446:
	vmovdqa	%ymm0, %ymm12
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm12, %ymm1, %ymm5
	vpmulld	%ymm10, %ymm5, %ymm7
	vmovdqu	%ymm7, (%rsi,%rdx)
	addq	$32, %rdx
.L445:
	vmovdqa	%ymm0, %ymm3
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm3, %ymm1, %ymm9
	vpmulld	%ymm10, %ymm9, %ymm13
	vmovdqu	%ymm13, (%rsi,%rdx)
	addq	$32, %rdx
.L444:
	vmovdqa	%ymm0, %ymm15
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm15, %ymm1, %ymm6
	vpmulld	%ymm10, %ymm6, %ymm2
	vmovdqu	%ymm2, (%rsi,%rdx)
	addq	$32, %rdx
.L443:
	vmovdqa	%ymm0, %ymm8
	vmovdqu	%ymm14, (%r9,%rdx)
	vpaddd	%ymm4, %ymm0, %ymm0
	vpmulld	%ymm8, %ymm1, %ymm11
	vpmulld	%ymm10, %ymm11, %ymm12
	vmovdqu	%ymm12, (%rsi,%rdx)
	addq	$32, %rdx
	cmpq	%rdx, %r10
	je	.L473
.L356:
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
	jne	.L356
.L473:
	movl	%edi, %esi
	andl	$-8, %esi
	leal	(%rsi,%rbx), %edx
	cmpl	%esi, %edi
	je	.L484
.L355:
	subl	%esi, %edi
	leal	-1(%rdi), %r9d
	cmpl	$2, %r9d
	jbe	.L492
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
	je	.L484
.L360:
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
	jle	.L484
	addl	%eax, %esi
	addl	$2, %edx
	movl	%r13d, 4(%r8,%rdi)
	movl	%esi, %r9d
	imull	%r11d, %r9d
	movl	%r9d, 4(%r14,%rdi)
	cmpl	%edx, %r12d
	jle	.L484
	addl	%eax, %esi
	movl	%r13d, 8(%r8,%rdi)
	imull	%r11d, %esi
	movl	%esi, 8(%r14,%rdi)
	vzeroupper
	jmp	.L348
.L484:
	vzeroupper
	jmp	.L348
.L481:
	vzeroupper
	jmp	.L339
.L363:
	movl	$37, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cerr, %edi
.LEHB3:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$_ZSt4cerr, %edi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	jmp	.L371
.L490:
	vmovdqa	%ymm0, %ymm15
	movq	-688(%rbp), %rsi
	vpaddd	%ymm11, %ymm0, %ymm0
	movq	-720(%rbp), %r8
	vpmulld	%ymm15, %ymm14, %ymm6
	vmovdqu	%ymm10, (%rsi)
	movl	$32, %esi
	vpmulld	%ymm8, %ymm6, %ymm2
	vmovdqu	%ymm2, (%r8)
	jmp	.L442
.L491:
	vmovdqa	%ymm0, %ymm7
	vmovdqu	%ymm14, (%r9)
	vpaddd	%ymm4, %ymm0, %ymm0
	movl	$32, %edx
	vpmulld	%ymm7, %ymm1, %ymm3
	vpmulld	%ymm10, %ymm3, %ymm9
	vmovdqu	%ymm9, (%rsi)
	jmp	.L448
.L492:
	incl	%eax
	jmp	.L360
.L376:
	xorl	%esi, %esi
	leal	3(%rax), %r9d
	jmp	.L350
.L377:
	movl	%ebx, %edx
	xorl	%esi, %esi
	leal	2(%rax), %r13d
	jmp	.L355
.L488:
	call	_ZSt16__throw_bad_castv
.LEHE3:
.L381:
	movq	%rax, %r15
	jmp	.L372
	.section	.gcc_except_table
.LLSDA3109:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3109-.LLSDACSB3109
.LLSDACSB3109:
	.uleb128 .LEHB0-.LFB3109
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3109
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L381-.LFB3109
	.uleb128 0
	.uleb128 .LEHB2-.LFB3109
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3109
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L381-.LFB3109
	.uleb128 0
.LLSDACSE3109:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC3109
	.type	main.cold, @function
main.cold:
.LFSB3109:
.L372:
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
.LFE3109:
	.section	.gcc_except_table
.LLSDAC3109:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3109-.LLSDACSBC3109
.LLSDACSBC3109:
	.uleb128 .LEHB4-.LCOLDB28
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC3109:
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
.LFB3801:
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
.LFE3801:
	.size	_GLOBAL__sub_I_x, .-_GLOBAL__sub_I_x
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_x
	.globl	semaphores_right
	.bss
	.align 32
	.type	semaphores_right, @object
	.size	semaphores_right, 8960
semaphores_right:
	.zero	8960
	.globl	semaphores_left
	.align 32
	.type	semaphores_left, @object
	.size	semaphores_left, 8960
semaphores_left:
	.zero	8960
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
