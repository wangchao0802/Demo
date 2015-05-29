#coding=utf-8
#!/usr/bin/python

import threading
import time 

exitFlag = 0

class myThread(threading.Thread) :
		def __init__(self,threadID,name ,counter) :
			threading.Thread.__init__(self)
			self.threadID = threadID
			self.name = name 
			self.counter = counter
		def run(self):
			print "starting"+self.name 
			threadLock.acquire()
			print_time(self.name,self.counter,5)
			threadLock.release()
			print "exiting"+self.name 

def print_time(tName,dely,counter):
	while counter:
		if exitFlag:
			thread.exit()
		time.sleep(dely)
		print "%s %s" % (tName ,time.ctime(time.time()))
		counter -= 1

threadLock	=threading.Lock()	
th1 = myThread(1,"thread-1",1)
th2 = myThread(2,"thread-2",3)		
th1.start()
th2.start()

print "exit main thread"
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		