//
//  MTAUtils.m
//  MTA
//
//  Created by nipengfei on 14-6-11.
//  Copyright (c) 2014年 360Buy. All rights reserved.
//

#import "MTAUtils.h"
#import "DES.h"
#import "Base64.h"
#import "MTAGlobal.h"
#import "UIDeviceAdditions.h"
#import "MTAOpenUDID.h"
#import "CheckNetwork.h"

// 用户pin存本地，des加密
#define USER_PIN_KEY                    @"this is the pinaddress key apoaffffe"

static NSString * deDes(NSString* t, NSString *key) {
    NSData *decData = [DES doDecryptWithString:t key:key];
    NSString *decStr = [[NSString alloc] initWithData:decData
                                             encoding:NSUTF8StringEncoding];
    return decStr;
}

@implementation MTAUtils

+ (NSString *)getOSVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)getDModel
{
    return [[UIDevice currentDevice] machine];
}

+ (NSString *)getDeviceModel
{
    return [UIDevice currentDevice].model;
}

+ (NSString *)getClientVersion
{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    if (nil == version) {
        version = @"1.0";
    }
	return version;
}

+(NSString *)getUserPin
{
    NSString* enPin = [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserEnPin"];
    if (enPin == nil) {
        enPin = deDes(enPin, USER_PIN_KEY);
    }
    return enPin;
}

+ (NSString *)getOpenUDID
{
    NSString *udid = [MTAOpenUDID value];
    if (udid) {
        return udid;
    }
    return @"";
}

+ (NSString *)getNetWorkType
{
    NetworkStatus status = [[CheckNetwork sharedCheckNetwork] internetConnectionStatus];
    switch (status) {
        case ReachableViaWiFi:
            return @"WIFI";
            break;
        case ReachableViaWWAN:
            return @"3G";
            break;
        case ReachableVia2G:
            return @"2G";
            break;
        default:
            return @"";
    }

    return @"";
}

+ (NSString *)getResolution
{
    int width = [[UIScreen mainScreen] currentMode].size.width;
    int height = [[UIScreen mainScreen] currentMode].size.height;
	return [NSString stringWithFormat:@"%d*%d",width, height];
}

//md5 32位 加密
+ (NSString *)md5:(NSString *)str withKey:(NSString *)key
{
    const char *cStr = [[NSString stringWithFormat:@"%@%@", str, key] UTF8String];
    unsigned char result[16];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );

    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15]];
}

@end
