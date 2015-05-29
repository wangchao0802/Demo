//
//  main.c
//  StructPoint
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>

#include <stdlib.h>

struct people
{
    int age;
};



int main(int argc, const char * argv[])
{
    struct people *p = malloc(sizeof(struct people)) ;
    (*p).age = 10;
    
    struct people *p1 = p;
    p->age = 12;
    
    printf("age%d\n",p1->age);
    
    free(p);
    
    
    return 0;
}

