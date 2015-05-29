//
//  main.cpp
//  L14friendClass
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>


class A
{
    
    friend class B;
    
    int num;
public:
    
    A()
    {
        num = 10;
    }
    
};



class B
{
public:
    B()
    {
        A a;
        printf("%d\n",a.num);
    }
};







int main(int argc, const char * argv[])
{

    new B();
    return 0;
}

