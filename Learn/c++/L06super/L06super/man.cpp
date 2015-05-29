//
//  man.cpp
//  L03
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include "man.h"



man::man(int age):People(age,1)
{
    People::sayHello();

}

void man::sayHello()
{
    
    printf("man say hello");
}


