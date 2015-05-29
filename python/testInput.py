#!/usr/bin/python

fo = open("file.txt","wb")
fo.write("just write a language")
print "name ",fo.name
print "closed or",fo.closed
print "open model",fo.mode
fo.close()

import os
os.rename("file.txt","file1.txt")







