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

here:
	SJMP here 					;
	
;=====================Define Function Program=====================

;====================Define Interrupt Handler=====================

END
