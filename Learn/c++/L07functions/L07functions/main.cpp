//
//  main.cpp
//  L07functions
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include "man.h"



int main(int argc, const char * argv[])
{
    
    People *p = new man(20);
    
    p->sayHello();
    
    p->eat();
    
    return 0;
}

