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
	MOV A, #1					;Set value 1 to External Ram 1000H
	MOV DPTR, #1000H			;
	MOVX @DPTR, A 				;
	MOV A, #3					;Set value 3 to External Ram 1002H
	MOV DPTR, #1002H			;
	MOVX @DPTR, A 				;
	MOV A, #5					;Set value 5 to External Ram 1004H
	MOV DPTR, #1004H			;
	MOVX @DPTR, A 				;
	MOV A, #7					;Set value 7 to External Ram 1006H
	MOV DPTR, #1006H			;
	MOVX @DPTR, A 				;
	MOV A, #9					;Set value 9 to External Ram 1008H
	MOV DPTR, #1008H			;
	MOVX @DPTR, A 				;
	MOV A, #10					;Set value 10 to External Ram 1009H
	MOV DPTR, #1009H			;
	MOVX @DPTR, A 				;

	MOV R0, #10					;Set R0 to Array length
	MOV DPTR, #1000H			;Set DPTR to External Array Address
	MOV R1, #50H				;Set R2 to Internal Array Address
	LCALL Data_transfer			;Start loop
here:
	SJMP here 					;
	
;=====================Define Function Program=====================

Data_transfer:
	MOVX A, @DPTR				;Read from External Ram to Acc
	MOV @R1, A 					;Save from Acc to Internal Ram
	INC DPTR					;Next External Ram Address
	INC R1						;Next Internal Ram Address
	DJNZ R0, Data_transfer		;If R0>0, loop again
	RET 						;Return to Main

;====================Define Interrupt Handler=====================

END
