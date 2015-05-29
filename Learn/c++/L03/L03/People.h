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

namespace jikexueyuan
{
    class People
    {
    private:
        int age;
        int sex;
        
    public:
        
        
        People();
        People(int age,int sex);
        int getAge();
        void sayHello();
        int getsex();
    };
    
}





#endif /* defined(__L01oop__People__) */
