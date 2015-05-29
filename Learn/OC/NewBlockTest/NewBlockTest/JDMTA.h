//
//  MTA.h
//  MTA
//
//  Created by nipengfei on 14-6-11.
//  Copyright (c) 2014年 360Buy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    JDMTA_TYPE_PV = 1,          // PV数据
    JDMTA_TYPE_PERFORMANCE = 2, // 性能数据
    JDMTA_TYPE_CLICK = 3        // 点击数据
}JDMTA_TYPE;

@interface JDMTA : NSObject

+ (JDMTA *)sharedMTA;

// 在application:didFinishLaunchingWithOptions:调用
+ (void)start;

/** 
 * 上报网络异常数据  注意传入参数的key/value均为字符串格式
 *
 */
+ (void)recordNetworkAbnormalData:(NSDictionary *)data;

/**
 * 上报PV/Performance/Click数据  注意传入参数的key/value均为字符串格式
 * 
 */
+ (void)recordWithType:(JDMTA_TYPE)type data:(NSDictionary *)data;


@end
