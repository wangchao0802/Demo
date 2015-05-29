//
//  main.cpp
//  L17File
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <sstream>


using namespace std;

int main(int argc, const char * argv[])
{
//    ofstream of ("data.txt");
//    of <<"hello cpp\n";
//    of.close();
    

    ifstream inf ("data.txt");

    stringbuf sb;
    inf>>&sb;
    
//    char c;
//    inf>>c;
    
    cout <<sb.str()<<endl;
    return 0;
}

