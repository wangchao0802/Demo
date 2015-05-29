//
//  main.c
//  LearnC01
//
//  Created by WangChao on 6/19/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>

#define max(A,B) \
    A>B?A:B



int main(int argc, const char * argv[])
{

    printf("hello %d\n",max(2, 3));
    
    for (int i =0; i<10;  ) {
        printf("%d\n",i);
        i++;
    }
    
    
    return 0;
}

