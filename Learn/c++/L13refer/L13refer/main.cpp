//
//  main.cpp
//  L13refer
//
//  Created by WangChao on 6/21/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <iostream>

using namespace::std;

class Point
{
private: int x, y;
    
public:

    
    Point(int x, int y)
    {
        this->x = x;
        this->y = y;
    }
    
    void add(Point &p)
    {
        add(p->getx(), p->gety());
    }
}



int main(int argc, const char * argv[])
{

    Point p1(1,1);
    Point p2(2,3);

    p1.add(p2);
    
    return 0;
}

