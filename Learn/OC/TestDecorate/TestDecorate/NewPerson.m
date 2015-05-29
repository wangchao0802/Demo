//
//  NewPerson.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "NewPerson.h"

@implementation NewPerson


-(id)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _name = name;
    }
    return self;
}

-(void)show
{
    NSLog(@"my name %@",_name);
}


@end
