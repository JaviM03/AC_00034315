	org 	100h

	section	.text
	mov 	DX, msg1
	
	mov 	BP, frase
	call  	LeerCadena
	call	EsperarTecla
	call Autenticacion

	int 	20h

	section	.data

msg1	db	"Ingresa una passwpord: ", "$"
msg2	db	"Password ingresada es: ", "$"
msg3 	db 	"BIENVENIDO ", "$"
msg4 	db 	"INCORRECTO ", "$"
pass	db	"abcd", "$"
frase 	times 	20  	db	" " 	

	EsperarTecla:
		mov     AH, 00h         
		int     16h
		ret

	LeerCadena:
		xor     SI, SI          
	while:  
		call    EsperarTecla    
		cmp     AL, 0x0D        
		je      exit            
		mov     [BP+SI], AL   	
		inc     SI              
		jmp     while           
	exit:
		mov 	byte [BP+SI], "$"	
		ret


	

	Autenticacion:
		cmp  	SI,frase
		
		mov 	AH, 09h
		mov 	DX, msg3

		jne incorrecto
		int 	21h
		ret

	incorrecto:
		mov 	AH, 09h
		mov 	DX, msg4
		int 	21h
		ret