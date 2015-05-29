//
//  main.c
//  16game
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    srand((int)time(NULL));
    int randNum = rand()%1000;
    printf("%d",randNum);
    
    int userInput;
    while (1)
    {
        scanf("%d",&userInput);
        
        if (userInput <randNum) {
            printf("xiaola");
        }
        else if (userInput >randNum)
        {
            printf("da lalla");
        }
        else
        {
            printf(" kao dui la");
            break;
        }
    }
    
    
    
    
    return 0;
}

