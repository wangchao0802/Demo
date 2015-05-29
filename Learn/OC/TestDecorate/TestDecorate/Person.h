//
//  Person.h
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    
    NSString *_name;
}

-(id)initWithName:(NSString *)name;


-(void) wearTshirts;

-(void) wearBigTrouser;


-(void) wearSneaker;

-(void) wearSuit;

-(void) wearTie;

-(void) wearLeathershoes;


-(void) show;
@end
