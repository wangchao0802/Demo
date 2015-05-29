//
//  main.c
//  15File
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    /*
    FILE *f = fopen("open.txt", "w");
    
    if (f!= NULL)
    {
        for (int i = 0 ; i<100; i++) {
            fprintf(f, "hello %d\n",i);
        }
    }
    
    fclose(f);
    */
    
    FILE *f = fopen("open.txt", "r");
    fseek(f, 0, SEEK_END);
//    printf("%ld",ftell(f));
    
    long size = ftell(f );
    char buf[size+1];
    
    fseek(f, 0, SEEK_SET);
    fread(buf, sizeof(unsigned char), size, f);
    buf[size] = '\0';
    fclose(f );
    printf("%s",buf);
    
    
    
    
    return 0;
}

