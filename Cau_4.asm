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
	MOV 20H, #11H				;Set value of 20H to 11H
	MOV 21H, #11H				;Set value of 21H to 11H
	MOV 22H, #11H				;Set value of 22H to 11H
	MOV 23H, #11H				;Set value of 23H to 11H
	MOV 24H, #11H				;Set value of 24H to 11H
	MOV 25H, #12H				;Set value of 25H to 11H


	SETB RS1					;Select Register Bank 3
	CLR RS0						; |RS1|RS0| = |1|0|
	MOV R0, #6					;Set R0 to Loop length
	MOV R1, #20H				;Set R2 to First Address
	CLR A						;
	LCALL Check_sum				;Start loop
	MOV R3, A 					;
here:
	SJMP here 					;
	
;=====================Define Function Program=====================

Check_sum:
	ADD A, @R1 					;Save from Acc to Internal Ram
	INC R1						;Next Internal Ram Address
	DJNZ R0, Check_sum			;If R0>0, loop again
	RET 						;Return to Main

;====================Define Interrupt Handler=====================

END
