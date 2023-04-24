Name: REV_GRAY_CODE
.model small 
.data 
 Citire db 'Citeste element: ',  '$'
 Afisare db 'Rezultatul decodificarii este: ', '$'
 N DB ?
 I DB 1
.code 
main proc
 MOV AX, @data 
 MOV DS, AX
 ;citire element
 LEA DX,Citire  
 MOV AH,09H
 INT 21H
 MOV AH, 1
 INT 21H
 ;scadem 48 din nr ca sa ramana 4 in ascii
 SUB AL, 30h
 ;copie in variabila
 MOV N, AL
 MOV AL, N
 ;codul propriu-zis
 FOR:
 MOV BL, AL
 MOV CL, I
 SHR BL, CL
 XOR AL, BL
 MOV DL, BL
 SUB DL, 1
 JZ IESIRE
 JS IESIRE
 MOV DL, CL
 SUB DL, 16
 JZ IESIRE
 SHL CL, 1
 MOV I, CL
 JMP FOR
 IESIRE:
 ;salvam rezultatul decodificarii in N
 MOV N, AL
 ;cod pentru new line
 MOV dl, 10
 MOV ah, 02h
 INT 21h 
 MOV dl, 13
 MOV ah, 02h
 INT 21h
 ;afisarea
 LEA DX,Afisare  
 MOV AH,09H
 INT 21H
 MOV AL, N 
 ADD AL, 48 
 MOV DL, AL
 MOV AH, 2
 INT 21H
main endp
end
