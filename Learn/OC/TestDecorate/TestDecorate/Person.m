//
//  Person.m
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        _name = name;
    }
    return self;
}


-(void) wearTshirts
{
    NSLog(@" big T shirt");
}

-(void) wearBigTrouser
{
    NSLog(@" big Trouse");
}


-(void) wearSneaker
{
    NSLog(@" poor shones");
}

-(void) wearSuit
{
    NSLog(@" xi zhuang");
}

-(void) wearTie
{
    NSLog(@" wearTie");
}

-(void) wearLeathershoes
{
    NSLog(@" wearLeathershoes");
}


-(void) show
{
    NSLog(@"  wo d zhuang ban %@",_name);

}


@end
