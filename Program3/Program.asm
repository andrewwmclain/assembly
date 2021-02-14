; Earnings accumulator program
; Author:  Andrew McLain
; Date:    02/04/2021

.586
.MODEL FLAT
.STACK  4096            ; reserve 4096-byte stack

.DATA

.CODE
main PROC
	 mov ebx, 1			;nextDayWage := 1
	 mov eax, 0			;totalEarnings := 0
	 mov ecx, 0			;day:= 0
until: 
	 add eax, ebx		;add nextDaysWage to totalEarnings
	 add ebx, ebx		;multiply nextDayWage by 2
	 inc ecx			;increment day by 1
	 cmp  eax, 100000000; total earnings < 100,000,000 cents?
	 jl until			;jump to until, otherwise endUntil
endUntil:
	 mov eax, ecx		;exit with return code matching the number of days. 
	 ret
main ENDP

END        ;specify the program's entry point