//
//  main.cpp
//  L10operatror
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
     int getx()
    {
        return this->x;
    };
    
     int gety()
    {
        return this->y;
    };
    
    void setX(int x)
    {
        this->x = x;
    }
    
    
    
    Point(int x, int y)
    {
        this->x = x;
        this->y = y;
    }
    
    void add(Point *p)
    {
        add(p->getx(), p->gety());
    }
    
    void add (int x, int y)
    {
        this->x+=x;
        this->y+=y;
    }
    
   void operator +=(Point* p)
    {
        add(p);
    }
    
    void changeValue (Point * p)
    {
        p->setX(3);
        
    }
};



int main(int argc, const char * argv[])
{
    Point p(10,10);

//    p.add(p);
    
//    p += Point(14,10);
     p.setX(3);
    
     cout<<p.getx()<<"  "<< p.gety()<<" \n";

    
    
//    Point *p = new Point(4,5);
    
//    p->setX(18);
    
    
    
//    (*p) += new Point(13,2);
    
    
    
//    cout<<p->getx()<<"  "<< p->gety()<<" \n";
    
    
    return 0;
}

