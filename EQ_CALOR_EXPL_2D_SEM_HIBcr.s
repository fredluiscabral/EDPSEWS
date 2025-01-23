	.text
	.file	"EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp"
	.globl	_Z5pulsoddddd                   # -- Begin function _Z5pulsoddddd
	.p2align	4, 0x90
	.type	_Z5pulsoddddd,@function
_Z5pulsoddddd:                          # 
	.cfi_startproc
# %bb.0:                                # 
	vsubsd	%xmm1, %xmm3, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vsubsd	%xmm2, %xmm4, %xmm2
	vfnmsub213sd	%xmm1, %xmm2, %xmm2     # xmm2 = -(xmm2 * xmm2) - xmm1
	vmulsd	%xmm0, %xmm2, %xmm0
	jmp	exp@PLT                         # TAILCALL
.Lfunc_end0:
	.size	_Z5pulsoddddd, .Lfunc_end0-_Z5pulsoddddd
	.cfi_endproc
                                        # -- End function
	.globl	_Z18wait_for_neighborsii        # -- Begin function _Z18wait_for_neighborsii
	.p2align	4, 0x90
	.type	_Z18wait_for_neighborsii,@function
_Z18wait_for_neighborsii:               # 
	.cfi_startproc
# %bb.0:                                # 
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movl	%edi, %ebx
	testl	%edi, %edi
	jle	.LBB1_2
# %bb.1:                                # 
	leal	-1(%rbx), %eax
	shlq	$5, %rax
	leaq	semaphores_right(%rax), %rdi
	callq	sem_wait
.LBB1_2:                                # 
	decl	%ebp
	cmpl	%ebx, %ebp
	jle	.LBB1_3
# %bb.4:                                # 
	movslq	%ebx, %rax
	shlq	$5, %rax
	leaq	semaphores_left+32(%rax), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	sem_wait                        # TAILCALL
.LBB1_3:                                # 
	.cfi_def_cfa_offset 32
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	_Z18wait_for_neighborsii, .Lfunc_end1-_Z18wait_for_neighborsii
	.cfi_endproc
                                        # -- End function
	.section	.text.unlikely.,"ax",@progbits
	.globl	_Z11signal_doneii               # -- Begin function _Z11signal_doneii
	.p2align	4, 0x90
	.type	_Z11signal_doneii,@function
_Z11signal_doneii:                      # 
	.cfi_startproc
# %bb.0:                                # 
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movslq	%edi, %rbx
	shlq	$5, %rbx
	leaq	semaphores_left(%rbx), %rdi
	callq	sem_post
	leaq	semaphores_right(%rbx), %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	sem_post                        # TAILCALL
.Lfunc_end2:
	.size	_Z11signal_doneii, .Lfunc_end2-_Z11signal_doneii
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI3_0:
	.quad	0x3ff0000000000000              #  1
.LCPI3_1:
	.quad	0xbfe0000000000000              #  -0.5
.LCPI3_3:
	.quad	0x4330000000000000              #  4503599627370496
.LCPI3_4:
	.quad	0xc059000000000000              #  -100
.LCPI3_11:
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI3_2:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI3_5:
	.long	2                               # 0x2
.LCPI3_9:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
.LCPI3_10:
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI3_6:
	.quad	0                               # 0x0
	.quad	1                               # 0x1
	.quad	2                               # 0x2
	.quad	3                               # 0x3
.LCPI3_7:
	.quad	4                               # 0x4
	.quad	5                               # 0x5
	.quad	6                               # 0x6
	.quad	7                               # 0x7
.LCPI3_8:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
	.long	4                               # 0x4
	.long	6                               # 0x6
	.long	6                               # 0x6
	.long	7                               # 0x7
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # 
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 3, __gxx_personality_v0
	.cfi_lsda 3, .Lexception0
