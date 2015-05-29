money  = 200

def addMoney():
	global money
	money = money+1
	print locals()
	print globals()
	pass

print money
addMoney()
print money



