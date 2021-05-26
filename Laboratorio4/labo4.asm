org 100h

        section .text
        
        mov BP,arr
        call evenOdd

        int 20h
        
        section .data
arr db 24,14,16,26,2,17,23,31,7,29,0xA

evenOdd:
    xor SI,SI

while:
    mov AL,[BP+SI]
    mov dl, al
    
    cmp AL,0xA
    je end

    mov bl,01h
    and AL,bl
    
    cmp AL,01h  
    jnz evenodd
    
    mov [0320H+SI],dl
    
    inc SI
    jmp while

evenodd:
    mov [0300H+SI],dl

    inc SI
    jmp while

end:
ret 