# %bb.0:                                # 
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$824, %rsp                      # imm = 0x338
	.cfi_def_cfa_offset 880
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %ebp
	.cfi_escape 0x2e, 0x00
	movl	$10330094, %esi                 # imm = 0x9D9FEE
	movl	$3, %edi
	callq	__intel_new_feature_proc_init@PLT
	movl	%ebp, 92(%rsp)
	movq	%rbx, 24(%rsp)
	.cfi_escape 0x2e, 0x00
	leaq	92(%rsp), %rdi
	leaq	24(%rsp), %rsi
	callq	MPI_Init
	.cfi_escape 0x2e, 0x00
	movl	$myRank, %esi
	movl	$1140850688, %edi               # imm = 0x44000000
	callq	MPI_Comm_rank
	.cfi_escape 0x2e, 0x00
	movl	$numProcs, %esi
	movl	$1140850688, %edi               # imm = 0x44000000
	callq	MPI_Comm_size
	movq	24(%rsp), %rbx
	movq	8(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	strtod
	vmovsd	%xmm0, gama(%rip)
	movq	16(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	strtod
	vmovsd	%xmm0, tempoFinal(%rip)
	movq	24(%rsp), %rbx
	movq	24(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	strtod
	vmovsd	%xmm0, deltaT(%rip)
	movq	32(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movq	%rax, %r15
	movslq	%r15d, %r12
	movq	%r12, NP(%rip)
	movq	24(%rsp), %rax
	movq	40(%rax), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movq	%rax, %rbp
	movl	%ebp, TILE(%rip)
	leaq	1(%r12), %rax
	movq	%rax, N(%rip)
	vcvtsi2sd	%r12d, %xmm1, %xmm0
	vmovsd	.LCPI3_0(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0]
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, h(%rip)
	vmovsd	%xmm0, deltaX(%rip)
	vmovsd	%xmm0, deltaY(%rip)
	leaq	-1(%r12), %rax
	movslq	numProcs(%rip), %rcx
	movq	%rax, %rdx
	orq	%rcx, %rdx
	shrq	$32, %rdx
	vmovupd	%xmm0, 256(%rsp)                # 16-byte Spill
                                        # AlignMOV convert to UnAlignMOV 
	je	.LBB3_1
# %bb.2:
	cqto
	idivq	%rcx
	movq	%rdx, %r13
	jmp	.LBB3_3
.LBB3_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, %r13d
                                        # kill: def $eax killed $eax def $rax
.LBB3_3:
	movl	%eax, numLocalPontos(%rip)
	movl	%r13d, resto(%rip)
	movl	myRank(%rip), %r8d
	movl	%r8d, %edi
	imull	%eax, %edi
	leal	1(%r8), %edx
	cmpl	%r13d, %r8d
	movl	%r13d, %esi
	cmovll	%r8d, %esi
	cmovll	%edx, %r13d
	movq	%rsi, 96(%rsp)                  # 8-byte Spill
	addl	%edi, %esi
	incl	%esi
	movl	%esi, inicioLocal(%rip)
	addl	%eax, %r13d
	movq	%rdi, 176(%rsp)                 # 8-byte Spill
	leal	(%rdi,%r13), %eax
	movl	%eax, finalLocal(%rip)
	leal	-1(%r8), %edi
	movl	%edi, vizNorte(%rip)
	decl	%ecx
	movq	%r8, 152(%rsp)                  # 8-byte Spill
	cmpl	%ecx, %r8d
	movl	$-1, %ecx
	cmovnel	%edx, %ecx
	movl	%ecx, vizSul(%rip)
	subl	%esi, %eax
	incl	%eax
	movslq	%eax, %r14
	movq	%r14, nN(%rip)
	leaq	2(%r14), %rbx
	movq	NP(%rip), %rcx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	imulq	%rax, %rbx
	shlq	$3, %rbx
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	%r14, 104(%rsp)                 # 8-byte Spill
	cmpl	$-1, %r14d
	vmovupd	256(%rsp), %xmm10               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	jl	.LBB3_14
# %bb.4:
	testl	%r15d, %r15d
	js	.LBB3_14
# %bb.5:                                # 
	incq	104(%rsp)                       # 8-byte Folded Spill
	movslq	%ebp, %rcx
	movl	%ecx, %edx
	movl	%ecx, %eax
	andl	$2147483647, %eax               # imm = 0x7FFFFFFF
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	subl	96(%rsp), %r13d                 # 4-byte Folded Reload
	movslq	%r13d, %rax
	incq	%rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movl	%r15d, %eax
	andl	$2147483647, %eax               # imm = 0x7FFFFFFF
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	vbroadcastsd	%xmm10, %ymm0
	movq	48(%rsp), %rax                  # 8-byte Reload
	movq	%rcx, 184(%rsp)                 # 8-byte Spill
	imulq	%rcx, %rax
	shlq	$3, %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	leaq	(,%rdx,8), %r8
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	8(,%rax,8), %rax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	movq	$0, 56(%rsp)                    # 8-byte Folded Spill
	vmovsd	.LCPI3_1(%rip), %xmm8           # xmm8 = [-5.0E-1,0.0E+0]
	vmovsd	.LCPI3_4(%rip), %xmm9           # xmm9 = [-1.0E+2,0.0E+0]
	movq	__svml_exp4_l9@GOTPCREL(%rip), %r14
	movq	32(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movq	40(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	movq	%r15, 224(%rsp)                 # 8-byte Spill
	movq	%r12, 216(%rsp)                 # 8-byte Spill
	movq	%rbp, 208(%rsp)                 # 8-byte Spill
	movq	%rdx, 200(%rsp)                 # 8-byte Spill
	vmovupd	%ymm0, 272(%rsp)                # 32-byte Spill
	movq	%r8, 192(%rsp)                  # 8-byte Spill
	jmp	.LBB3_6
	.p2align	4, 0x90
.LBB3_83:                               # 
                                        #   in Loop: Header=BB3_6 Depth=1
	movq	56(%rsp), %rcx                  # 8-byte Reload
	addq	184(%rsp), %rcx                 # 8-byte Folded Reload
	movq	48(%rsp), %rax                  # 8-byte Reload
	addq	%rax, 112(%rsp)                 # 8-byte Folded Spill
	addq	%rax, 120(%rsp)                 # 8-byte Folded Spill
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	cmpq	%rcx, 104(%rsp)                 # 8-byte Folded Reload
	jl	.LBB3_14
.LBB3_6:                                # 
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
                                        #       Child Loop BB3_10 Depth 3
                                        #         Child Loop BB3_77 Depth 4
                                        #         Child Loop BB3_13 Depth 4
	testl	%ebp, %ebp
	jle	.LBB3_83
# %bb.7:                                # 
                                        #   in Loop: Header=BB3_6 Depth=1
	movq	168(%rsp), %rax                 # 8-byte Reload
	movq	56(%rsp), %rsi                  # 8-byte Reload
	addq	%rsi, %rax
	leaq	1(%rsi), %rcx
	cmpq	%rcx, %rax
	cmovgq	%rax, %rcx
	movq	%rsi, %rax
	notq	%rax
	addq	%rcx, %rax
	movq	160(%rsp), %rcx                 # 8-byte Reload
	cmpq	%rcx, %rsi
	cmovgq	%rsi, %rcx
	subq	%rsi, %rcx
	cmpq	%rcx, %rax
	cmovbq	%rax, %rcx
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movq	96(%rsp), %rax                  # 8-byte Reload
	addl	%esi, %eax
	addl	176(%rsp), %eax                 # 4-byte Folded Reload
	movq	%rax, (%rsp)                    # 8-byte Spill
	movl	$1, %eax
	movl	$-1, %ecx
	movl	%ebp, %r9d
	movq	128(%rsp), %r10                 # 8-byte Reload
	movq	120(%rsp), %r11                 # 8-byte Reload
	movq	112(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 136(%rsp)                 # 8-byte Spill
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	jmp	.LBB3_8
	.p2align	4, 0x90
.LBB3_81:                               # 
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovsd	72(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	%xmm0, x(%rip)
	vmovsd	%xmm13, y(%rip)
	movq	224(%rsp), %r15                 # 8-byte Reload
	movq	216(%rsp), %r12                 # 8-byte Reload
	movq	208(%rsp), %rbp                 # 8-byte Reload
	movq	200(%rsp), %rdx                 # 8-byte Reload
	movq	192(%rsp), %r8                  # 8-byte Reload
	movl	88(%rsp), %eax                  # 4-byte Reload
	movl	84(%rsp), %ecx                  # 4-byte Reload
	movl	80(%rsp), %r9d                  # 4-byte Reload
	movq	240(%rsp), %r10                 # 8-byte Reload
	movq	232(%rsp), %r11                 # 8-byte Reload
	movq	144(%rsp), %rbx                 # 8-byte Reload
.LBB3_82:                               # 
                                        #   in Loop: Header=BB3_8 Depth=2
	addq	%rdx, %rbx
	addq	%rbp, %rdi
	addq	%r8, 136(%rsp)                  # 8-byte Folded Spill
	addq	%r8, %r11
	subq	%rdx, %r10
	addl	%ebp, %r9d
	addl	%ebp, %eax
	subl	%ebp, %ecx
	cmpl	%r15d, %ebx
	jg	.LBB3_83
.LBB3_8:                                # 
                                        #   Parent Loop BB3_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_10 Depth 3
                                        #         Child Loop BB3_77 Depth 4
                                        #         Child Loop BB3_13 Depth 4
	cmpl	%eax, %r9d
	movl	%eax, %esi
	cmovgl	%r9d, %esi
	addl	%ecx, %esi
	cmpq	%rsi, %r10
	cmovbq	%r10, %rsi
	cmpq	%rbx, %r12
	jl	.LBB3_82
# %bb.9:                                # 
                                        #   in Loop: Header=BB3_8 Depth=2
	movq	%r10, 240(%rsp)                 # 8-byte Spill
	movl	%r9d, 80(%rsp)                  # 4-byte Spill
	movl	%ecx, 84(%rsp)                  # 4-byte Spill
	movl	%eax, 88(%rsp)                  # 4-byte Spill
	incq	%rsi
	movq	128(%rsp), %rdx                 # 8-byte Reload
	subq	%rbx, %rdx
	leal	(%rbx,%rbp), %eax
	leal	1(%rbx), %ecx
	cmpl	%ecx, %eax
	cmovgl	%eax, %ecx
	movq	%rbx, 144(%rsp)                 # 8-byte Spill
	movl	%ebx, %eax
	notl	%eax
	addl	%ecx, %eax
	cmpq	%rax, %rdx
	cmovaeq	%rax, %rdx
	incq	%rdx
	movq	%rdx, 248(%rsp)                 # 8-byte Spill
	movq	%rdx, %rbp
	movabsq	$8589934588, %rax               # imm = 0x1FFFFFFFC
	andq	%rax, %rbp
	movq	%r11, 232(%rsp)                 # 8-byte Spill
	movq	%r11, %r15
	movq	136(%rsp), %r12                 # 8-byte Reload
	xorl	%ecx, %ecx
	jmp	.LBB3_10
	.p2align	4, 0x90
.LBB3_79:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	vextractf128	$1, %ymm14, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm13        # xmm13 = xmm0[1,0]
.LBB3_80:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	movq	64(%rsp), %rax                  # 8-byte Reload
	addq	%rax, %r12
	addq	%rax, %r15
	movq	16(%rsp), %rcx                  # 8-byte Reload
	cmpq	8(%rsp), %rcx                   # 8-byte Folded Reload
	leaq	1(%rcx), %rcx
	movq	__svml_exp4_l9@GOTPCREL(%rip), %r14
	je	.LBB3_81
.LBB3_10:                               # 
                                        #   Parent Loop BB3_6 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB3_77 Depth 4
                                        #         Child Loop BB3_13 Depth 4
	movq	(%rsp), %rax                    # 8-byte Reload
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	addl	%ecx, %eax
	vcvtsi2sd	%eax, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm10, %xmm0
	vmovsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	vaddsd	%xmm0, %xmm8, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm12
	testq	%rbp, %rbp
	je	.LBB3_11
# %bb.76:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	vbroadcastsd	%xmm12, %ymm13
	xorl	%ebx, %ebx
	vmovupd	272(%rsp), %ymm11               # 32-byte Reload
	vpbroadcastq	.LCPI3_3(%rip), %ymm10  # ymm10 = [4.503599627370496E+15,4.503599627370496E+15,4.503599627370496E+15,4.503599627370496E+15]
	vpmovsxbd	.LCPI3_9(%rip), %xmm9   # xmm9 = [0,1,2,3]
	vbroadcastsd	.LCPI3_1(%rip), %ymm8   # ymm8 = [-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1]
	vbroadcastsd	.LCPI3_4(%rip), %ymm15  # ymm15 = [-1.0E+2,-1.0E+2,-1.0E+2,-1.0E+2]
	.p2align	4, 0x90
.LBB3_77:                               # 
                                        #   Parent Loop BB3_6 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        #       Parent Loop BB3_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	leal	(%rdi,%rbx), %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	vpaddd	%xmm0, %xmm9, %xmm0
	vpmovzxdq	%xmm0, %ymm0            # ymm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero
	vpor	%ymm0, %ymm10, %ymm0
	vsubpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm11, %ymm14
	vaddpd	%ymm8, %ymm14, %ymm0
	vfmadd213pd	%ymm13, %ymm0, %ymm0    # ymm0 = (ymm0 * ymm0) + ymm13
	vmulpd	%ymm0, %ymm15, %ymm0
	.cfi_escape 0x2e, 0x00
	callq	*%r14
	vmovupd	%ymm0, (%r15,%rbx,8)
	vmovupd	%ymm0, (%r12,%rbx,8)
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	jb	.LBB3_77
# %bb.78:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	movq	%rbp, %r14
	cmpq	%rbp, 248(%rsp)                 # 8-byte Folded Reload
	vmovsd	.LCPI3_4(%rip), %xmm9           # xmm9 = [-1.0E+2,0.0E+0]
	vmovsd	.LCPI3_1(%rip), %xmm8           # xmm8 = [-5.0E-1,0.0E+0]
	vmovupd	256(%rsp), %xmm10               # 16-byte Reload
                                        # AlignMOV convert to UnAlignMOV 
	je	.LBB3_79
	jmp	.LBB3_12
	.p2align	4, 0x90
.LBB3_11:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	xorl	%r14d, %r14d
.LBB3_12:                               # 
                                        #   in Loop: Header=BB3_10 Depth=3
	movq	144(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%r14), %ebx
	movq	__svml_exp1_l9@GOTPCREL(%rip), %r13
	.p2align	4, 0x90
.LBB3_13:                               # 
                                        #   Parent Loop BB3_6 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        #       Parent Loop BB3_10 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%ebx, %eax
	vcvtsi2sd	%rax, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm10, %xmm13
	vaddsd	%xmm8, %xmm13, %xmm0
	vfmadd213sd	%xmm12, %xmm0, %xmm0    # xmm0 = (xmm0 * xmm0) + xmm12
	vmulsd	%xmm0, %xmm9, %xmm0
	.cfi_escape 0x2e, 0x00
	vzeroupper
	callq	*%r13
	vmovsd	%xmm0, (%r15,%r14,8)
	vmovsd	%xmm0, (%r12,%r14,8)
	incq	%r14
	incl	%ebx
	cmpq	%r14, %rsi
	jne	.LBB3_13
	jmp	.LBB3_80
.LBB3_14:                               # 
	vmovsd	deltaT(%rip), %xmm0             # xmm0 = mem[0],zero
	vmulsd	gama(%rip), %xmm0, %xmm0
	vmulsd	%xmm10, %xmm10, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, alfa(%rip)
	vmovsd	%xmm0, beta_coef(%rip)
	cmpl	$0, 152(%rsp)                   # 4-byte Folded Reload
	jne	.LBB3_16
# %bb.15:                               # 
	.cfi_escape 0x2e, 0x00
	vzeroupper
	callq	omp_get_wtime
	vmovsd	%xmm0, t_ini(%rip)
.LBB3_16:                               # 
	.cfi_escape 0x2e, 0x00
	xorl	%ebp, %ebp
	movl	$.L.kmpc_loc.102.102, %edi
	movl	$main.DIR.OMP.PARALLEL.2, %edx
	movl	$2, %esi
	movq	40(%rsp), %r15                  # 8-byte Reload
	movq	%r15, %rcx
	movq	32(%rsp), %r13                  # 8-byte Reload
	movq	%r13, %r8
	xorl	%eax, %eax
	vzeroupper
	callq	__kmpc_fork_call@PLT
	cmpl	$0, myRank(%rip)
	jne	.LBB3_17
# %bb.21:                               # 
	.cfi_escape 0x2e, 0x00
	callq	omp_get_wtime
	vmovsd	%xmm0, t_fim(%rip)
	cmpl	$0, myRank(%rip)
	je	.LBB3_23
# %bb.22:                               # 
	xorl	%ebp, %ebp
.LBB3_17:                               # 
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
.LBB3_18:                               # 
	movl	nN(%rip), %eax
	addl	$2, %eax
	movl	NP(%rip), %esi
	incl	%esi
	imull	%eax, %esi
	.cfi_escape 0x2e, 0x20
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movq	%r15, %rdi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	movq	%rbp, %rcx
	movq	%r9, %r14
	pushq	$1140850688                     # imm = 0x44000000
	.cfi_adjust_cfa_offset 8
	pushq	$0
	.cfi_adjust_cfa_offset 8
	pushq	$1275070475                     # imm = 0x4C00080B
	.cfi_adjust_cfa_offset 8
	movq	%r8, %rbx
	vzeroupper
	callq	MPI_Gatherv
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	cmpl	$0, myRank(%rip)
	jne	.LBB3_73
# %bb.19:                               # 
	movq	%r14, 64(%rsp)                  # 8-byte Spill
	movq	%rbx, (%rsp)                    # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movl	$_ZSt4cout, %edi
	movl	$.L.str, %esi
	movl	$26, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	vmovsd	t_fim(%rip), %xmm0              # xmm0 = mem[0],zero
	vsubsd	t_ini(%rip), %xmm0, %xmm0
	.cfi_escape 0x2e, 0x00
	movl	$_ZSt4cout, %edi
	callq	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	movl	$.L.str.1, %esi
	movl	$13, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	.cfi_escape 0x2e, 0x00
	movl	$.L.str.2, %esi
	movl	$16, %edx
	movq	%rbx, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	TILE(%rip), %esi
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZNSolsEi
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	movq	240(%rax,%rcx), %rbx
	testq	%rbx, %rbx
	je	.LBB3_20
# %bb.32:                               # 
	cmpb	$0, 56(%rbx)
	je	.LBB3_34
# %bb.33:                               # 
	movzbl	67(%rbx), %ecx
	jmp	.LBB3_35
.LBB3_23:                               # 
	movq	N(%rip), %r14
	leaq	1(%r14), %rdi
	imulq	%r14, %rdi
	shlq	$3, %rdi
	.cfi_escape 0x2e, 0x00
	callq	malloc
	movq	%rax, %rbp
	movslq	numProcs(%rip), %r12
	leaq	(,%r12,4), %rbx
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, (%rsp)                    # 8-byte Spill
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r9
	testq	%r12, %r12
	jle	.LBB3_24
# %bb.25:                               # 
	addq	$-2, %r14
	movq	%r14, %rax
	orq	%r12, %rax
	shrq	$32, %rax
	je	.LBB3_26
# %bb.27:
	movq	%r14, %rax
	cqto
	idivq	%r12
	jmp	.LBB3_28
.LBB3_34:                               # 
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	movq	%rax, %r14
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
	movl	%eax, %ecx
	movq	%r14, %rax
.LBB3_35:                               # 
	.cfi_escape 0x2e, 0x00
	movsbl	%cl, %esi
	movq	%rax, %rdi
	callq	_ZNSo3putEc
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
	.cfi_escape 0x2e, 0x00
	leaq	312(%rsp), %rdi
	movl	$.L.str.3, %esi
	movl	$16, %edx
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode
	leaq	424(%rsp), %rdi
	.cfi_escape 0x2e, 0x00
	callq	_ZNKSt12__basic_fileIcE7is_openEv
	testb	%al, %al
	je	.LBB3_62
# %bb.36:                               # 
	movq	N(%rip), %rax
	testq	%rax, %rax
	jle	.LBB3_47
# %bb.37:                               # 
	xorl	%r12d, %r12d
	leaq	312(%rsp), %r13
	movq	$0, 8(%rsp)                     # 8-byte Folded Spill
	jmp	.LBB3_38
	.p2align	4, 0x90
.LBB3_58:                               # 
                                        #   in Loop: Header=BB3_38 Depth=1
	movq	8(%rsp), %rdx                   # 8-byte Reload
	addq	$100, %rdx
	addq	$800, %r12                      # imm = 0x320
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	cmpq	%rdx, %rax
	jle	.LBB3_47
.LBB3_38:                               # 
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_40 Depth 2
	testq	%rax, %rax
	jle	.LBB3_58
# %bb.39:                               # 
                                        #   in Loop: Header=BB3_38 Depth=1
	vcvtsi2sdl	8(%rsp), %xmm11, %xmm0  # 4-byte Folded Reload
	vmovsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_40:                               # 
                                        #   Parent Loop BB3_38 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovsd	h(%rip), %xmm0                  # xmm0 = mem[0],zero
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	vmulsd	72(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
.Ltmp13:
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_
.Ltmp14:
# %bb.41:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp15:
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	movl	$.L.str.4, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.Ltmp16:
# %bb.42:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp17:
	vcvtsi2sd	%r15d, %xmm2, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_
.Ltmp18:
# %bb.43:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp19:
	movq	%rax, %r14
	.cfi_escape 0x2e, 0x00
	movl	$.L.str.4, %esi
	movl	$1, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.Ltmp20:
# %bb.44:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	movq	NP(%rip), %rax
	incq	%rax
	imulq	%r12, %rax
	addq	%rbp, %rax
	vmovsd	(%rax,%r15,8), %xmm0            # xmm0 = mem[0],zero
.Ltmp21:
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_
.Ltmp22:
# %bb.45:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB3_46
# %bb.51:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	cmpb	$0, 56(%rbx)
	je	.LBB3_53
# %bb.52:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	movzbl	67(%rbx), %eax
	jmp	.LBB3_55
	.p2align	4, 0x90
.LBB3_53:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp23:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
.Ltmp24:
# %bb.54:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	movq	(%rbx), %rax
.Ltmp25:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.Ltmp26:
.LBB3_55:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp27:
	.cfi_escape 0x2e, 0x00
	movsbl	%al, %esi
	movq	%r14, %rdi
	callq	_ZNSo3putEc
.Ltmp28:
# %bb.56:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
.Ltmp29:
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
.Ltmp30:
# %bb.57:                               # 
                                        #   in Loop: Header=BB3_40 Depth=2
	addq	$100, %r15
	movq	N(%rip), %rax
	cmpq	%r15, %rax
	jg	.LBB3_40
	jmp	.LBB3_58
.LBB3_62:                               # 
.Ltmp0:
	.cfi_escape 0x2e, 0x00
	movl	$_ZSt4cerr, %edi
	movl	$.L.str.5, %esi
	movl	$37, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.Ltmp1:
# %bb.63:                               # 
	movq	_ZSt4cerr(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cerr+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB3_64
# %bb.66:                               # 
	cmpb	$0, 56(%rbx)
	je	.LBB3_68
# %bb.67:                               # 
	movzbl	67(%rbx), %eax
	jmp	.LBB3_70
.LBB3_47:                               # 
.Ltmp32:
	leaq	320(%rsp), %rdi
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.Ltmp33:
	movq	40(%rsp), %r15                  # 8-byte Reload
	movq	32(%rsp), %r13                  # 8-byte Reload
# %bb.48:                               # 
	testq	%rax, %rax
	jne	.LBB3_72
# %bb.49:                               # 
	movq	312(%rsp), %rax
	movq	-24(%rax), %rax
	leaq	(%rsp,%rax), %rdi
	addq	$312, %rdi                      # imm = 0x138
	movl	344(%rsp,%rax), %esi
	orl	$4, %esi
.Ltmp34:
	.cfi_escape 0x2e, 0x00
	callq	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.Ltmp35:
	jmp	.LBB3_72
.LBB3_68:                               # 
.Ltmp2:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv
.Ltmp3:
# %bb.69:                               # 
	movq	(%rbx), %rax
.Ltmp4:
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	*48(%rax)
.Ltmp5:
.LBB3_70:                               # 
.Ltmp6:
	.cfi_escape 0x2e, 0x00
	movsbl	%al, %esi
	movl	$_ZSt4cerr, %edi
	callq	_ZNSo3putEc
.Ltmp7:
# %bb.71:                               # 
.Ltmp8:
	.cfi_escape 0x2e, 0x00
	movq	%rax, %rdi
	callq	_ZNSo5flushEv
.Ltmp9:
.LBB3_72:                               # 
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	callq	free
	.cfi_escape 0x2e, 0x00
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	free
	.cfi_escape 0x2e, 0x00
	movq	64(%rsp), %rdi                  # 8-byte Reload
	callq	free
	.cfi_escape 0x2e, 0x00
	leaq	312(%rsp), %rdi
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.LBB3_73:                               # 
	.cfi_escape 0x2e, 0x00
	callq	MPI_Finalize
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	callq	free
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$824, %rsp                      # imm = 0x338
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB3_24:                               # 
	.cfi_def_cfa_offset 880
	movq	(%rsp), %r8                     # 8-byte Reload
	jmp	.LBB3_18
.LBB3_26:
	movl	%r14d, %eax
	xorl	%edx, %edx
	divl	%r12d
                                        # kill: def $eax killed $eax def $rax
.LBB3_28:
	movq	(%rsp), %r8                     # 8-byte Reload
	movslq	resto(%rip), %rcx
	movl	NP(%rip), %edx
	incl	%edx
	movq	%r12, %rsi
	andq	$2147483640, %rsi               # imm = 0x7FFFFFF8
	je	.LBB3_29
# %bb.84:                               # 
	vmovq	%rcx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmovd	%eax, %xmm1
	vpbroadcastd	%xmm1, %ymm3
	vmovd	%edx, %xmm1
	vpbroadcastd	%xmm1, %ymm1
	vpbroadcastd	.LCPI3_5(%rip), %ymm2   # ymm2 = [2,2,2,2,2,2,2,2]
	vpaddd	%ymm2, %ymm3, %ymm2
	vpcmpeqd	%ymm4, %ymm4, %ymm4
	vpsubd	%ymm4, %ymm3, %ymm3
	xorl	%edi, %edi
	vpmovsxbq	.LCPI3_9(%rip), %ymm4   # ymm4 = [0,1,2,3]
	vpmovsxbq	.LCPI3_10(%rip), %ymm5  # ymm5 = [4,5,6,7]
	vpmovsxbd	.LCPI3_11(%rip), %ymm6  # ymm6 = [0,2,4,6,4,6,6,7]
	.p2align	4, 0x90
.LBB3_85:                               # 
                                        # =>This Inner Loop Header: Depth=1
	vmovq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpaddq	%ymm4, %ymm7, %ymm8
	vpaddq	%ymm5, %ymm7, %ymm7
	vpcmpgtq	%ymm7, %ymm0, %ymm9
	vpcmpgtq	%ymm8, %ymm0, %ymm10
	vpackssdw	%ymm9, %ymm10, %ymm9
	vpermq	$216, %ymm9, %ymm9              # ymm9 = ymm9[0,2,1,3]
	vpsubd	%ymm9, %ymm2, %ymm10
	vpmulld	%ymm1, %ymm10, %ymm10
	vmovdqu	%ymm10, (%r8,%rdi,4)
	vpermd	%ymm8, %ymm6, %ymm8
	vpermd	%ymm7, %ymm6, %ymm7
	vinserti128	$1, %xmm7, %ymm8, %ymm7
	vpmulld	%ymm7, %ymm1, %ymm7
	vpsubd	%ymm9, %ymm3, %ymm8
	vpmulld	%ymm8, %ymm7, %ymm7
	vmovdqu	%ymm7, (%r9,%rdi,4)
	addq	$8, %rdi
	cmpq	%rsi, %rdi
	jb	.LBB3_85
# %bb.86:                               # 
	cmpq	%r12, %rsi
	je	.LBB3_18
	jmp	.LBB3_30
.LBB3_29:
	xorl	%esi, %esi
.LBB3_30:                               # 
	leal	2(%rax), %edi
	incl	%eax
	movl	%edx, %r11d
	imull	%esi, %r11d
	.p2align	4, 0x90
.LBB3_31:                               # 
                                        # =>This Inner Loop Header: Depth=1
	movq	%r9, %rbx
	xorl	%r9d, %r9d
	cmpq	%rcx, %rsi
	setl	%r9b
	leal	(%rdi,%r9), %r10d
	imull	%edx, %r10d
	movl	%r10d, (%r8,%rsi,4)
	addl	%eax, %r9d
	imull	%r11d, %r9d
	movl	%r9d, (%rbx,%rsi,4)
	movq	%rbx, %r9
	incq	%rsi
	addl	%edx, %r11d
	cmpq	%rsi, %r12
	jne	.LBB3_31
	jmp	.LBB3_18
.LBB3_46:                               # 
.Ltmp37:
	.cfi_escape 0x2e, 0x00
	callq	_ZSt16__throw_bad_castv
.Ltmp38:
# %bb.50:                               # 
.LBB3_20:                               # 
	.cfi_escape 0x2e, 0x00
	callq	_ZSt16__throw_bad_castv
.LBB3_64:                               # 
.Ltmp10:
	.cfi_escape 0x2e, 0x00
	callq	_ZSt16__throw_bad_castv
.Ltmp11:
# %bb.65:                               # 
.LBB3_61:                               # 
.Ltmp36:
	jmp	.LBB3_75
.LBB3_74:                               # 
.Ltmp12:
	jmp	.LBB3_75
.LBB3_60:                               # 
.Ltmp39:
	jmp	.LBB3_75
.LBB3_59:                               # 
.Ltmp31:
.LBB3_75:                               # 
	movq	%rax, %rbx
	.cfi_escape 0x2e, 0x00
	leaq	312(%rsp), %rdi
	callq	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2, 0x0
GCC_except_table3:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    # >> Call Site 1 <<
	.uleb128 .Ltmp13-.Lfunc_begin0          #   Call between .Lfunc_begin0 and .Ltmp13
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp13-.Lfunc_begin0          # >> Call Site 2 <<
	.uleb128 .Ltmp30-.Ltmp13                #   Call between .Ltmp13 and .Ltmp30
	.uleb128 .Ltmp31-.Lfunc_begin0          #     jumps to .Ltmp31
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp12-.Lfunc_begin0          #     jumps to .Ltmp12
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp32-.Lfunc_begin0          # >> Call Site 4 <<
	.uleb128 .Ltmp35-.Ltmp32                #   Call between .Ltmp32 and .Ltmp35
	.uleb128 .Ltmp36-.Lfunc_begin0          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp2-.Lfunc_begin0           # >> Call Site 5 <<
	.uleb128 .Ltmp9-.Ltmp2                  #   Call between .Ltmp2 and .Ltmp9
	.uleb128 .Ltmp12-.Lfunc_begin0          #     jumps to .Ltmp12
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp9-.Lfunc_begin0           # >> Call Site 6 <<
	.uleb128 .Ltmp37-.Ltmp9                 #   Call between .Ltmp9 and .Ltmp37
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp37-.Lfunc_begin0          # >> Call Site 7 <<
	.uleb128 .Ltmp38-.Ltmp37                #   Call between .Ltmp37 and .Ltmp38
	.uleb128 .Ltmp39-.Lfunc_begin0          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp38-.Lfunc_begin0          # >> Call Site 8 <<
	.uleb128 .Ltmp10-.Ltmp38                #   Call between .Ltmp38 and .Ltmp10
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp10-.Lfunc_begin0          # >> Call Site 9 <<
	.uleb128 .Ltmp11-.Ltmp10                #   Call between .Ltmp10 and .Ltmp11
	.uleb128 .Ltmp12-.Lfunc_begin0          #     jumps to .Ltmp12
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp11-.Lfunc_begin0          # >> Call Site 10 <<
	.uleb128 .Lfunc_end3-.Ltmp11            #   Call between .Ltmp11 and .Lfunc_end3
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp
	.type	_GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp,@function
_GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp: # 
	.cfi_startproc
# %bb.0:                                # 
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	callq	_ZNSt8ios_base4InitC1Ev
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	movl	$_ZStL8__ioinit, %esi
	movl	$__dso_handle, %edx
	popq	%rax
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit                    # TAILCALL
.Lfunc_end4:
	.size	_GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp, .Lfunc_end4-_GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main.DIR.OMP.PARALLEL.2
.LCPI5_0:
	.quad	0x3fe0000000000000              #  0.5
.LCPI5_1:
	.quad	0xc000000000000000              #  -2
.LCPI5_2:
	.quad	0x3ff0000000000000              #  1
.LCPI5_3:
	.quad	0x4000000000000000              #  2
	.text
	.p2align	4, 0x90
	.type	main.DIR.OMP.PARALLEL.2,@function
main.DIR.OMP.PARALLEL.2:                # 
	.cfi_startproc
# %bb.0:                                # 
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$280, %rsp                      # imm = 0x118
	.cfi_def_cfa_offset 336
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, 88(%rsp)                  # 8-byte Spill
	movq	%rdx, 176(%rsp)                 # 8-byte Spill
	movq	%rdi, %r13
	callq	omp_get_thread_num
	movl	%eax, %ebx
	callq	omp_get_num_threads
	movl	%eax, %ecx
	movq	nN(%rip), %rax
	movl	%ecx, %esi
	movq	%rax, %rcx
	shrq	$32, %rcx
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	je	.LBB5_1
# %bb.2:
	cqto
	idivq	%rsi
	movq	%rax, %r14
	jmp	.LBB5_3
.LBB5_1:
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%esi
                                        # kill: def $edx killed $edx def $rdx
	movl	%eax, %r14d
.LBB5_3:
	cmpl	%edx, %ebx
	movl	%edx, %r12d
	cmovll	%ebx, %r12d
	movq	%rbx, 184(%rsp)                 # 8-byte Spill
	leal	1(%rbx), %r15d
	cmovll	%r15d, %edx
	movq	%rdx, 96(%rsp)                  # 8-byte Spill
	movl	(%r13), %esi
	movl	$.L.kmpc_loc.120.120, %edi
	xorl	%edx, %edx
	callq	__kmpc_masked@PLT
	cmpl	$1, %eax
	jne	.LBB5_11
# %bb.4:                                # 
	movq	%r14, 56(%rsp)                  # 8-byte Spill
	#MEMBARRIER
	cmpl	$8, 8(%rsp)                     # 4-byte Folded Reload
	jb	.LBB5_7
# %bb.5:                                # 
	movq	8(%rsp), %rbx                   # 8-byte Reload
	shlq	$5, %rbx
	andq	$-256, %rbx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB5_6:                                # 
                                        # =>This Inner Loop Header: Depth=1
	leaq	semaphores_left(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+32(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+32(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+64(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+64(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+96(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+96(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+128(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+128(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+160(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+160(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+192(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+192(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_left+224(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	leaq	semaphores_right+224(%r14), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	addq	$256, %r14                      # imm = 0x100
	cmpq	%r14, %rbx
	jne	.LBB5_6
.LBB5_7:                                # 
	movq	8(%rsp), %r14                   # 8-byte Reload
	movl	%r14d, %eax
	andl	$2147483640, %eax               # imm = 0x7FFFFFF8
	subq	%rax, %r14
	je	.LBB5_10
# %bb.8:                                # 
	movq	8(%rsp), %rax                   # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax def $rax
	shrl	$3, %eax
	shlq	$8, %rax
	leaq	semaphores_right(%rax), %rbx
	leaq	semaphores_left(%rax), %rbp
	.p2align	4, 0x90
.LBB5_9:                                # 
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	sem_init
	addq	$32, %rbx
	addq	$32, %rbp
	decq	%r14
	jne	.LBB5_9
.LBB5_10:                               # 
	#MEMBARRIER
	movl	(%r13), %esi
	movl	$.L.kmpc_loc.120.120.7, %edi
	callq	__kmpc_end_masked@PLT
	movq	56(%rsp), %r14                  # 8-byte Reload
.LBB5_11:                               # 
	#MEMBARRIER
	movl	(%r13), %esi
	movl	$.L.kmpc_loc.128.128, %edi
	callq	__kmpc_barrier@PLT
	vmovsd	tempoFinal(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	.LCPI5_0(%rip), %xmm0, %xmm0
	vxorpd	%xmm5, %xmm5, %xmm5
	vucomisd	%xmm5, %xmm0
	jbe	.LBB5_134
# %bb.12:                               # 
	movq	184(%rsp), %rcx                 # 8-byte Reload
	movl	%ecx, %eax
	imull	%r14d, %eax
	movq	96(%rsp), %rdx                  # 8-byte Reload
	addl	%r14d, %edx
	addl	%eax, %edx
	leal	(%rax,%r12), %esi
	incl	%esi
	leal	-1(%rcx), %eax
	shlq	$5, %rax
	leaq	semaphores_right(%rax), %rax
	movq	%rax, 240(%rsp)                 # 8-byte Spill
	movq	8(%rsp), %rax                   # 8-byte Reload
	decl	%eax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movl	%r15d, %eax
	shlq	$5, %rax
	leaq	semaphores_left(%rax), %rax
	movq	%rax, 232(%rsp)                 # 8-byte Spill
	movl	%esi, 132(%rsp)                 # 4-byte Spill
	movslq	%esi, %rsi
	movq	%rdx, 96(%rsp)                  # 8-byte Spill
	movslq	%edx, %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	leaq	1(%rsi), %rax
	movq	%rax, 216(%rsp)                 # 8-byte Spill
	movq	88(%rsp), %rax                  # 8-byte Reload
	leaq	8(%rax), %rcx
	movq	%rcx, 248(%rsp)                 # 8-byte Spill
	leaq	(,%rsi,8), %rcx
	movq	%rcx, 208(%rsp)                 # 8-byte Spill
	movq	176(%rsp), %rcx                 # 8-byte Reload
	leaq	16(%rcx), %rdx
	movq	%rdx, 256(%rsp)                 # 8-byte Spill
	addq	$8, %rcx
	movq	%rcx, 176(%rsp)                 # 8-byte Spill
	leaq	8(,%rsi,8), %rcx
	movq	%rcx, 200(%rsp)                 # 8-byte Spill
	movq	%rsi, 224(%rsp)                 # 8-byte Spill
	leaq	-8(,%rsi,8), %rcx
	movq	%rcx, 192(%rsp)                 # 8-byte Spill
	addq	$16, %rax
	movq	%rax, 264(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI5_1(%rip), %xmm6           # xmm6 = [-2.0E+0,0.0E+0]
.LBB5_13:                               # 
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_16 Depth 2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_19 Depth 4
                                        #           Child Loop BB5_30 Depth 5
                                        #     Child Loop BB5_46 Depth 2
                                        #       Child Loop BB5_48 Depth 3
                                        #         Child Loop BB5_49 Depth 4
                                        #           Child Loop BB5_60 Depth 5
                                        #     Child Loop BB5_76 Depth 2
                                        #       Child Loop BB5_78 Depth 3
                                        #         Child Loop BB5_79 Depth 4
                                        #           Child Loop BB5_90 Depth 5
                                        #     Child Loop BB5_106 Depth 2
                                        #       Child Loop BB5_108 Depth 3
                                        #         Child Loop BB5_109 Depth 4
                                        #           Child Loop BB5_120 Depth 5
	movl	132(%rsp), %eax                 # 4-byte Reload
	cmpl	96(%rsp), %eax                  # 4-byte Folded Reload
	jg	.LBB5_22
# %bb.14:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	N(%rip), %rax
	cmpq	$3, %rax
	jge	.LBB5_15
.LBB5_22:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	vaddsd	deltaT(%rip), %xmm5, %xmm5
	vmovsd	%xmm5, 272(%rsp)                # 8-byte Spill
	movq	184(%rsp), %r15                 # 8-byte Reload
	movl	%r15d, %edi
	callq	_Z11signal_doneii
	testl	%r15d, %r15d
	jne	.LBB5_23
# %bb.24:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jg	.LBB5_25
.LBB5_26:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testl	%r15d, %r15d
	jne	.LBB5_27
.LBB5_35:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizNorte(%rip), %ecx
	xorl	%ebp, %ebp
	cmpl	$-1, %ecx
	setne	%bl
	je	.LBB5_37
# %bb.36:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rsi,8), %rdi
	addq	$8, %rdi
	incq	%rsi
	leaq	64(%rsp), %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movl	NP(%rip), %esi
	incl	%esi
	movl	vizNorte(%rip), %ecx
	leaq	68(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%r14, %rdi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
	movl	$2, %ebp
.LBB5_37:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	jne	.LBB5_40
# %bb.38:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	jne	.LBB5_39
.LBB5_40:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	%bl, %bl
	jne	.LBB5_41
	jmp	.LBB5_42
	.p2align	4, 0x90
.LBB5_23:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	240(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jle	.LBB5_26
.LBB5_25:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	232(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	testl	%r15d, %r15d
	je	.LBB5_35
.LBB5_27:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	vmovsd	.LCPI5_3(%rip), %xmm3           # xmm3 = [2.0E+0,0.0E+0]
	vmovsd	.LCPI5_2(%rip), %xmm4           # xmm4 = [1.0E+0,0.0E+0]
	jne	.LBB5_43
# %bb.28:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.LBB5_40
.LBB5_39:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	incq	%rsi
	movq	nN(%rip), %rax
	imulq	%rsi, %rax
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rax,8), %rdi
	movl	%ebp, %ebx
	leaq	(%rsp,%rbx,4), %rax
	addq	$64, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movq	nN(%rip), %rax
	incq	%rax
	movq	NP(%rip), %rsi
	incq	%rsi
	imulq	%rsi, %rax
	leaq	(%r14,%rax,8), %rdi
	movl	vizSul(%rip), %ecx
	addl	$2, %ebp
	leaq	(%rsp,%rbx,4), %rax
	addq	$68, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
.LBB5_41:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	$1, %edx
	movl	%ebp, %edi
	leaq	64(%rsp), %rsi
	callq	MPI_Waitall
.LBB5_42:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	vmovsd	.LCPI5_3(%rip), %xmm3           # xmm3 = [2.0E+0,0.0E+0]
	vmovsd	.LCPI5_2(%rip), %xmm4           # xmm4 = [1.0E+0,0.0E+0]
.LBB5_43:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r15d, 132(%rsp)                # 4-byte Folded Reload
	jg	.LBB5_52
# %bb.44:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	N(%rip), %rax
	vmovsd	alfa(%rip), %xmm0               # xmm0 = mem[0],zero
	vmovsd	beta_coef(%rip), %xmm1          # xmm1 = mem[0],zero
	vaddsd	%xmm0, %xmm1, %xmm2
	vfmadd132sd	%xmm3, %xmm4, %xmm2     # xmm2 = (xmm2 * xmm3) + xmm4
	cmpq	$3, %rax
	jge	.LBB5_45
.LBB5_52:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	184(%rsp), %r15                 # 8-byte Reload
	movl	%r15d, %edi
	callq	_Z11signal_doneii
	testl	%r15d, %r15d
	jne	.LBB5_53
# %bb.54:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jg	.LBB5_55
.LBB5_56:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testl	%r15d, %r15d
	jne	.LBB5_57
.LBB5_65:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizNorte(%rip), %ecx
	xorl	%ebp, %ebp
	cmpl	$-1, %ecx
	setne	%bl
	je	.LBB5_67
# %bb.66:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rsi,8), %rdi
	addq	$8, %rdi
	incq	%rsi
	leaq	64(%rsp), %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movl	NP(%rip), %esi
	incl	%esi
	movl	vizNorte(%rip), %ecx
	leaq	68(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%r14, %rdi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
	movl	$2, %ebp
.LBB5_67:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	jne	.LBB5_70
# %bb.68:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	jne	.LBB5_69
.LBB5_70:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	%bl, %bl
	jne	.LBB5_71
	jmp	.LBB5_72
	.p2align	4, 0x90
.LBB5_53:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	240(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jle	.LBB5_56
.LBB5_55:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	232(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	testl	%r15d, %r15d
	je	.LBB5_65
.LBB5_57:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	vmovsd	.LCPI5_1(%rip), %xmm3           # xmm3 = [-2.0E+0,0.0E+0]
	jne	.LBB5_73
# %bb.58:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.LBB5_70
.LBB5_69:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	incq	%rsi
	movq	nN(%rip), %rax
	imulq	%rsi, %rax
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rax,8), %rdi
	movl	%ebp, %ebx
	leaq	(%rsp,%rbx,4), %rax
	addq	$64, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movq	nN(%rip), %rax
	incq	%rax
	movq	NP(%rip), %rsi
	incq	%rsi
	imulq	%rsi, %rax
	leaq	(%r14,%rax,8), %rdi
	movl	vizSul(%rip), %ecx
	addl	$2, %ebp
	leaq	(%rsp,%rbx,4), %rax
	addq	$68, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
.LBB5_71:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	$1, %edx
	movl	%ebp, %edi
	leaq	64(%rsp), %rsi
	callq	MPI_Waitall
.LBB5_72:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	vmovsd	.LCPI5_1(%rip), %xmm3           # xmm3 = [-2.0E+0,0.0E+0]
.LBB5_73:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r15d, 132(%rsp)                # 4-byte Folded Reload
	jg	.LBB5_82
# %bb.74:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	N(%rip), %rax
	cmpq	$3, %rax
	jge	.LBB5_75
.LBB5_82:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	184(%rsp), %r15                 # 8-byte Reload
	movl	%r15d, %edi
	callq	_Z11signal_doneii
	testl	%r15d, %r15d
	jne	.LBB5_83
# %bb.84:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jg	.LBB5_85
.LBB5_86:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testl	%r15d, %r15d
	jne	.LBB5_87
.LBB5_95:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizNorte(%rip), %ecx
	xorl	%ebp, %ebp
	cmpl	$-1, %ecx
	setne	%bl
	je	.LBB5_97
# %bb.96:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rsi,8), %rdi
	addq	$8, %rdi
	incq	%rsi
	leaq	64(%rsp), %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movl	NP(%rip), %esi
	incl	%esi
	movl	vizNorte(%rip), %ecx
	leaq	68(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%r14, %rdi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
	movl	$2, %ebp
.LBB5_97:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	jne	.LBB5_100
# %bb.98:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	jne	.LBB5_99
.LBB5_100:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	%bl, %bl
	jne	.LBB5_101
	jmp	.LBB5_102
	.p2align	4, 0x90
.LBB5_83:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	240(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jle	.LBB5_86
.LBB5_85:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	232(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
	testl	%r15d, %r15d
	je	.LBB5_95
.LBB5_87:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	movq	96(%rsp), %r15                  # 8-byte Reload
	vmovsd	.LCPI5_3(%rip), %xmm4           # xmm4 = [2.0E+0,0.0E+0]
	vmovsd	.LCPI5_2(%rip), %xmm5           # xmm5 = [1.0E+0,0.0E+0]
	jne	.LBB5_103
# %bb.88:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.LBB5_100
.LBB5_99:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	incq	%rsi
	movq	nN(%rip), %rax
	imulq	%rsi, %rax
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rax,8), %rdi
	movl	%ebp, %ebx
	leaq	(%rsp,%rbx,4), %rax
	addq	$64, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movq	nN(%rip), %rax
	incq	%rax
	movq	NP(%rip), %rsi
	incq	%rsi
	imulq	%rsi, %rax
	leaq	(%r14,%rax,8), %rdi
	movl	vizSul(%rip), %ecx
	addl	$2, %ebp
	leaq	(%rsp,%rbx,4), %rax
	addq	$68, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
.LBB5_101:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	$1, %edx
	movl	%ebp, %edi
	leaq	64(%rsp), %rsi
	callq	MPI_Waitall
.LBB5_102:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	vmovsd	.LCPI5_3(%rip), %xmm4           # xmm4 = [2.0E+0,0.0E+0]
	vmovsd	.LCPI5_2(%rip), %xmm5           # xmm5 = [1.0E+0,0.0E+0]
.LBB5_103:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r15d, 132(%rsp)                # 4-byte Folded Reload
	jg	.LBB5_112
# %bb.104:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	N(%rip), %rax
	cmpq	$3, %rax
	jge	.LBB5_105
.LBB5_112:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	184(%rsp), %r15                 # 8-byte Reload
	movl	%r15d, %edi
	callq	_Z11signal_doneii
	testl	%r15d, %r15d
	je	.LBB5_114
# %bb.113:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	240(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
.LBB5_114:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r15d, %r12d
	jle	.LBB5_116
# %bb.115:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	232(%rsp), %rdi                 # 8-byte Reload
	callq	sem_wait
.LBB5_116:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testl	%r15d, %r15d
	je	.LBB5_125
# %bb.117:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	cmpl	%r12d, %r15d
	jne	.LBB5_133
# %bb.118:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	jmp	.LBB5_129
	.p2align	4, 0x90
.LBB5_125:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizNorte(%rip), %ecx
	cmpl	$-1, %ecx
	setne	%bl
	je	.LBB5_126
# %bb.127:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rsi,8), %rdi
	addq	$8, %rdi
	incq	%rsi
	leaq	64(%rsp), %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movl	NP(%rip), %esi
	incl	%esi
	movl	vizNorte(%rip), %ecx
	leaq	68(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%r14, %rdi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
	movl	$2, %ebp
	cmpl	%r12d, %r15d
	je	.LBB5_129
	jmp	.LBB5_131
	.p2align	4, 0x90
.LBB5_15:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$-2, %rax
	movq	NP(%rip), %rcx
	leaq	1(%rcx), %rsi
	vmovsd	alfa(%rip), %xmm0               # xmm0 = mem[0],zero
	vmovsd	beta_coef(%rip), %xmm1          # xmm1 = mem[0],zero
	movslq	TILE(%rip), %rdi
	movl	%edi, %r8d
	movq	m(%rip), %rdx
	addq	216(%rsp), %rdx                 # 8-byte Folded Reload
	movq	%rdx, 40(%rsp)                  # 8-byte Spill
	movq	208(%rsp), %r9                  # 8-byte Reload
	imulq	%rsi, %r9
	movq	248(%rsp), %rdx                 # 8-byte Reload
	addq	%r9, %rdx
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movq	%rsi, %rdx
	imulq	%rdi, %rdx
	shlq	$3, %rdx
	movq	%rdx, 136(%rsp)                 # 8-byte Spill
	leaq	(,%r8,8), %rdx
	movq	%rdx, 152(%rsp)                 # 8-byte Spill
	leaq	8(,%rcx,8), %rbp
	addq	256(%rsp), %r9                  # 8-byte Folded Reload
	movq	%r9, 32(%rsp)                   # 8-byte Spill
	movq	200(%rsp), %rdx                 # 8-byte Reload
	imulq	%rsi, %rdx
	movq	176(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, %rdx
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	imulq	192(%rsp), %rsi                 # 8-byte Folded Reload
	addq	%rcx, %rsi
	movq	%rsi, 48(%rsp)                  # 8-byte Spill
	movq	224(%rsp), %rsi                 # 8-byte Reload
	movq	%rdi, 144(%rsp)                 # 8-byte Spill
	movq	%r8, 104(%rsp)                  # 8-byte Spill
	jmp	.LBB5_16
	.p2align	4, 0x90
.LBB5_21:                               # 
                                        #   in Loop: Header=BB5_16 Depth=2
	movq	144(%rsp), %rdi                 # 8-byte Reload
	addq	%rdi, 40(%rsp)                  # 8-byte Folded Spill
	movq	136(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, 24(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 32(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 16(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 48(%rsp)                  # 8-byte Folded Spill
	movq	%r14, %rsi
	cmpq	56(%rsp), %r14                  # 8-byte Folded Reload
	jg	.LBB5_22
.LBB5_16:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_18 Depth 3
                                        #         Child Loop BB5_19 Depth 4
                                        #           Child Loop BB5_30 Depth 5
	leaq	(%rsi,%rdi), %r14
	testl	%r8d, %r8d
	jle	.LBB5_21
# %bb.17:                               # 
                                        #   in Loop: Header=BB5_16 Depth=2
	movl	$1, %edx
	movq	48(%rsp), %rcx                  # 8-byte Reload
	movq	16(%rsp), %r15                  # 8-byte Reload
	movq	32(%rsp), %r9                   # 8-byte Reload
	movq	24(%rsp), %rbx                  # 8-byte Reload
	movq	40(%rsp), %r12                  # 8-byte Reload
	movq	%rsi, 160(%rsp)                 # 8-byte Spill
	jmp	.LBB5_18
	.p2align	4, 0x90
.LBB5_20:                               # 
                                        #   in Loop: Header=BB5_18 Depth=3
	movq	104(%rsp), %r8                  # 8-byte Reload
	addq	%r8, %r12
	movq	152(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, %rbx
	movq	112(%rsp), %r9                  # 8-byte Reload
	addq	%rcx, %r9
	movq	120(%rsp), %r15                 # 8-byte Reload
	addq	%rcx, %r15
	movq	168(%rsp), %rsi                 # 8-byte Reload
	addq	%rcx, %rsi
	movq	%rsi, %rcx
	cmpq	%rdx, %rax
	movq	160(%rsp), %rsi                 # 8-byte Reload
	jl	.LBB5_21
.LBB5_18:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_16 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_19 Depth 4
                                        #           Child Loop BB5_30 Depth 5
	movq	%rdx, %rdi
	addq	%r8, %rdx
	movq	%rcx, 168(%rsp)                 # 8-byte Spill
	movq	%r15, 120(%rsp)                 # 8-byte Spill
	movq	%r9, 112(%rsp)                  # 8-byte Spill
	movq	%r9, %r8
	movq	%rbx, %r9
	movq	%r12, %r10
	jmp	.LBB5_19
	.p2align	4, 0x90
.LBB5_34:                               # 
                                        #   in Loop: Header=BB5_19 Depth=4
	incq	%r10
	addq	%rbp, %r9
	addq	%rbp, %r8
	addq	%rbp, %r15
	addq	%rbp, %rcx
	cmpq	%r14, %rsi
	jge	.LBB5_20
.LBB5_19:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_16 Depth=2
                                        #       Parent Loop BB5_18 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_30 Depth 5
	cmpq	56(%rsp), %rsi                  # 8-byte Folded Reload
	jg	.LBB5_20
# %bb.29:                               # 
                                        #   in Loop: Header=BB5_19 Depth=4
	incq	%rsi
	xorl	%r11d, %r11d
	jmp	.LBB5_30
	.p2align	4, 0x90
.LBB5_33:                               # 
                                        #   in Loop: Header=BB5_30 Depth=5
	incq	%r11
	leal	(%r11,%rdi), %r13d
	cmpl	%edx, %r13d
	jge	.LBB5_34
.LBB5_30:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_16 Depth=2
                                        #       Parent Loop BB5_18 Depth=3
                                        #         Parent Loop BB5_19 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	leaq	(%rdi,%r11), %r13
	cmpq	%r13, %rax
	jl	.LBB5_34
# %bb.31:                               # 
                                        #   in Loop: Header=BB5_30 Depth=5
	leal	(%r10,%r11), %r13d
	testb	$1, %r13b
	jne	.LBB5_33
# %bb.32:                               # 
                                        #   in Loop: Header=BB5_30 Depth=5
	vmovsd	-8(%r8,%r11,8), %xmm2           # xmm2 = mem[0],zero
	vmulsd	%xmm6, %xmm2, %xmm3
	vaddsd	(%r15,%r11,8), %xmm3, %xmm4
	vaddsd	(%rcx,%r11,8), %xmm4, %xmm4
	vaddsd	(%r8,%r11,8), %xmm3, %xmm3
	vaddsd	-16(%r8,%r11,8), %xmm3, %xmm3
	vfmadd213sd	%xmm2, %xmm0, %xmm4     # xmm4 = (xmm0 * xmm4) + xmm2
	vfmadd213sd	%xmm4, %xmm1, %xmm3     # xmm3 = (xmm1 * xmm3) + xmm4
	vmovsd	%xmm3, (%r9,%r11,8)
	jmp	.LBB5_33
	.p2align	4, 0x90
.LBB5_45:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$-2, %rax
	movq	NP(%rip), %rcx
	leaq	1(%rcx), %rsi
	vdivsd	%xmm2, %xmm4, %xmm2
	movslq	TILE(%rip), %rdi
	movq	m(%rip), %rdx
	addq	216(%rsp), %rdx                 # 8-byte Folded Reload
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	movq	208(%rsp), %r8                  # 8-byte Reload
	imulq	%rsi, %r8
	movq	264(%rsp), %rdx                 # 8-byte Reload
	addq	%r8, %rdx
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, %rdx
	imulq	%rdi, %rdx
	shlq	$3, %rdx
	movq	%rdx, 136(%rsp)                 # 8-byte Spill
	leaq	(,%rdi,8), %rdx
	movq	%rdx, 48(%rsp)                  # 8-byte Spill
	leaq	8(,%rcx,8), %r11
	addq	176(%rsp), %r8                  # 8-byte Folded Reload
	movq	%r8, 24(%rsp)                   # 8-byte Spill
	movq	200(%rsp), %rdx                 # 8-byte Reload
	imulq	%rsi, %rdx
	movq	248(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, %rdx
	movq	%rdx, 144(%rsp)                 # 8-byte Spill
	imulq	192(%rsp), %rsi                 # 8-byte Folded Reload
	addq	%rcx, %rsi
	movq	%rsi, 40(%rsp)                  # 8-byte Spill
	movq	224(%rsp), %r12                 # 8-byte Reload
	movq	%rdi, 152(%rsp)                 # 8-byte Spill
	jmp	.LBB5_46
	.p2align	4, 0x90
.LBB5_51:                               # 
                                        #   in Loop: Header=BB5_46 Depth=2
	addq	%rdi, 32(%rsp)                  # 8-byte Folded Spill
	movq	136(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, 16(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 24(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 144(%rsp)                 # 8-byte Folded Spill
	addq	%rcx, 40(%rsp)                  # 8-byte Folded Spill
	movq	%r14, %r12
	cmpq	56(%rsp), %r14                  # 8-byte Folded Reload
	jg	.LBB5_52
.LBB5_46:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_48 Depth 3
                                        #         Child Loop BB5_49 Depth 4
                                        #           Child Loop BB5_60 Depth 5
	leaq	(%r12,%rdi), %r14
	testl	%edi, %edi
	jle	.LBB5_51
# %bb.47:                               # 
                                        #   in Loop: Header=BB5_46 Depth=2
	movl	$1, %r9d
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	144(%rsp), %r15                 # 8-byte Reload
	movq	24(%rsp), %rdx                  # 8-byte Reload
	movq	16(%rsp), %r8                   # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
	movq	%r12, 104(%rsp)                 # 8-byte Spill
	jmp	.LBB5_48
	.p2align	4, 0x90
.LBB5_50:                               # 
                                        #   in Loop: Header=BB5_48 Depth=3
	movq	152(%rsp), %rdi                 # 8-byte Reload
	addq	%rdi, %rbp
	movq	48(%rsp), %rcx                  # 8-byte Reload
	movq	160(%rsp), %r8                  # 8-byte Reload
	addq	%rcx, %r8
	movq	112(%rsp), %rdx                 # 8-byte Reload
	addq	%rcx, %rdx
	movq	120(%rsp), %r15                 # 8-byte Reload
	addq	%rcx, %r15
	movq	168(%rsp), %rbx                 # 8-byte Reload
	addq	%rcx, %rbx
	cmpq	%r9, %rax
	movq	104(%rsp), %r12                 # 8-byte Reload
	jl	.LBB5_51
.LBB5_48:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_46 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_49 Depth 4
                                        #           Child Loop BB5_60 Depth 5
	movq	%r9, %rsi
	addq	%rdi, %r9
	movq	%rbx, 168(%rsp)                 # 8-byte Spill
	movq	%r15, 120(%rsp)                 # 8-byte Spill
	movq	%rdx, 112(%rsp)                 # 8-byte Spill
	movq	%rdx, %rdi
	movq	%r8, 160(%rsp)                  # 8-byte Spill
	movq	%rbp, %rcx
	jmp	.LBB5_49
	.p2align	4, 0x90
.LBB5_64:                               # 
                                        #   in Loop: Header=BB5_49 Depth=4
	incq	%rcx
	addq	%r11, %r8
	addq	%r11, %rdi
	addq	%r11, %r15
	addq	%r11, %rbx
	cmpq	%r14, %r12
	jge	.LBB5_50
.LBB5_49:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_46 Depth=2
                                        #       Parent Loop BB5_48 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_60 Depth 5
	cmpq	56(%rsp), %r12                  # 8-byte Folded Reload
	jg	.LBB5_50
# %bb.59:                               # 
                                        #   in Loop: Header=BB5_49 Depth=4
	incq	%r12
	xorl	%r13d, %r13d
	jmp	.LBB5_60
	.p2align	4, 0x90
.LBB5_63:                               # 
                                        #   in Loop: Header=BB5_60 Depth=5
	leaq	(%rsi,%r13), %rdx
	incq	%rdx
	incq	%r13
	cmpq	%r9, %rdx
	jge	.LBB5_64
.LBB5_60:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_46 Depth=2
                                        #       Parent Loop BB5_48 Depth=3
                                        #         Parent Loop BB5_49 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	leaq	(%rsi,%r13), %rdx
	cmpq	%rdx, %rax
	jl	.LBB5_64
# %bb.61:                               # 
                                        #   in Loop: Header=BB5_60 Depth=5
	leaq	(%rcx,%r13), %rdx
	movabsq	$-9223372036854775807, %r10     # imm = 0x8000000000000001
	andq	%r10, %rdx
	cmpq	$1, %rdx
	jne	.LBB5_63
# %bb.62:                               # 
                                        #   in Loop: Header=BB5_60 Depth=5
	vmovsd	(%rbx,%r13,8), %xmm3            # xmm3 = mem[0],zero
	vaddsd	(%r15,%r13,8), %xmm3, %xmm3
	vfmadd213sd	(%rdi,%r13,8), %xmm0, %xmm3 # xmm3 = (xmm0 * xmm3) + mem
	vmovsd	-16(%r8,%r13,8), %xmm4          # xmm4 = mem[0],zero
	vaddsd	(%r8,%r13,8), %xmm4, %xmm4
	vfmadd213sd	%xmm3, %xmm1, %xmm4     # xmm4 = (xmm1 * xmm4) + xmm3
	vmulsd	%xmm2, %xmm4, %xmm3
	vmovsd	%xmm3, -8(%r8,%r13,8)
	jmp	.LBB5_63
	.p2align	4, 0x90
.LBB5_75:                               # 
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$-2, %rax
	movslq	TILE(%rip), %rcx
	movl	%ecx, %edx
	leaq	(,%rdx,8), %rsi
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	leaq	(,%rcx,8), %rsi
	movq	%rsi, 136(%rsp)                 # 8-byte Spill
	movq	192(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 104(%rsp)                 # 8-byte Spill
	movq	200(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 152(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 48(%rsp)                  # 8-byte Spill
	movq	216(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	224(%rsp), %r9                  # 8-byte Reload
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	jmp	.LBB5_76
	.p2align	4, 0x90
.LBB5_81:                               # 
                                        #   in Loop: Header=BB5_76 Depth=2
	movq	144(%rsp), %rcx                 # 8-byte Reload
	addq	%rcx, 16(%rsp)                  # 8-byte Folded Spill
	movq	136(%rsp), %rsi                 # 8-byte Reload
	addq	%rsi, 48(%rsp)                  # 8-byte Folded Spill
	addq	%rsi, 152(%rsp)                 # 8-byte Folded Spill
	addq	%rsi, 104(%rsp)                 # 8-byte Folded Spill
	movq	112(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, %r9
	cmpq	56(%rsp), %rsi                  # 8-byte Folded Reload
	jg	.LBB5_82
.LBB5_76:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_78 Depth 3
                                        #         Child Loop BB5_79 Depth 4
                                        #           Child Loop BB5_90 Depth 5
	addq	%r9, %rcx
	movq	%rcx, 112(%rsp)                 # 8-byte Spill
	testl	%edx, %edx
	jle	.LBB5_81
# %bb.77:                               # 
                                        #   in Loop: Header=BB5_76 Depth=2
	movl	$1, %ecx
	movq	248(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 168(%rsp)                 # 8-byte Spill
	movq	176(%rsp), %rsi                 # 8-byte Reload
	movq	%rsi, 120(%rsp)                 # 8-byte Spill
	movq	16(%rsp), %r11                  # 8-byte Reload
	movq	%r9, 40(%rsp)                   # 8-byte Spill
	jmp	.LBB5_78
	.p2align	4, 0x90
.LBB5_80:                               # 
                                        #   in Loop: Header=BB5_78 Depth=3
	movq	32(%rsp), %rdx                  # 8-byte Reload
	movq	160(%rsp), %r11                 # 8-byte Reload
	addq	%rdx, %r11
	movq	24(%rsp), %rsi                  # 8-byte Reload
	addq	%rsi, 120(%rsp)                 # 8-byte Folded Spill
	addq	%rsi, 168(%rsp)                 # 8-byte Folded Spill
	cmpq	%rcx, %rax
	movq	40(%rsp), %r9                   # 8-byte Reload
	jl	.LBB5_81
.LBB5_78:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_76 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_79 Depth 4
                                        #           Child Loop BB5_90 Depth 5
	movq	%rcx, %rdi
	addq	%rdx, %rcx
	movq	104(%rsp), %r8                  # 8-byte Reload
	movq	152(%rsp), %rbp                 # 8-byte Reload
	movq	48(%rsp), %r15                  # 8-byte Reload
	movq	%r11, 160(%rsp)                 # 8-byte Spill
	movq	%r9, %rsi
	jmp	.LBB5_79
	.p2align	4, 0x90
.LBB5_94:                               # 
                                        #   in Loop: Header=BB5_79 Depth=4
	incq	%r11
	addq	$8, %r15
	addq	$8, %rbp
	addq	$8, %r8
	cmpq	112(%rsp), %rsi                 # 8-byte Folded Reload
	jge	.LBB5_80
.LBB5_79:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_76 Depth=2
                                        #       Parent Loop BB5_78 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_90 Depth 5
	cmpq	56(%rsp), %rsi                  # 8-byte Folded Reload
	jg	.LBB5_80
# %bb.89:                               # 
                                        #   in Loop: Header=BB5_79 Depth=4
	movq	NP(%rip), %rbx
	incq	%rbx
	incq	%rsi
	movq	m(%rip), %rdx
	addq	%r11, %rdx
	movq	%r15, %r10
	imulq	%rbx, %r10
	movq	120(%rsp), %r9                  # 8-byte Reload
	leaq	(%r9,%r10), %r14
	movq	168(%rsp), %r12                 # 8-byte Reload
	addq	%r12, %r10
	movq	%rbp, %r9
	imulq	%rbx, %r9
	addq	%r12, %r9
	imulq	%r8, %rbx
	addq	%r12, %rbx
	xorl	%r13d, %r13d
	jmp	.LBB5_90
	.p2align	4, 0x90
.LBB5_93:                               # 
                                        #   in Loop: Header=BB5_90 Depth=5
	incq	%r13
	leal	(%rdi,%r13), %r12d
	cmpl	%ecx, %r12d
	jge	.LBB5_94
.LBB5_90:                               # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_76 Depth=2
                                        #       Parent Loop BB5_78 Depth=3
                                        #         Parent Loop BB5_79 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	leaq	(%rdi,%r13), %r12
	cmpq	%r12, %rax
	jl	.LBB5_94
# %bb.91:                               # 
                                        #   in Loop: Header=BB5_90 Depth=5
	leal	(%rdx,%r13), %r12d
	testb	$1, %r12b
	jne	.LBB5_93
# %bb.92:                               # 
                                        #   in Loop: Header=BB5_90 Depth=5
	vmovsd	(%r10,%r13,8), %xmm0            # xmm0 = mem[0],zero
	vmulsd	%xmm3, %xmm0, %xmm1
	vaddsd	(%r9,%r13,8), %xmm1, %xmm2
	vaddsd	(%rbx,%r13,8), %xmm2, %xmm2
	vfmadd132sd	alfa(%rip), %xmm0, %xmm2 # xmm2 = (xmm2 * mem) + xmm0
	vaddsd	8(%r10,%r13,8), %xmm1, %xmm0
	vaddsd	-8(%r10,%r13,8), %xmm0, %xmm0
	vfmadd132sd	beta_coef(%rip), %xmm2, %xmm0 # xmm0 = (xmm0 * mem) + xmm2
	vmovsd	%xmm0, (%r14,%r13,8)
	jmp	.LBB5_93
	.p2align	4, 0x90
.LBB5_105:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	addq	$-2, %rax
	movslq	TILE(%rip), %rcx
	leaq	(,%rcx,8), %rdx
	movq	%rdx, 48(%rsp)                  # 8-byte Spill
	movq	200(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 40(%rsp)                  # 8-byte Spill
	movq	208(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	movq	192(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movq	216(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 136(%rsp)                 # 8-byte Spill
	movq	224(%rsp), %r8                  # 8-byte Reload
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	jmp	.LBB5_106
	.p2align	4, 0x90
.LBB5_111:                              # 
                                        #   in Loop: Header=BB5_106 Depth=2
	addq	%rcx, 136(%rsp)                 # 8-byte Folded Spill
	movq	48(%rsp), %rdx                  # 8-byte Reload
	addq	%rdx, 24(%rsp)                  # 8-byte Folded Spill
	addq	%rdx, 32(%rsp)                  # 8-byte Folded Spill
	addq	%rdx, 40(%rsp)                  # 8-byte Folded Spill
	movq	104(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, %r8
	cmpq	56(%rsp), %rdx                  # 8-byte Folded Reload
	jg	.LBB5_112
.LBB5_106:                              # 
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_108 Depth 3
                                        #         Child Loop BB5_109 Depth 4
                                        #           Child Loop BB5_120 Depth 5
	leaq	(%r8,%rcx), %rdx
	movq	%rdx, 104(%rsp)                 # 8-byte Spill
	testl	%ecx, %ecx
	jle	.LBB5_111
# %bb.107:                              # 
                                        #   in Loop: Header=BB5_106 Depth=2
	movl	$1, %esi
	movq	248(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 120(%rsp)                 # 8-byte Spill
	movq	256(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 112(%rsp)                 # 8-byte Spill
	movq	176(%rsp), %rdx                 # 8-byte Reload
	movq	%rdx, 160(%rsp)                 # 8-byte Spill
	movq	136(%rsp), %rbp                 # 8-byte Reload
	movq	%r8, 16(%rsp)                   # 8-byte Spill
	jmp	.LBB5_108
	.p2align	4, 0x90
.LBB5_110:                              # 
                                        #   in Loop: Header=BB5_108 Depth=3
	movq	144(%rsp), %rcx                 # 8-byte Reload
	movq	152(%rsp), %rbp                 # 8-byte Reload
	addq	%rcx, %rbp
	movq	48(%rsp), %rdx                  # 8-byte Reload
	addq	%rdx, 160(%rsp)                 # 8-byte Folded Spill
	addq	%rdx, 112(%rsp)                 # 8-byte Folded Spill
	addq	%rdx, 120(%rsp)                 # 8-byte Folded Spill
	cmpq	%rsi, %rax
	movq	16(%rsp), %r8                   # 8-byte Reload
	jl	.LBB5_111
.LBB5_108:                              # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_106 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_109 Depth 4
                                        #           Child Loop BB5_120 Depth 5
	movq	%rsi, %r9
	addq	%rcx, %rsi
	movq	40(%rsp), %rdi                  # 8-byte Reload
	movq	32(%rsp), %r14                  # 8-byte Reload
	movq	24(%rsp), %r10                  # 8-byte Reload
	movq	%rbp, 152(%rsp)                 # 8-byte Spill
	jmp	.LBB5_109
	.p2align	4, 0x90
.LBB5_124:                              # 
                                        #   in Loop: Header=BB5_109 Depth=4
	incq	%rbp
	addq	$8, %r10
	addq	$8, %r14
	addq	$8, %rdi
	movq	168(%rsp), %r8                  # 8-byte Reload
	cmpq	104(%rsp), %r8                  # 8-byte Folded Reload
	jge	.LBB5_110
.LBB5_109:                              # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_106 Depth=2
                                        #       Parent Loop BB5_108 Depth=3
                                        # =>      This Loop Header: Depth=4
                                        #           Child Loop BB5_120 Depth 5
	cmpq	56(%rsp), %r8                   # 8-byte Folded Reload
	jg	.LBB5_110
# %bb.119:                              # 
                                        #   in Loop: Header=BB5_109 Depth=4
	movq	NP(%rip), %rbx
	incq	%rbx
	incq	%r8
	movq	%r8, 168(%rsp)                  # 8-byte Spill
	movq	m(%rip), %rcx
	addq	%rbp, %rcx
	movq	%r10, %r11
	imulq	%rbx, %r11
	movq	160(%rsp), %r12                 # 8-byte Reload
	addq	%r12, %r11
	movq	%r14, %r8
	imulq	%rbx, %r8
	movq	112(%rsp), %rdx                 # 8-byte Reload
	leaq	(%rdx,%r8), %r15
	addq	120(%rsp), %r8                  # 8-byte Folded Reload
	imulq	%rdi, %rbx
	addq	%r12, %rbx
	xorl	%r13d, %r13d
	jmp	.LBB5_120
	.p2align	4, 0x90
.LBB5_123:                              # 
                                        #   in Loop: Header=BB5_120 Depth=5
	leaq	(%r9,%r13), %r12
	incq	%r12
	incq	%r13
	cmpq	%rsi, %r12
	jge	.LBB5_124
.LBB5_120:                              # 
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_106 Depth=2
                                        #       Parent Loop BB5_108 Depth=3
                                        #         Parent Loop BB5_109 Depth=4
                                        # =>        This Inner Loop Header: Depth=5
	leaq	(%r9,%r13), %r12
	cmpq	%r12, %rax
	jl	.LBB5_124
# %bb.121:                              # 
                                        #   in Loop: Header=BB5_120 Depth=5
	leaq	(%rcx,%r13), %r12
	movabsq	$-9223372036854775807, %rdx     # imm = 0x8000000000000001
	andq	%rdx, %r12
	cmpq	$1, %r12
	jne	.LBB5_123
# %bb.122:                              # 
                                        #   in Loop: Header=BB5_120 Depth=5
	vmovsd	alfa(%rip), %xmm0               # xmm0 = mem[0],zero
	vmovsd	(%r11,%r13,8), %xmm1            # xmm1 = mem[0],zero
	vaddsd	(%rbx,%r13,8), %xmm1, %xmm1
	vfmadd213sd	(%r8,%r13,8), %xmm0, %xmm1 # xmm1 = (xmm0 * xmm1) + mem
	vmovsd	beta_coef(%rip), %xmm2          # xmm2 = mem[0],zero
	vmovsd	-16(%r15,%r13,8), %xmm3         # xmm3 = mem[0],zero
	vaddsd	(%r15,%r13,8), %xmm3, %xmm3
	vfmadd213sd	%xmm1, %xmm2, %xmm3     # xmm3 = (xmm2 * xmm3) + xmm1
	vaddsd	%xmm0, %xmm2, %xmm0
	vfmadd213sd	%xmm5, %xmm4, %xmm0     # xmm0 = (xmm4 * xmm0) + xmm5
	vdivsd	%xmm0, %xmm3, %xmm0
	vmovsd	%xmm0, -8(%r15,%r13,8)
	jmp	.LBB5_123
.LBB5_126:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	xorl	%ebp, %ebp
	cmpl	%r12d, %r15d
	jne	.LBB5_131
	.p2align	4, 0x90
.LBB5_129:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	vizSul(%rip), %ecx
	cmpl	$-1, %ecx
	je	.LBB5_131
# %bb.130:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movq	NP(%rip), %rsi
	incq	%rsi
	movq	nN(%rip), %rax
	imulq	%rsi, %rax
	movq	88(%rsp), %r14                  # 8-byte Reload
	leaq	(%r14,%rax,8), %rdi
	movl	%ebp, %ebx
	leaq	(%rsp,%rbx,4), %rax
	addq	$64, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Isend
	movq	nN(%rip), %rax
	incq	%rax
	movq	NP(%rip), %rsi
	incq	%rsi
	imulq	%rsi, %rax
	leaq	(%r14,%rax,8), %rdi
	movl	vizSul(%rip), %ecx
	addl	$2, %ebp
	leaq	(%rsp,%rbx,4), %rax
	addq	$68, %rax
	movq	%rax, (%rsp)
                                        # kill: def $esi killed $esi killed $rsi
	movl	$1275070475, %edx               # imm = 0x4C00080B
	xorl	%r8d, %r8d
	movl	$1140850688, %r9d               # imm = 0x44000000
	callq	MPI_Irecv
	jmp	.LBB5_132
	.p2align	4, 0x90
.LBB5_131:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	testb	%bl, %bl
	je	.LBB5_133
.LBB5_132:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	movl	$1, %edx
	movl	%ebp, %edi
	leaq	64(%rsp), %rsi
	callq	MPI_Waitall
.LBB5_133:                              # 
                                        #   in Loop: Header=BB5_13 Depth=1
	incq	m(%rip)
	vmovsd	.LCPI5_0(%rip), %xmm0           # xmm0 = [5.0E-1,0.0E+0]
	vmulsd	tempoFinal(%rip), %xmm0, %xmm0
	vmovsd	272(%rsp), %xmm5                # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vucomisd	%xmm5, %xmm0
	vmovsd	.LCPI5_1(%rip), %xmm6           # xmm6 = [-2.0E+0,0.0E+0]
	ja	.LBB5_13
.LBB5_134:                              # 
	addq	$280, %rsp                      # imm = 0x118
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	main.DIR.OMP.PARALLEL.2, .Lfunc_end5-main.DIR.OMP.PARALLEL.2
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # 
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	x,@object                       # 
	.bss
	.globl	x
	.p2align	3, 0x0
x:
	.quad	0x0000000000000000              #  0
	.size	x, 8

	.type	y,@object                       # 
	.globl	y
	.p2align	3, 0x0
y:
	.quad	0x0000000000000000              #  0
	.size	y, 8

	.type	h,@object                       # 
	.globl	h
	.p2align	3, 0x0
h:
	.quad	0x0000000000000000              #  0
	.size	h, 8

	.type	velX,@object                    # 
	.globl	velX
	.p2align	3, 0x0
velX:
	.quad	0x0000000000000000              #  0
	.size	velX, 8

	.type	velY,@object                    # 
	.globl	velY
	.p2align	3, 0x0
velY:
	.quad	0x0000000000000000              #  0
	.size	velY, 8

	.type	tempoFinal,@object              # 
	.globl	tempoFinal
	.p2align	3, 0x0
tempoFinal:
	.quad	0x0000000000000000              #  0
	.size	tempoFinal, 8

	.type	deltaT,@object                  # 
	.globl	deltaT
	.p2align	3, 0x0
deltaT:
	.quad	0x0000000000000000              #  0
	.size	deltaT, 8

	.type	deltaX,@object                  # 
	.globl	deltaX
	.p2align	3, 0x0
deltaX:
	.quad	0x0000000000000000              #  0
	.size	deltaX, 8

	.type	deltaY,@object                  # 
	.globl	deltaY
	.p2align	3, 0x0
deltaY:
	.quad	0x0000000000000000              #  0
	.size	deltaY, 8

	.type	alfa,@object                    # 
	.globl	alfa
	.p2align	3, 0x0
alfa:
	.quad	0x0000000000000000              #  0
	.size	alfa, 8

	.type	beta_coef,@object               # 
	.globl	beta_coef
	.p2align	3, 0x0
beta_coef:
	.quad	0x0000000000000000              #  0
	.size	beta_coef, 8

	.type	gama,@object                    # 
	.globl	gama
	.p2align	3, 0x0
gama:
	.quad	0x0000000000000000              #  0
	.size	gama, 8

	.type	t_ini,@object                   # 
	.globl	t_ini
	.p2align	3, 0x0
t_ini:
	.quad	0x0000000000000000              #  0
	.size	t_ini, 8

	.type	t_fim,@object                   # 
	.globl	t_fim
	.p2align	3, 0x0
t_fim:
	.quad	0x0000000000000000              #  0
	.size	t_fim, 8

	.type	N,@object                       # 
	.globl	N
	.p2align	3, 0x0
N:
	.quad	0                               # 0x0
	.size	N, 8

	.type	contagemTempo,@object           # 
	.globl	contagemTempo
	.p2align	3, 0x0
contagemTempo:
	.quad	0                               # 0x0
	.size	contagemTempo, 8

	.type	nN,@object                      # 
	.globl	nN
	.p2align	3, 0x0
nN:
	.quad	0                               # 0x0
	.size	nN, 8

	.type	NP,@object                      # 
	.globl	NP
	.p2align	3, 0x0
NP:
	.quad	0                               # 0x0
	.size	NP, 8

	.type	m,@object                       # 
	.globl	m
	.p2align	3, 0x0
m:
	.quad	0                               # 0x0
	.size	m, 8

	.type	myRank,@object                  # 
	.globl	myRank
	.p2align	2, 0x0
myRank:
	.long	0                               # 0x0
	.size	myRank, 4

	.type	numProcs,@object                # 
	.globl	numProcs
	.p2align	2, 0x0
numProcs:
	.long	0                               # 0x0
	.size	numProcs, 4

	.type	numLocalPontos,@object          # 
	.globl	numLocalPontos
	.p2align	2, 0x0
numLocalPontos:
	.long	0                               # 0x0
	.size	numLocalPontos, 4

	.type	inicioLocal,@object             # 
	.globl	inicioLocal
	.p2align	2, 0x0
inicioLocal:
	.long	0                               # 0x0
	.size	inicioLocal, 4

	.type	finalLocal,@object              # 
	.globl	finalLocal
	.p2align	2, 0x0
finalLocal:
	.long	0                               # 0x0
	.size	finalLocal, 4

	.type	resto,@object                   # 
	.globl	resto
	.p2align	2, 0x0
resto:
	.long	0                               # 0x0
	.size	resto, 4

	.type	vizNorte,@object                # 
	.globl	vizNorte
	.p2align	2, 0x0
vizNorte:
	.long	0                               # 0x0
	.size	vizNorte, 4

	.type	vizSul,@object                  # 
	.globl	vizSul
	.p2align	2, 0x0
vizSul:
	.long	0                               # 0x0
	.size	vizSul, 4

	.type	semaphores_left,@object         # 
	.globl	semaphores_left
	.p2align	4, 0x0
semaphores_left:
	.zero	21760
	.size	semaphores_left, 21760

	.type	semaphores_right,@object        # 
	.globl	semaphores_right
	.p2align	4, 0x0
semaphores_right:
	.zero	21760
	.size	semaphores_right, 21760

	.type	TILE,@object                    # 
	.globl	TILE
	.p2align	2, 0x0
TILE:
	.long	0                               # 0x0
	.size	TILE, 4

	.type	.L.str,@object                  # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"#Versao Semaforo: Tempo = "
	.size	.L.str, 27

	.type	.L.str.1,@object                # 
.L.str.1:
	.asciz	" segundos ..."
	.size	.L.str.1, 14

	.type	.L.str.2,@object                # 
.L.str.2:
	.asciz	"Tile de tamanho "
	.size	.L.str.2, 17

	.type	.L.str.3,@object                # 
.L.str.3:
	.asciz	"output_data.txt"
	.size	.L.str.3, 16

	.type	.L.str.4,@object                # 
.L.str.4:
	.asciz	" "
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # 
.L.str.5:
	.asciz	"Erro ao abrir o arquivo para escrita."
	.size	.L.str.5, 38

	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	_GLOBAL__sub_I_EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp
	.type	.L.kmpc_loc.120.120,@object     # 
	.data
	.p2align	4, 0x0
.L.kmpc_loc.120.120:
	.long	0                               # 0x0
	.long	838860802                       # 0x32000002
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	.L.source.120.120.6
	.size	.L.kmpc_loc.120.120, 24

	.type	.L.source.120.120.6,@object     # 
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L.source.120.120.6:
	.ascii	";/prj/prjad/fcabral/EDPSEWS/EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp;main;120;120;;"
	.size	.L.source.120.120.6, 73

	.type	.L.kmpc_loc.120.120.7,@object   # 
	.data
	.p2align	4, 0x0
.L.kmpc_loc.120.120.7:
	.long	0                               # 0x0
	.long	838860802                       # 0x32000002
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	.L.source.120.120.6
	.size	.L.kmpc_loc.120.120.7, 24

	.type	.L.source.128.128,@object       # 
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L.source.128.128:
	.ascii	";/prj/prjad/fcabral/EDPSEWS/EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp;main;128;128;;"
	.size	.L.source.128.128, 73

	.type	.L.kmpc_loc.128.128,@object     # 
	.data
	.p2align	4, 0x0
.L.kmpc_loc.128.128:
	.long	0                               # 0x0
	.long	838860834                       # 0x32000022
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	.L.source.128.128
	.size	.L.kmpc_loc.128.128, 24

	.type	.L.source.102.102,@object       # 
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L.source.102.102:
	.ascii	";/prj/prjad/fcabral/EDPSEWS/EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp;main.DIR.OMP.PARALLEL.2;102;102;;"
	.size	.L.source.102.102, 92

	.type	.L.kmpc_loc.102.102,@object     # 
	.data
	.p2align	4, 0x0
.L.kmpc_loc.102.102:
	.long	0                               # 0x0
	.long	838860802                       # 0x32000002
	.long	0                               # 0x0
	.long	0                               # 0x0
	.quad	.L.source.102.102
	.size	.L.kmpc_loc.102.102, 24

	.ident	"Intel(R) oneAPI DPC++/C++ Compiler 2025.0.1 (2025.0.1.20241113)"
	.section	".note.GNU-stack","",@progbits
