        .syntax     unified
        .cpu        cortex-m4
        .text

// ----------------------------------------------------------
// unsigned HalfWordAccess(int16_t *src) ;
// ----------------------------------------------------------

        .global     HalfWordAccess
        .thumb_func
        .align
HalfWordAccess:
	//if the byte ends in 0, it is aligned and there is no extra cycles needed
	//Implementation
	.rept			100
	LDRH			R1,[R0]
	.endr
	BX				LR

// ----------------------------------------------------------
// unsigned FullWordAccess(int32_t *src) ;
// ----------------------------------------------------------

        .global     FullWordAccess
        .thumb_func
        .align
FullWordAccess:
	//if the byte ends in 0, it is aligned and there is no extra cycles needed
	//Implementation
	.rept			100
	LDR				R1,[R0]
	.endr
	BX				LR

// ----------------------------------------------------------
// unsigned NoAddressDependency(uint32_t *src) ;
// ----------------------------------------------------------

        .global     NoAddressDependency
        .thumb_func
        .align
NoAddressDependency:
	// since we are reading from register, doesnt take as long
	//Implementation
	.rept			100
	LDR				R1,[R0]
	LDR				R2,[R0]
	.endr
	BX				LR

// ----------------------------------------------------------
// unsigned AddressDependency(uint32_t *src) ;
// ----------------------------------------------------------

        .global     AddressDependency
        .thumb_func
        .align
AddressDependency:
	//since we are reading in from another register, we must wait until the first
	//load of the first register is completeto read from memory
	//Implementation
	.rept			100
	LDR				R1,[R0]
	LDR				R0,[R1]
	.endr
	BX				LR
// ----------------------------------------------------------
// unsigned NoDataDependency(float f1) ;
// ----------------------------------------------------------

        .global     NoDataDependency
        .thumb_func
        .align
NoDataDependency:
	//Implementation
	//not waiting for previous data in memory to finish, so no data dependcy
	.rept			100
	VADD.F32		S1,S0,S0
	VADD.F32		S2,S0,S0
	.endr
	VMOV			S1,S0
	BX				LR

// ----------------------------------------------------------
// unsigned DataDependency(float f1) ;
// ----------------------------------------------------------

        .global     DataDependency
        .thumb_func
        .align
DataDependency:
	//Implementation
	//in this example, waiting for previous data in memory to finish, so there is a dependency
	.rept			100
	VADD.F32		S1,S0,S0
	VADD.F32		S0,S1,S1
	.endr
	VMOV			S1,S0
	BX				LR

// ----------------------------------------------------------
// void VDIVOverlap(float dividend, float divisor) ;
// ----------------------------------------------------------

        .global     VDIVOverlap
        .thumb_func
        .align
VDIVOverlap:
	//Implementation
	//this is slow because the square root function is slow
	VDIV.F32		S2,S1,S0
	.rept			1
	NOP
	.endr
	VMOV			S3,S2
	BX				LR
        .end
