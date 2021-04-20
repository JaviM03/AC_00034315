        org	200h

	
		
		mov 	BX, 200h
		mov 	AX, "J" 
		mov		CL, "A"
        mov     DL, "M"
        mov     DH, "R"

        mov		[200h], AX
		mov     [201h], CL
    	mov     [202h], DL
        mov     [203h], DH

; Direccionamiento directo o absoluto
		mov 	AX, [200h]
		
		

; Direccionamiento indirecto por registro
; Usamos el registro base como puntero para acceder a la memoria
	    mov     Cl, [BX]

; Direccionamiento indirecto base mas indice 
; Usamos el registro base junto con un registro apuntador
		 mov    DL, [BX + SI]

; Direccionamiento relativo por registro
		mov		DH, [DI+100h]

		int 	20h