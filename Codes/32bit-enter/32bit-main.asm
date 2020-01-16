[org 0x7c00]; bootloader offset
	mov bp, 0x9000; stack set
	mov sp, bp
	mov bx, MSG_REAL_MODE
	call print
	call switch_to_pm
	jmp $; this will actually never be executed

%include "../bootsector-function-string/boot_sect_print.asm"
%include "../32bit-gdt/32bit-gdt.asm"
%include "../32bit-print/32bit-print.asm"
%include "32bit-switch.asm"

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm; will be qritten in the top left corner
	jmp $

MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0

;boot-sector
times 510-($-$$) db 0
dw 0xaa55
