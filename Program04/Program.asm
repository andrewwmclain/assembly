; Page 164 Programming Exercise 5.5.7
; Author:  Andrew McLain
; Due Date:    02/18/2021

.586
.MODEL FLAT
.STACK  4096            ; reserve 4096-byte stack

.DATA
	array1 DWORD -3, 5, 10, 15, 18, 2147483647, 15 DUP (?)
	array2 DWORD -12, -7, 0, 9, 2147483647, 16 DUP (?)
	array3 DWORD 40 DUP (?)

	count1 DWORD 5
	count2 DWORD 4

.CODE
main PROC
	mov ecx, count1
	add ecx, count2
	mov edi, 0
	mov esi, 0
	mov ebx, 0

	FOR_LOOP:
		cmp ecx, 0	;check if counter == 0
		je DONE		;if counter == 0 end the loop

		mov eax, array1[4*edi] 
		cmp eax, array2[4*esi]  ; compare value at current index of arr1 to value at current index of arr2
		jle ARR1				; add value at current index of arr1 to current index of arr3 if it is less than
								; value at current index of arr2
		ARR2: mov eax, array2[4*esi]
			  mov array3[4*ebx], eax
			  inc esi
			  jmp ENDCOMPARE
		ARR1: mov eax, array1[4*edi]
		      mov array3[4*ebx], eax
			  inc edi
		ENDCOMPARE: inc ebx
					dec ecx
					jmp FOR_LOOP
	DONE: mov eax, 0
		  ret
main ENDP

END        ;specify the program's entry point


;arr1
;fd ff ff ff 
;05 00 00 00 
;0a 00 00 00 
;0f 00 00 00 
;12 00 00 00

;arr2
;f4 ff ff ff 
;f9 ff ff ff 
;00 00 00 00 
;09 00 00 00

;arr3
;f4 ff ff ff 
;f9 ff ff ff 
;fd ff ff ff 
;00 00 00 00 
;05 00 00 00 
;09 00 00 00 
;0a 00 00 00 
;0f 00 00 00 
;12 00 00 00


