DATA SEGMENT
	TABLE DB 10H,11H,12H
	SUM DB ?
	DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
INIT:
    MOV AX,DATA
    MOV DS,AX
    MOV SI,OFFSET TABLE
    MOV CX,3
    MOV AL,0
GOON:
    ADD AL,[SI]
    INC SI
    LOOP GOON
    MOV SUM,AL
    MOV AH,4CH
    INT 21H
	CODE ENDS
END INIT
