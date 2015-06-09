//
//  JDAppCenterObject.m
//  TestMJExtension
//
//  Created by clark on 15/6/2.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "JDAppCenterObject.h"

@implementation JDAppCenterObject

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"time":@"poz.time",
             @"city":@"poz.city",
             @"dataArray":@"data"
             };
}

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"dataArray":@"JDAppIconObject"
             };
}


@end
