try:
	fh = open("testf","r")
	fh.write("sx")
	pass
except IOError:
	print "except"
	raise
else:
	print "normal"
	pass
finally:
	print "go"
	pass