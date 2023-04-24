Name: GRAY_CODE
.model small 
.data 
 Citire db 'Citeste element: ',  '$'
 Afisare db 'Rezultatul codificarii este: ', '$'
.code 
main proc   
 MOV AX, @data 
 MOV DS, AX
 ;citire numar
 LEA DX,Citire  
 MOV AH,09H
 INT 21H
 MOV AH, 1
 INT 21H
 ;scadem 48 din numar sa ramana nr in ascii
 SUB AL, 30h
 MOV BL, AL
 SHR AL, 01
 XOR BL, AL
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
 MOV DX, 0h
 MOV DL, BL
 ADD DL, 30h
 MOV AH, 2
 INT 21H
main endp
end