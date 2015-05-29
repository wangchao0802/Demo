//
//  man.h
//  L03
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#ifndef __L03__man__
#define __L03__man__

#include <iostream>
#include "People.h"

class man: public  People
{
public:
    man(int age);
    
    void sayHello();
    
    
};



#endif /* defined(__L03__man__) */
