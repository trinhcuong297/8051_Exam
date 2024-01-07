;===================== Main and Interrupt Start ==================

	ORG 00h 					;Start from address 00h
	LJMP MAIN 					;Jump to Main program
	
	ORG 03h 					;External 0 interrupt start
	NOP 						;No code
	LCALL EXT0_ISR				;Start Ext0 interrupt service

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
	MOV IE, #10000001B			;Enable External 0 interrupt
	SETB IT0					;Enable interrupt at falling edge
	MOV R1, #0					;Set R0 to 0
here:
	LCALL Display_Acc			;Start display Acc value
	SJMP here 					;Loop back
	
;=====================Define Function Program=====================
Display_Acc:
	CJNE R1, #0, ONE			;Check if A is not ZERO
	MOV P1, #0C0H				;Display ZERO
	RET
ONE:
	CJNE R1, #1, TWO			;Check if A is not ONE
	MOV P1, #0F9H				;Display ONE
	RET
TWO:
	CJNE R1, #2, THREE			;Check if A is not TWO
	MOV P1, #0A4H				;Display TWO
	RET
THREE:
	CJNE R1, #3, FOUR			;Check if A is not THREE
	MOV P1, #0B0H				;Display THREE
	RET
FOUR:
	CJNE R1, #4, FIVE			;Check if A is not FOUR
	MOV P1, #99H				;Display FOUR
	RET
FIVE:
	CJNE R1, #5, SIX			;Check if A is not FIVE
	MOV P1, #92H				;Display FIVE
	RET
SIX:
	CJNE R1, #6, SEVEN			;Check if A is not SIX
	MOV P1, #82H				;Display SIX
	RET
SEVEN:
	CJNE R1, #7, EIGHT			;Check if A is not SEVEN
	MOV P1, #0F8H				;Display SEVEN
	RET
EIGHT:
	CJNE R1, #8, NINE			;Check if A is not EIGHT
	MOV P1, #80H				;Display EIGHT
	RET
NINE:
	CJNE R1, #9, NAN			;Check if A is not NINE
	MOV P1, #90H				;Display NINE
	RET
NAN:
	MOV P1, #0BFH
	RET
;====================Define Interrupt Handler=====================
EXT0_ISR:
	INC R1						;Increase number press button
	CJNE R1, #10, RESET_R1		;Check if A is TEN
	MOV R1, #0					;Clear R1
	RETI						;Return from interrupt
RESET_R1:
	RETI 						;Return from interrupt

END
