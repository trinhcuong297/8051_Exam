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
	MOV TMOD, #01H				;Choose Timer 0, mode 1 (16 bits)
								;Clock of Cystal 12MHz: t = 1us
								;Period of 10Hz: T = 100000us
								; => Count 50000 and toggle
here:
	MOV TL0, #0B0H				;65536 - 50000 = 15536 = 3CB0H
	MOV TH0, #03CH				;Set |TH|TL| = |3C|B0|
	CPL P3.0					;Toggle Pin 3.0
	LCALL Timer_Start			;Delay by timer
	SJMP here 					;Loop back
	
;=====================Define Function Program=====================
Timer_Start:
	SETB TR0 					;start the timer 0
Wait_to_timer: 
	JNB TF0, Wait_to_timer 		;wait until timer 0 over flag
	CLR TR0 					;stop timer 0
	CLR TF0 					;clear timer 0 flag
	RET
;====================Define Interrupt Handler=====================

END
