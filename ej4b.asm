;Escribir otra función modArray que toma el mismo array del punto anterior y modifica sus valores, dividiendo por 4 y restando uno a los multiplos de 4 y multiplicando por 5 y restando uno al resto.
;	modArray(*p,size)
;		for f=0; f<size; f++
;			if (p[f] es mult4) p[f]=p[f]/4
;			else p[f]=p[f]*5-1

main:
	SET R7, 0xFF	;stack
	SET R0, p  	;p
	SET R1, 0x10	;size
	
	CALL |R7|, modarray

halt:
	JMP halt

modarray:
	PUSH |R7|, R0
	PUSH |R7|, R1
	PUSH |R7|, R2
	PUSH |R7|, R3
	PUSH |R7|, R5
	PUSH |R7|, R6
	SET R2, 0x04
	SET R3, 0x01
	SET R5, 0x00
	SET R6, 0x00

ciclo:
	LOAD R5, [R0]  
	ADD R0, R3 
	JMP multiplo

sigo:
	CMP R1, R0
	JZ fin
	JMP ciclo

multiplo:
	SET R6, 0
	SUB R5, R2
	CMP R5, R6
	JZ si
	JN no
	JMP multiplo

si:
	SHR R5, 2
	SUB R5, R3 
	JMP sigo

no:
	MOV R6, R5
	SHL R5, 2
	ADD R5, R6 
	SUB R5, R3 
	JMP sigo

fin:
	POP |R7|, R6
	POP |R7|, R5
	POP |R7|, R3 
	POP |R7|, R2
	POP |R7|, R1
	POP |R7|, R0
	RET|R7|


p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE
