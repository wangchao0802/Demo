//
//  main.c
//  10functionPointer
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>

int sayhello ( int x)
{
    printf("say hello\n");
    return 3 +x;
}





int main(int argc, const char * argv[])
{

    int (*p)(int) ;
     p = sayhello;
    
   int b = p(8);
    printf("say hello %d\n",b);

    
    return 0;
}

