[bits 16]
[ORG 0x7C00]

mov si, BOOTLOADERSTR
call printstr

mov si, BOOTLOADERSTR1
call printstr

call Ende

;Definition
BOOTLOADERSTR db 'Bootloader (C)Bela 2018, inspiriert vom Yotuber "F.E.C.".', 13 , 10 ,  'HINWEIS: Dieses Betriebsystem ist komplett sinnlos. Es macht rein GRANIX.',13 , 10 , 0
BOOTLOADERSTR1 db 'Version: 3.1', 13 , 10 , 0
BOOTLOADERSTR2 db 'Teste alle Funktionen...', 13 , 10 ,0
BOOTLOADERSTR3 db 'Fertig!', 13 , 10, 13 , 10 ,0
BOOTLOADERSTR4 db 13 , 10 ,0
BOOTLOADERSTR5 db 'Die Shell startet jetzt:',13 , 10 ,0
BOOTLOADERSTR6 db 13,10,'\(^-^)/', 0

;Print
mov ah,0x0e
mov al,'H'
int 0x10

;Setgraphicsmode:
mov ah, 0x00
mov al, 0x13
int 10h

;lesen:
;mov ah, 0
;int 016h
;int 0x10
;lesenend:

;cleanscreen:
;XOR DX, DX
;XOR BH, BH
;mov AX, 200h
;int 10h
;cleanscreenend:


Ende:
    mov si,BOOTLOADERSTR2
    call printstr

    call functest

    mov si,BOOTLOADERSTR3
    call printstr

    mov si,BOOTLOADERSTR5
    call printstr


shellstart:
    call neu
    ;call Up

afterlesen:
    call lesen
    call lol
    call return
    call neu
    call afterlesen
    ;call shellstart 

;-----------Funktionen------------
Right:
    add dl, 1
    call SetCursor
    ret
    retn

Left:
    sub dl, 1
    call SetCursor
    ret
    retn


Up:
    sub dh, 1
    call SetCursor
    ret
    retn


Down:
    add dh, 1
    call SetCursor
    ret
    retn


SetCursor:
    mov ah, 02h
    mov bh, 00
    int 10h
    ret



functest:
    call return
    call lol
    call neu
    mov si,BOOTLOADERSTR4
    call printstr
    ret
    retn


return:
    mov ah,0x0e
    mov al,13
    int 0x10
    mov al,10
    int 0x10
    ret
    retn


lol:
    mov si,BOOTLOADERSTR6
    call printstr
    ret
    retn


neu:
    mov ah,0x0e
    mov al,'>'
    int 0x10
    int 0x10
    int 0x10
    ret
    retn


lesen:
    mov ah, 0h   ;get character from keyboard
    int 0x16     ;and store it in al
    ; cmp al,94
    ; je lesen
    ; cmp al,95
    ; je lesen
    mov ah,0EH  ;Display a character in al
    int 0x10    ;aka, echo it
    cmp al,13
    jne lesen

    ret
    retn

printstr:
    call next_character1
    ret
    retn

PrintCharacter1:
    mov ah, 0x0E
    int 0x10

next_character1:
    mov al, [si]
    inc si
    cmp al, 0
    jne PrintCharacter1
    je returnfunk

returnfunk:
    ret
    retn

setcursor:
    CursorCol  db 0
    CursorRow  db 0

    mov  dl, CursorCol
    mov  dh, CursorRow
    mov  bh, 0
    mov  ah, 02h
    int  10h
    ret
    retn

TIMES 510 - ($ - $$) db 0
DW 0xAA55