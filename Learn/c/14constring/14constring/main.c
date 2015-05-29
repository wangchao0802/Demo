//
//  main.c
//  14constring
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>
#include <string.h>


int main(int argc, const char * argv[])
{

    char buf[100];
    
    memset(buf, 0, 100);
    
    
    sprintf(buf, "hello %s %d","jiji",23);
    
    printf("%s",buf);
    
    
    return 0;
}

