print_string:
  pusha
  mov ah, 0x0e
  mov al, [bx]
  int 0x10
  cmp al, 0
  jne increment
  jmp the_end

increment:
  add bx, 1
  mov al, [bx]
  int 0x10
  cmp al, 0
  jne increment
  jmp the_end

the_end:
  popa
  ret

