; Page 195 Programming Exercise 6.3.1
; Author:  Andrew McLain
; Due Date:    02/22/2021


.586              ;Target processor.  Use instructions for Pentium class machines
.MODEL FLAT, C    ;Use the flat memory model. Use C calling conventions
.STACK            ;Define a stack segment of 1KB (Not required for this example)
.DATA             ;Create a near data segment.  Local variables are declared after
                  ;this directive (Not required for this example)
.CODE      


to_upper PROC
    push ebp ; save base pointer
    mov ebp, esp  ;set base pointer to access arguments

    mov ebx, [ebp+8] ;store address of first index of 
                     ;array argument in ebx
    
    ;while loop until null termination
    WILE: 
         mov al, [ebx] ;store value at address in al
         cmp al, 0
         je ENDWILE ;if value is null end loop
         cmp al, 96
         jle NOT_LOWERCASE ;if value is not lower case
         cmp al, 123
         jge NOT_LOWERCASE ;if value is not lower case
    LOWERCASE:
        sub al, 32 ;subtract 32 from al and put
                   ;result back in address ebx points to
        mov [ebx], al 
        add ebx, 1 ;increment address ebx points to by 1
        jmp WILE
    NOT_LOWERCASE:
        mov [ebx], al
        add ebx, 1
        jmp WILE  
    ENDWILE:
        pop ebp ;get original ebp value back
        ret
to_upper ENDP

END



; CORRESPONDING Program.c FILE CODE
;#include <stdio.h>

;to_upper(char*);
;const int LEN = 10;
;char str[] = { 'a', '`', 'C', 'd', 'e', 'f', 'g', 'h', 'z', '}', '\0' };

;int main()
;{
;	to_upper(str);
;	for (int i = 0; i < LEN; ++i) {
;		printf("%c\n", str[i]);
;	}
;
;   return 0;
;}