//
//  main.cpp
//  L11fakeFuction
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>

void hello ()
{
    printf("hello\n");

}


class Hello
{
    public :
    void operator()(int x)
    {
        printf("hello () %d\n",x);
    }
};




int main(int argc, const char * argv[])
{
    
    hello();
    
    Hello h;
    h(2);

    return 0;
}

