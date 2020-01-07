;
; load DH sectors to ES : BX from drive DL
;
disk_load:
   push dx; for reuse of dx(the number of sectors)
   mov ah, 0x02; BIOS read sector function
   mov al, dh; read dh sectors
   mov ch, 0x00; cylinder 0
   mov dh, 0x00; select head 0
   mov cl, 0x02; Start reading from 2nd sector(i.e. 
               ; after the boot sector
   int 0x13; BIOS interrupt
   
   jc disk_error; jump if error(carry flag set)
   
   pop dx; Restore DX from the stack
   cmp dh, al; if AL ( sectors read ) != DH ( sectors expected )
   jne disk_error
   ret
disk_error :
   mov bx, DISK_ERROR_MSG
   call print_string
   jmp $
; Variables
DISK_ERROR_MSG: db " Disk read error ! " , 0
;test this routine with a boot sector program
