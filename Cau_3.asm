;===================== Main and Interrupt Start ==================

	ORG 00h 					;Start from address 00h
	LJMP MAIN 					;Jump to Main program
	
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
	MOV R0, #10					;Set R0 to Loop length
	MOV R1, #6CH				;Set R2 to First Address
	LCALL Del_loop				;Start loop
here:
	SJMP here 					;
	
;=====================Define Function Program=====================

Del_loop:
	CLR A 						;
	MOV @R1, A 					;Save from Acc to Internal Ram
	INC R1						;Next Internal Ram Address
	DJNZ R0, Del_loop			;If R0>0, loop again
	RET 						;Return to Main

;====================Define Interrupt Handler=====================

END
