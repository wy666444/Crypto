from sage.all import *
import binascii
n = 0x82e09fa59b5daee41ace9f0a7b2706dc7ac9680e8380d4c9e4c75307db878d45e5922d857822cfed5c0914926199180b27b20ae8d744a6a6c61547050e22b82ef9e9cfa1b8742429dcdfdb7b7259514c2c1cd1717f4097fb271cbf5037199500293489dfb09388117651d32f29aff1e675f3434e93b87f70157669048d1307cf5172257eaf4a615dc5d8395de7a17134cccfb328e781f61fe4c7f6d31e9132d4351ce3a9544d441e727e5c368d78ae20ab8cb436d9a5dca9e4d3984d042f483ba8cb89f42e9dad61b7a8ea9c9d36cd76b4a19fe6c41904530495ca0c84769358035f23a88dae04cf9a226974824ba92ddcff46250b679ebd5bfdccd4a6ee3a57


p4 =0xef1c089db99801c6e6ee28e29df17e04262886de22c8cdc3a2052123bfae61d99936927450b2f250c6506d5718b5d3dbe2b34d5766d8589df44a1ca66aa757da53f1989aff39a4
cipher = 0x4a6e4cf55ee8dde2adab6ece5954ab6df7c04698fc00b8600d600b96a06aa941daa3bbcdface80b4e25601784aebdd65b6802edb5d1057649cd3670870bccdb68a451f505555e32c2560b9ed136a5519c9a29e7b77f644ee6d6f00ffb8e60676d128d6c707b05b1cb7c29e89bef1236842561a6528f13477b68b0da886b410761aac1c7b59e5837771c3ca84b87c1015e6eceef94675eede327ba79d3145ac8924a03c996df8286a56b66b6285ff3eee5779c6d5cf9f7e71adfe40cd4b288ccdc1946542c9eefb515e07d480c830fa05922066d585aa7847a31308de83bf695e4849ce40609af0e38b35d5e3d20dd97ad18a3d1b18f26d6df494e70ab966080c

e2 = 0x10001
pbits = 1024
kbits = pbits - p4.nbits()
print p4.nbits()
p4 = p4 << kbits
PR.<x> = PolynomialRing(Zmod(n))
f = x + p4
print f
roots = f.small_roots(X=2^kbits, beta=0.4)
print roots
if roots:
    p = p4+int(roots[0])
    print "p: ", hex(int(p))
    assert n % p == 0
    q = n/int(p)
    print "q: ", hex(int(q))
    print gcd(p,q)
    phin = (p-1)*(q-1)
    print gcd(e2,phin)
    d = inverse_mod(e2,phin)
    flag = pow(cipher,d,n)
    flag = hex(int(flag))[2:-1]
    print binascii.unhexlify(flag)
	