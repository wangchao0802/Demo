#coding=utf-8

class Pather:
	parentArr = 100
	def __init__(self):
		print "fat父类调用"
	
	def parentMethod(self):
		print '调用父类方法'

	def hhah(self):
		print "say hi fa"

class Child(Pather):#定义子类
	__privateSe = 0
	publicSe = 1
	def __init__(self):
		#super(Pather,self)
		print '调用子类init方法'
	
	def childMethod(self):
		print "调用子类meth方法"
	
	def hhah(self):
		print "oh son"	
		self.__privateM()	
		#super(Pather,self)
	
	def __privateM(self):
		print "private"
		
c = Child()
c.childMethod()
c.parentMethod()
c.hhah()
print c.publicSe	
	
	
	
	
	
	
	
	
	