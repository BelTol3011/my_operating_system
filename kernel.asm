[bits 16]
[ORG 0x7C00]

;Eigentlicher code




MOV SI, BOOTLOADERSTR
CALL printstr




MOV SI, BOOTLOADERSTR1
CALL printstr








CALL Ende


;Definition
BOOTLOADERSTR db 'Bootloader (C)Bela 2018, inspiriert vom Yotuber "F.E.C.".', 13 , 10 ,  'HINWEIS: Dieses Betriebsystem ist komplett sinnlos. Es macht rein GRANIX.',13 , 10 , 0
BOOTLOADERSTR1 db 'Version: 3.1', 13 , 10 , 0
BOOTLOADERSTR2 db 'Teste alle Funktionen...', 13 , 10 ,0
BOOTLOADERSTR3 db 'Fertig!', 13 , 10, 13 , 10 ,0
BOOTLOADERSTR4 db 13 , 10 ,0
BOOTLOADERSTR5 db 'Die Shell startet jetzt:',13 , 10 ,0
BOOTLOADERSTR6 db 13,10,'\(^-^)/', 0


;Print
MOV AH,0x0e
MOV AL,'H'
INT 0x10


;Setgraphicsmode:
MOV AH, 0x00
MOV AL, 0x13
INT 10h


;lesen:
;MOV AH, 0
;INT 016h
;INT 0x10
;lesenend:

;cleanscreen:
;XOR DX, DX
;XOR BH, BH
;MOV AX, 200h
;INT 10h
;cleanscreenend:


Ende:

MOV SI,BOOTLOADERSTR2
CALL printstr

CALL functest






MOV SI,BOOTLOADERSTR3
CALL printstr

MOV SI,BOOTLOADERSTR5
CALL printstr


shellstart:
CALL neu
;CALL Up





afterlesen:
CALL lesen
CALL lol
CALL return
CALL neu
CALL afterlesen
;CALL shellstart 







;-----------Funktionen------------
Right:
add dl, 1
call SetCursor
ret
RETN


Left:
sub dl, 1
call SetCursor
ret
RETN


Up:
sub dh, 1
call SetCursor
ret
RETN


Down:
add dh, 1
call SetCursor
ret
RETN


SetCursor:
mov ah, 02h
mov bh, 00
int 10h
ret



functest:
CALL return
CALL lol
CALL neu
MOV SI,BOOTLOADERSTR4
CALL printstr
RET
RETN


return:
MOV AH,0x0e
MOV AL,13
INT 0x10
MOV AL,10
INT 0x10
RET
RETN


lol:
MOV SI,BOOTLOADERSTR6
CALL printstr
RET
RETN


neu:
MOV AH,0x0e
MOV AL,'>'
INT 0x10
INT 0x10
INT 0x10
RET
RETN


lesen:
mov AH, 0h   ;get character from keyboard
int 0x16     ;and store it in AL
; CMP AL,94
; JE lesen
; CMP AL,95
; JE lesen
mov AH,0EH  ;Display a character in AL
int 0x10    ;aka, echo it
CMP AL,13
JNE lesen

RET
RETN

printstr:
CALL next_character1
RET
RETN
PrintCharacter1:
MOV AH, 0x0E
INT 0x10
next_character1:
MOV AL, [SI]
INC SI
CMP AL, 0
JNE PrintCharacter1
JE returnfunk
returnfunk:
RET
RETN


setcursor:
CursorCol  db 0
CursorRow  db 0

mov  dl, CursorCol
mov  dh, CursorRow
mov  bh, 0
mov  ah, 02h
int  10h
RET
RETN





TIMES 510 - ($ - $$) db 0
DW 0xAA55