#coding=utf-8  
from itertools import count  
from hashlib import md5
s = raw_input("Input the code: ")
salt = s.decode("base64")
for i in count():
	if md5(salt+str(i)).hexdigest().startswith("0000"):
		print str(i).encode("base64")
		print "success"
		break
	print i

