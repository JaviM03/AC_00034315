org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d
    
    call modotexto
    call movercursor
    call escribircaracter
    call movercursor1
    call escribircaracter1
    call movercursor2
    call escribircaracter2
    call movercursor3
    call escribircaracter3
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET
    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET
    escribircaracter: ;utilizando interrupcion DOS
        MOV AH, 09h ; escribe cadena en pantalla según posición del cursor
        MOV DX, caracter ; cadena que vamos a imprimir, debe ir sin corchetes
        INT 21h
        RET

    movercursor1:
        MOV AH, 02h 
        MOV DH, 12 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter1: 
        MOV AH, 09h 
        MOV DX, caracter1 
        INT 21h
        RET        
    movercursor2:
        MOV AH, 02h 
        MOV DH, 14 
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter2: 
        MOV AH, 09h 
        MOV DX, caracter2 
        INT 21h
        RET 

    movercursor3:
        MOV AH, 02h 
        MOV DH, 16
        MOV DL, 20 
        MOV BH, 0h  
        INT 10h
        RET
    escribircaracter3: 
        MOV AH, 09h  
        MOV DX, caracter3 
        INT 21h
        RET                       

    esperartecla:
        MOV AH, 00h 
        INT 16h

        ret
    exit:
        int 20h

section .data

caracter DB "Javier$"
caracter1 DB "Alejandro$"
caracter2 DB "Martinez$"
caracter3 DB "Rivas$"