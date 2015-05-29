//
//  MTAUtils.h
//  MTA
//
//  Created by nipengfei on 14-6-11.
//  Copyright (c) 2014年 360Buy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTAUtils : NSObject

+ (NSString *)getUserPin;
+ (NSString *)getOpenUDID;
+ (NSString *)getClientVersion;
+ (NSString *)getOSVersion;
+ (NSString *)getDModel;
+ (NSString *)getNetWorkType;
+ (NSString *)getResolution;
+ (NSString *)getDeviceModel;
+ (NSString *)md5:(NSString *)str withKey:(NSString *)key;

@end
