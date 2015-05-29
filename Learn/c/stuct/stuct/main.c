//
//  main.c
//  stuct
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>


struct People
{
    int age;
    char *name;
};



int main(int argc, const char * argv[])
{
    struct People p;
    p.age = 10;
    p.name = "zhangpangpang";
    
    struct People p1 = p;
    p1.age = 20;
    
    printf("age %d\n",p1.age);
    printf("age:%d\n",p.age);

    
    
    return 0;
}

