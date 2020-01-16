[org 0x7c00]

mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

jmp $

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

;data

HELLO:
	db 'HELLO, WORLD',0

GOODBYE:
	db 'GOODBYE',0

times 510-($-$$) db 0
dw 0xaa55
