//
//  main.cpp
//  L16string
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include <string>
#include <sstream>


using namespace  std;


int main(int argc, const char * argv[])
{
    string str ;
    str += "hello";
    str += 22;
    
    cout<<str<<endl;
    
    
    stringstream ss;
    
    ss<<"fa"<<12<<"jike";
    cout<<ss.str()<<endl;
    
    
    
    return 0;
}

