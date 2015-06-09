//
//  User.h
//  testMJExtensionEx
//
//  Created by clark on 5/14/15.
//  Copyright (c) 2015 clark. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface User : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) unsigned int age;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;

-(void)testMethod:(int) arg1;


-(void)testMethod2:(int)arg1;

@end


@protocol userPro <NSObject>

-(void)testMethod32:(int)arg1;

@end