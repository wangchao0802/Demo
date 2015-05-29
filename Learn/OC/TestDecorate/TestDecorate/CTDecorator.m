//
//  CTDecorator.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTDecorator.h"

@implementation CTDecorator

-(void)setcomponent:(CTComponent *)co
{
    _component = co;
}


-(void)operation
{
    if (_component) {
        [_component operation];
    }
}




@end
