//
//  main.cpp
//  L15Container
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include <list>
#include <string>
#include <map>


using namespace::std;

int main(int argc, const char * argv[])
{
    list<string> l;
    l.push_back("zhang pan");
    l.push_back("chao ge");
    
    for (list<string>::iterator it = l.begin(); it != l.end(); it++)
    {
//        cout<< *it<<endl;
    }
    
    map<string, string> m;
    m.insert(pair<string, string>("hello","aaa"));
    m.insert(pair<string, string>("name","zhangsan"));
    cout<<m.at("hello")<<endl;
    
    m["fuck"] = "simm";
    
    cout<<m["fuck"]<<endl;
    
    
    
    
    return 0;
}

