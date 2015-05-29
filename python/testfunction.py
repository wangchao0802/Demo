#!coding=utf-8
def printme(str,name ="leyi"):
	"您好打印"
	print str+" "+name
	return
printme(str ="hi");

def printinfo(arg,*args):
	"input a "
	print arg
	for a in args:
		print a
	return;

printinfo("fuck")

sum = lambda arg1,agr2:arg1 +agr2

print sum(2,3)

