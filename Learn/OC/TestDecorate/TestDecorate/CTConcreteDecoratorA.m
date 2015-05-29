//
//  CTConcreteDecoratorA.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTConcreteDecoratorA.h"

@implementation CTConcreteDecoratorA


-(void)operation
{
    [super operation];
    addState = @"tataa A";
    NSLog(@"具体对象 A 做做");
}

@end
