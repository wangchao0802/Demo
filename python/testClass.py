class Employee:
	'fuck'

	empCount = 0

	def __init__(self,name,salary):
		self.name = name 
		self.salary = salary
		Employee.empCount += 1
	def displayCount(self):
		print "totol employee :%d" %Employee.empCount
	
	def displayEmployee(self):
		print "name",self.name,",salay",self.salary

	def __del__(self):
		class_name = self.__class__.__name__ 
		print class_name,"destoryed"
		
emp1 = Employee("zark",2000)
emp2 = Employee("mini",5000)

emp1.displayEmployee();
emp2.displayCount();

print "total employee %d" %Employee.empCount

emp1.age = 29

if(hasattr(emp1,'age')):
	print "total employee " ,getattr(emp1,'age')
	delattr(emp1,'age')

if not(hasattr(emp1,'age')):
	print "no age"	

print "Emoplyee._doc",Employee.__doc__
print "============",Employee.__name__
print "=======",Employee.__module__
print "======",Employee.__bases__

m3 = Employee("haha",100)
m4 = m3
m5 = m3
print id(m3),m4,m5
del m3
del m4




















