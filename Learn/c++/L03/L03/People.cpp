//
//  People.cpp
//  L01oop
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include "People.h"

using namespace::jikexueyuan;

void People::sayHello()
{
    printf("say hello \n");
}

People::People()
{
    this->age = 10;
    (*this).sex = 2;
}



People::People(int age,int sex)
{
    this->age = age;
    this->sex = sex;
}

int People::getAge()
{
    return this->age;
}

int People::getsex()
{
    return this->sex;
}







