//
//  main.cpp
//  L12functionPointer
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include <thread>
#include <unistd.h>


class father;

typedef void (father::*SA)();

typedef void(father::*CallaterHandler)();

#define CH(fp) (CallaterHandler)(&fp)
//真正的实现
void threadFunc(father *fa, CallaterHandler handler,int delay)
{
    sleep(delay);
    (fa->*handler)();
}

//函数的调用;
void callLater(father *fa, CallaterHandler handler,int delay)
{
    std::thread t(threadFunc,fa,handler,delay);
    t.join();
}

class father
{
    
public:
    
    SA sayHi;
    
};


class Hello:public father
{
public:
    Hello()
    {
//        sayHi = (SA)&Hello::HelloSayHi;
//        (this->*sayHi)();
        
//        callLater(this, (CallaterHandler)(&Hello::HelloSayHi), 3);
        callLater(this, CH(Hello::HelloSayHi), 3);
        
    }
    void HelloSayHi ()
    {
        printf("hello a\n");
    }
    
};




int main(int argc, const char * argv[])
{

    Hello *h = new Hello();
    
    delete h;
    return 0;
}

