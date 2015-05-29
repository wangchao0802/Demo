//
//  main.cpp
//  L09overload
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>

using namespace std;



class hello
{
public:
    void sayhello()
    {
        printf("hello zhangpanpang\n");
    }
    
    void sayhello(string name)
    {
        string str = "hello";
        str+=name;
        cout<<str<<endl;
    }
    
    
};


int main(int argc, const char * argv[])
{

    hello *h = new hello();
    std::string  name = "zhang big pang";
    
    
    h->sayhello((char *)name.c_str());
    return 0;
}

