//
//  main.cpp
//  L05superInit
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include "man.h"



int main(int argc, const char * argv[])
{
    man *m = new man(20);
    
    printf("%d",m->getAge());
    
    
    return 0;
}

