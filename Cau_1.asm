;===================== Main and Interrupt Start ==================

	ORG 00h 					;Start from address 00h
	SJMP MAIN 					;Jump to Main program
	
	ORG 03h 					;External 0 interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
	ORG 0Bh 					;Timer 0 overflow interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
	ORG 13h 					;External 1 interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
	ORG 1Bh 					;Timer 1 overflow interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
	ORG 23h 					;Serial port interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
	ORG 2Bh 					;Timer 2 overflow interrupt start
	NOP 						;No code
	RETI 						;Return from interrupt
	
;====================Define Variable and Constant=================

;=================================================================
; MAIN PROGRAM
;=================================================================
	ORG 50H 					;Start Main program at 50H in ROM
Main:
	MOV 38H, #-12				;Set 38H to negative number
	MOV 39H, #-12				;Set 39H to negative number
	MOV 42H, #-12				;Set 42H to negative number
	MOV 45H, #-12				;Set 45H to negative number
	MOV 4BH, #-12				;Set 4BH to negative number

	MOV R0, #50					;Set R0 to Count Number
	MOV R1, #38H				;Set R1 to Start Count Address
	MOV R2, #00H				;Set R2 to Store Count
	LCALL Count_Pos				;Start Count
here:
	SJMP here 					;
	
;=====================Define Function Program=====================

Count_Pos:
	MOV A, @R1					;Move variant from @R1 to A
	ANL A, #80H					;Set A to 80H if A<0 , 00H if A>0
	CJNE A, #00H, Skip_Count	;Skip count if A<0
	INC R2						;Count R2 += 1
Skip_Count:
	INC R1						;Increase R1
	DJNZ R0, Count_Pos			;If R0>0, loop again
	RET 						;Return to Main

;====================Define Interrupt Handler=====================

END
