//
//  NewPerson.h
//  TestDecorate
//
//  Created by WangChao on 8/4/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewPerson : NSObject
{
    
    NSString *_name;
}
-(id)initWithName:(NSString *)name;

-(void)show ;

@end
