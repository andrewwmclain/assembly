; Racquetball perimeter assembly language program
; Author:  Andrew McLain
; Date:    1/27/2021

.586
.MODEL FLAT

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
l DWORD 40
w DWORD 20
p DWORD ?

.CODE                           ; start of main program code
main    PROC
        mov ebx, l              ;put length value in ebx
        add ebx, ebx            ;double length goes in ebx
        mov eax, ebx            ;put doubled length in eax

        mov ebx, w              ;put width value in ebx
        add ebx, ebx            ;double width goes in ebx
        add eax, ebx            ;add double width to double length in eax
        mov p, eax              ;store perimeter value in memory
        mov eax, 0

        ret
main    ENDP

END                             ; end of source code


; registers initially: 
;EAX = 005FFA50 EBX = 007FE000 ECX = 004F1005
;EDX = 004F1005 ESI = 004F1005 EDI = 004F1005 
;EIP = 004F1010 ESP = 005FF9F8 EBP = 005FFA04 
;EFL = 00000246 

;0x004F4000 = 00000028 

;memory initially: 
;&l: address = 0x004F4000, value = 28 00 00 00
;&w: address = 0x004F4004, value = 14 00 00 00
;&p: address = 0x004F4008, value = 00 00 00 00

;line 17 mov ebx, l
;register changes: EBX = 00000028 EIP = 004F1016
;memory changes: none

;line 18 add ebx, ebx
;register changes: EBX = 00000050 EIP = 004F1018 EFL = 00000216
;memory changes: none

;line 19 mov eax, ebx
;register changes: EAX = 00000050 EIP = 004F101A
;memory changes: none

;line 21 mov ebx, w
;register changes: EBX = 00000014 EIP = 004F1020
;memory changes: none

;line 22 add ebx, ebx
;register changes: EBX = 00000028 EFL = 00000206
;memory changes: none

;line 23 add eax, ebx
;register changes: EAX = 00000078 EIP = 004F1024
;memory changes: none

;line 24 mov p, eax
;register changes: EIP = 004F1029
;memory changes: &p: value = 78 00 00 00, which corresponds to 120 in little endian form

;line 25 mov eax, 0
;register changes: EAX = 00000000 EIP = 004F102E
;memory changes: none