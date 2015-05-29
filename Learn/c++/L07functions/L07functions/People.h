//
//  People.h
//  L01oop
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#ifndef __L01oop__People__
#define __L01oop__People__

#include <iostream>


    class People
    {
    private:
        int age;
        int sex;
        
    public:
        
        
        People();
        People(int age,int sex);
        int getAge();
        virtual void sayHello();
        int getsex();
        
        virtual void eat()=0;
        
        
    };
    





#endif /* defined(__L01oop__People__) */
