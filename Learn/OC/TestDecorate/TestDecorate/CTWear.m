//
//  CTWear.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTWear.h"

@implementation CTWear


-(void)wear:(NewPerson *)p
{
    _person = p;
}

-(void)show
{
    if (_person)
    {
        [_person show];
    }
}



@end
