//
//  main.cpp
//  L04init
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>

class object
{
public:
    object()
    {
        printf("create object\n");
    }
    
    ~object()
    {
        printf("delete ojbect\n");
    }
    
};









int main(int argc, const char * argv[])
{
//   object *obj = new  object();
   
//    delete obj;
    
    object obj;
    
    printf("end\n");
    
    
    return 0;
}

