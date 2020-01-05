;
;A simple boot sector that prints a message to the screen using a BIOS routine.
;

mov ah, 0x0e ;int 10/ ah = 0 eh -> scrolling teletype BIOS routine

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
jmp $ ;jump to the current address(i.e. forever)
;
; Padding and magic bios  number
;
times 510 -( $ - $$ ) db 0 ; pad the boot sector out with 0s
dw 0xaa55 ; last tow bytes is the magic number so that BIOS knows we are in the boot sector
