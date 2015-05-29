#coding=utf-8 
#!/usr/bin/python

import thread
import time

#定义一个函数
def print_time(threadName,delay):
	cout = 0
	while cout < 5:
		time.sleep(delay);
		cout = cout +1
		print "%s %s" % (threadName,time.ctime(time.time()))

try :
	thread.start_new_thread(print_time,("thread-1",2,))
	thread.start_new_thread(print_time,("thread-2",4,))
except:
	print "error : unable to start thread"

while 1:
	pass
		
		
		
		
		
		