//
//  JDSecondLevelObject.m
//  TestMJExtension
//
//  Created by clark on 15/6/2.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "JDSecondLevelObject.h"
#import "JDBannerObject.h"
#import "JDAppCenterObject.h"
#import "MJExtension.h"

@implementation JDSecondLevelObject

- (void)keyValuesDidFinishConvertingToObject
{
    if ([self.type isEqualToString:@"banner"])
    {
        self.bannerArray = [JDBannerObject objectArrayWithKeyValuesArray:self.content];
    }
    else if ([self.type isEqualToString:@"appcenter"])
    {
        self.data = [JDAppCenterObject objectWithKeyValues:self.content];
    }
//    else if ([self.type isEqualToString:@"by"])
//    {
//        
//    }
}



@end
