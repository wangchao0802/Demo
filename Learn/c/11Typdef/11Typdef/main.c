//
//  main.c
//  11Typdef
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>

typedef   struct
{
    int age ;
}  people;

void sayhelo()
{
    printf("hello panpan\n");

}


typedef void(*func)();



int main(int argc, const char * argv[])
{    people   fuck;
    fuck.age =10;
    
    printf("hello %d\n",fuck.age);

    func  f = sayhelo;
    f();
    
    return 0;
}

