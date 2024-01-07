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
	MOV 40H, #46H				;Testcase
	MOV R0, #30H				;Testcase
	MOV R7, #20					;Testcase
Loop_to_lowercase:
	LCALL To_Lowercase			;Data in address of R0 to lowercase
	INC R0						;Increase R0
	DJNZ R7, Loop_to_lowercase	;If R7>0, loop again
here:
	SJMP here 					;Loop back
	
;=====================Define Function Program=====================
To_Lowercase:
	MOV R1, #41H				;Set R1 to LetterCheck
	MOV R2, #26					;Set R2 to count from 'A' to 'Z'
Back:
	MOV A, R1					;Set A is LetterCheck
	XRL A, @R0					;If @R0 equal LetterCheck
	CJNE A, #0, MatchLowercase 	;-> Skip Upper
	MOV A, R1					;
	ADD A, #32					;Uppercase @R0
	MOV @R0, A					;
MatchLowercase:
	INC R1						;Increase R1 to check new letter
	DJNZ R2, Back				;If letter is not 'Z', continue
	RET

;====================Define Interrupt Handler=====================

END
