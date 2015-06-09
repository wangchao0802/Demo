//
//  JDAppIconObject.h
//  TestMJExtension
//
//  Created by clark on 15/6/2.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JDShareObject;
@interface JDAppIconObject : NSObject

@property(nonatomic,copy) NSString *sourceValue;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *appCode;
@property(nonatomic,strong)JDShareObject *share;

@end
