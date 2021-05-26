org     100h

section .text

XOR SI, SI                          
XOR DI, DI
XOR BX, BX
XOR CX, CX
XOR DX, DX
XOR AX, AX

MOV     BP, array     
CALL    datos        

int     20h

section .data

array db 24,14,16,26,2,17,23,31,7,29 ;
largo equ $-array ;
dividir equ 02 ;   

datos:
    MOV     BL, dividir

for:
    CMP     SI, largo
    JE      end

    MOV     AL, [BP+SI]
    MOV     BH,AL
    DIV     BL
    INC     SI

    CMP     AH, 0
    JE      even
    JNE     odd
        
even:
    MOV     DI, CX
    MOV     [300h+ DI], BH
    INC     DI
    MOV     CX, DI
    jmp     for

odd:
    MOV     DI, DX
    MOV     [320h+DI], BH
    INC     DI
    MOV     DX, DI
    jmp     for

end:
    ret