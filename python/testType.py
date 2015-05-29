a = 100
b = 20
print "a int ",int(a)
print "a str",str(a)
print "repr a",repr(a)
#print "tuple a",tuple(a)
#print "list a",list(a,b)
print "char a",chr(a)

b = 'b'
print "b cha to int",ord(b)
print "a hex",hex(a)
print "oct a",oct(a)

import math

c = -2

print "c fabs",math.fabs(c)

print "a","b"+"c"+str(1)

d = 0o277
f = "helo"
print "%d %s" %(d ,f),"fuck"

print '''%afw<hetm>

'''

list1 = ['a','b','c','d']

print list1;

del list1[2]
print list1

print len(list1)
list1 = list1 +['e','f']

for x in list1:
	print x
	pass
list1.append("g")
print list1;

list1.insert(0,"0")
print list1;

tup1 =(39)
print tup1

dict ={'name':'zare','age':8,'class':'first'}
dict['school'] = "dps school"
print dict
del dict['name']
print dict
dict.clear()
print dict
del dict
#print dict

import time 

ticks = time.time()
print ticks

localtime = time.localtime(ticks)
print localtime.tm_year









