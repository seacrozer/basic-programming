section .data
section .bss
section .text
    global _start
_start:
    mov eax , 1
    xor ebx , ebx 
    int 0x80
