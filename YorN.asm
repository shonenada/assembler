DATAS SEGMENT
    YESSTRING DB 'YOU HAVE INPUT Y','$'
    NOSTRING DB 'YOU HAVE INPUT N','$'
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
KEY:
    MOV AH,8    ;��������
    INT 21H
    CMP AL,'Y'
    JE YES
    CMP AL,'N'
    JE NO
    JMP KEY
YES:
    MOV DX,OFFSET YESSTRING
    MOV AH,9
    INT 21H
    JMP TOEND
NO:
	MOV DX,OFFSET NOSTRING
    MOV AH,9
    INT 21H
TOEND:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START