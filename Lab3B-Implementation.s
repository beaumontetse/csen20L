        .syntax         unified
        .cpu            cortex-m4
        .text


// int32_t Return32Bits(void) ;
        .global         Return32Bits
        .thumb_func
        .align
Return32Bits:
	//Implementation
		MOV 			R0,10 //store 10 in R0
        BX              LR


// int64_t Return64Bits(void) ;
        .global         Return64Bits
        .thumb_func
        .align
Return64Bits:
	//Implementation
		LDR 			R0,=-10 //store -10 in R0
		LDR 			R1,=-1  //store -1 in R1 to make 64 bits
        BX              LR


// uint8_t Add8Bits(uint8_t x, uint8_t y) ;
        .global         Add8Bits
        .thumb_func
        .align
Add8Bits:
	//Implementation
		ADD				R0,R0,R1 // R0 = x + y
		UXTB			R0,R0
        BX             	LR


// uint32_t FactSum32(uint32_t x, uint32_t y) ;
        .global         FactSum32
        .thumb_func
        .align
FactSum32:
	//Implementation
		PUSH			{R4, LR}
		ADD				R0,R0,R1 	// R0 = x + y
		BL				Factorial 	// Factorial()
		POP				{R4, LR}
        BX				LR


// uint32_t XPlusGCD(uint32_t x, uint32_t y, uint32_t z) ;
        .global         XPlusGCD
        .thumb_func
        .align
XPlusGCD:
	//Implementation
		PUSH			{R4, LR}
        MOV				R4, R0 		// preserve x in R4
		MOV				R0, R1 		// R0 = y
		MOV				R1, R2 		// R1 = z
		BL				gcd    		// gcd()
		ADD				R0,R4,R0 	// R0 = x + gcd(y, z)
		POP				{R4, LR}
		BX				LR

        .end


