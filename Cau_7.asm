;===================== Main and Interrupt Start ==================
; Because of Serial port is pre-define, The program below will not
; re-define UART and use directively SBUF, TI to transfer data
;=================================================================
; MAIN PROGRAM
;=================================================================
	ORG 50H 					;Start Main program at 50H in ROM
Main:
	MOV R0, #10					;Set R0 to data length
	MOV DPTR, #100H				;Set DPTR to External Array Address
	LCALL UART_Trans_Start		;Start transfer data
here:
	SJMP here 					;Stop program
	
;=====================Define Function Program=====================
UART_Trans_Start:
	MOVX A, @DPTR				;Read from External Ram to Acc
	MOV SBUF, A 				;Save from Acc to SBUF
Wait_to_trans: 
	JNB TI, Wait_to_trans 		;wait until TI flag set
	CLR TI  					;clear TI bit
	INC DPTR					;Next External Ram Address
	DJNZ R0, UART_Trans_Start	;If R0>0, loop again
	RET
;====================Define Interrupt Handler=====================

END
