//
//  main.cpp
//  L01oop
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>

#include "People.h"


using namespace jikexueyuan;


int main(int argc, const char * argv[])
{

    People *p = new People( );
    p->sayHello();
    delete p;

    return 0;
}

