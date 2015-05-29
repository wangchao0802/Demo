//
//  NSWriteObject.m
//  TestMessageSend
//
//  Created by WangChao on 4/19/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "NSWriteObject.h"

@interface NSWriteObject()


@end



@implementation NSWriteObject

-(id)mutableCopyWithZone:(NSZone *)zone
{
    NSWriteObject *c1 = [[[self class] allocWithZone:zone] init];
    c1.aprope = [self.aprope mutableCopy];
    return c1;
}

- (id)copyWithZone:(NSZone *)zone
{
    NSWriteObject *copy = [[[self class] allocWithZone:zone] init];
    copy.aprope = [self.aprope copy];
    return copy;
}

//-(instancetype)init
//{
//    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"fuck u"
//                                 userInfo:nil];
//}

-(NSString*)description
{
    return @"description";
}

-(NSString*)debugDescription
{
    return @"debug";
}


-(void)test
{
    NSLog(@" write object go");
    
    self.aprope = @"hahah";
}

@end
