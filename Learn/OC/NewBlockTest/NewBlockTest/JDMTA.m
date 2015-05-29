//
//  MTA.m
//  MTA
//
//  Created by nipengfei on 14-6-11.
//  Copyright (c) 2014年 360Buy. All rights reserved.
//

#import <UIKit/UIApplication.h>
#import "JDMTA.h"
#import "FMDB.h"
#import "MTAUtils.h"
#import "MTAGlobal.h"
#import "NSData+Json.h"

static JDMTA *sharedMTA = nil;

#pragma mark - MTAStrategy

@interface MTAStrategy : NSObject

enum
{
    STRATEGE_TYPE_NETWORK,
    STRATEGE_TYPE_PERFORMANCE
};

// 服务器返回字段
@property (nonatomic) long sendMinIntervalWifi;  // 发送时间间隔       优先级最低
@property (nonatomic) long sendMinLinesWifi;     // 数据满多少条后上传  优先级其次
@property (nonatomic) long sendMinInterval3G;    // 发送时间间隔       优先级最低
@property (nonatomic) long sendMinLines3G;       // 数据满多少条后上传  优先级其次
@property (nonatomic) long sendMinInterval2G;    // 发送时间间隔       优先级最低
@property (nonatomic) long sendMinLines2G;       // 数据满多少条后上传  优先级其次
@property (nonatomic) BOOL isSendEnabled;       // 是否上传数据       优先级最高

@property (nonatomic) BOOL sendImmediately;     // 是否立即上传数据（用于调试模式）
@property (nonatomic) BOOL isSendingData;       // 是否正在上传数据
@property (nonatomic) long lastFailedTimestamp; // 上次上传数据失败时间戳

@end

@implementation MTAStrategy


@end

#pragma mark - MTA

@interface JDMTA()

@property (nonatomic, retain)NSOperationQueue *operateQueue;
@property (nonatomic, retain)FMDatabaseQueue *databaseQueue;
@property (nonatomic, retain)NSOperationQueue *networkQueue;
@property (nonatomic, retain)MTAStrategy *networkAbnormalStrategy;  //网络异常上报策略
@property (nonatomic, retain)MTAStrategy *performancePVStrategy;    //性能及PV上报策略

@end

@implementation JDMTA

#pragma mark - properties

- (FMDatabaseQueue *)databaseQueue
{
    if (!_databaseQueue) {
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *databasePath = [documentPath stringByAppendingPathComponent:MTA_DATABASE_FILENAME];
        NSLog(@"database path is %@", databasePath);
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
        
        // create table
        [_databaseQueue inDatabase:^(FMDatabase *db)
        {
            // 创建网络异常表
            NSString *createTableSQL = [NSString stringWithFormat:
                                        @"CREATE TABLE if not exists '%@' ( \
                                        '%@' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \
                                        '%@' integer NOT NULL, \
                                        '%@' text NULL)",
                                        NETWORK_TABLE_NAME,
                                        NETWORK_COL_ID,
                                        NETWORK_COL_TIME,
                                        NETWORK_COL_DATA];
            
            BOOL res = [db executeUpdate:createTableSQL];
            if (!res)
            {
                NSLog(@"error when creating table %@", NETWORK_TABLE_NAME);
            }
            else
            {
                NSLog(@"success to creating table %@", NETWORK_TABLE_NAME);
            }
            
            // 创建性能表
            NSString *createPerformanceTableSQL = [NSString stringWithFormat:
                                        @"CREATE TABLE if not exists '%@' ( \
                                        '%@' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, \
                                        '%@' varchar(8) not null, \
                                        '%@' integer not null, \
                                        '%@' text NULL)",
                                        PERFORMANCEPV_TABLE_NAME,
                                        PERFROMANCEPV_COL_ID,
                                        PERFORMANCEPV_COL_TYPE,
                                        PERFORMANCEPV_COL_TIME,
                                        PERFORMANCEPV_COL_DATA];
            
            res = [db executeUpdate:createPerformanceTableSQL];
            if (!res)
            {
                NSLog(@"error when creating table %@", PERFORMANCEPV_TABLE_NAME);
            }
            else
            {
                NSLog(@"success to creating table %@", PERFORMANCEPV_TABLE_NAME);
            }


        }];
    }
    
    return _databaseQueue;
}

- (NSOperationQueue *)networkQueue
{
    if (!_networkQueue)
    {
        _networkQueue = [[NSOperationQueue alloc] init];
        [_networkQueue setName:@"com.jd.queue.mta"];
        [_networkQueue setMaxConcurrentOperationCount:1];
    }
    
    return _networkQueue;
}

- (NSOperationQueue *)operateQueue
{
    if (!_operateQueue)
    {
        _operateQueue = [[NSOperationQueue alloc] init];
        [_operateQueue setName:@"com.jd.opqueue.mta"];
    }
    
    return _operateQueue;
}

- (MTAStrategy *)networkAbnormalStrategy
{
    if (!_networkAbnormalStrategy)
    {
        _networkAbnormalStrategy = [[MTAStrategy alloc] init];
        _networkAbnormalStrategy.sendMinLinesWifi = MTA_DEFAULT_SEND_MIN_LINES;
        _networkAbnormalStrategy.sendMinIntervalWifi = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _networkAbnormalStrategy.sendMinLines3G = MTA_DEFAULT_SEND_MIN_LINES;
        _networkAbnormalStrategy.sendMinInterval3G = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _networkAbnormalStrategy.sendMinLines2G = MTA_DEFAULT_SEND_MIN_LINES;
        _networkAbnormalStrategy.sendMinInterval2G = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _networkAbnormalStrategy.isSendingData = NO;
        _networkAbnormalStrategy.isSendEnabled = YES;
        _networkAbnormalStrategy.lastFailedTimestamp = 0;
        
        #ifdef DEBUG
        _networkAbnormalStrategy.sendImmediately = YES;
        #else
        _networkAbnormalStrategy.sendImmediately = NO;
        #endif
    }
    
    return _networkAbnormalStrategy;
}

- (MTAStrategy *)performancePVStrategy
{
    if (!_performancePVStrategy)
    {
        _performancePVStrategy = [[MTAStrategy alloc] init];
        _performancePVStrategy.sendMinLinesWifi = MTA_DEFAULT_SEND_MIN_LINES;
        _performancePVStrategy.sendMinIntervalWifi = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _performancePVStrategy.sendMinLines3G = MTA_DEFAULT_SEND_MIN_LINES;
        _performancePVStrategy.sendMinInterval3G = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _performancePVStrategy.sendMinLines2G = MTA_DEFAULT_SEND_MIN_LINES;
        _performancePVStrategy.sendMinInterval2G = MTA_DEFAULT_SEND_MIN_INTERVAL;
        _performancePVStrategy.isSendingData = NO;
        _performancePVStrategy.isSendEnabled = YES;
        _performancePVStrategy.lastFailedTimestamp = 0;
        
#ifdef DEBUG
        _performancePVStrategy.sendImmediately = YES;
#else
        _performancePVStrategy.sendImmediately = NO;
#endif
    }
    
    return _performancePVStrategy;
}


- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onDidApplicationBecomeActive)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onWillApplicationEnterBackground)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onDidApplicationRecvMemoryWarning)
                                                     name:UIApplicationDidReceiveMemoryWarningNotification
                                                   object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidBecomeActiveNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidReceiveMemoryWarningNotification
                                                  object:nil];
    [_networkQueue release];
    [_databaseQueue release];
    [_operateQueue release];
    [_networkAbnormalStrategy release];
    [_performancePVStrategy release];
    
    [super dealloc];
}

+ (JDMTA *)sharedMTA
{
    if (!sharedMTA)
    {
        sharedMTA = [[JDMTA alloc] init];
    }
    
    return sharedMTA;
}

#pragma mark - send data via post

// 字典内部各种参数的处理，确保只传入字符串，其他类型若无法处理直接丢弃
- (NSString *)wrapString:(id)str
{
    if ([str isKindOfClass:[NSString class]])
    {
        return (NSString *)str;
    }
    else if ([str isKindOfClass:[NSNumber class]])
    {
        return [(NSNumber *)str stringValue];
    }
    else if ([str isKindOfClass:[NSObject class]])
    {
        return [NSString stringWithFormat:@"%@", str];
    }
    else
    {
        return @"";
    }
}

// 网络异常上报公共参数
- (NSMutableDictionary *)commonParamsForNetwork
{
    /* 参数说明
     {accountId:”123”,machineCode:”ABC”,machineType:”xiaomi”,
     os:”ios”,osVersion:”7”,app:”h5”,appVersion:”3.6.0”,net:”wifi”,
     sdkVersion:”1”,curTime:”12345”,token:”1234”}
     
     accountId用户ID，未登录传””
     machineCode机器码
     machineType机型
     os操作系统，集合{ios, android}
     osVersion操作系统版本号
     app客户端类型，集合{iphone, ipad, android, h5}
     appVersion客户端版本号
     net客户端网络，集合{wifi, 3g , 2g} 传最好情况，如同时有wifi和3g，则传wifi
     sdkVersion  sdk版本号
     curTime:客户端当前时间戳
     token:  base64Encode(md5(curTime + key)) 
     */
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
    
    [dict setObject:[MTAUtils getUserPin] forKey:@"accountId"];
    [dict setObject:[MTAUtils getOpenUDID] forKey:@"machineCode"];
    NSString *deviceModel = [MTAUtils getDeviceModel];
    [dict setObject:deviceModel forKey:@"machineType"];
    if ([deviceModel rangeOfString:@"iPhone"].location != NSNotFound) {
        [dict setObject:@"iphone" forKey:@"app"];
    }
    else
    {
        [dict setObject:@"ipad" forKey:@"app"];
    }
    [dict setObject:@"ios" forKey:@"os"];
    [dict setObject:MTA_SDK_VERSION forKey:@"sdkVersion"];
    [dict setObject:[MTAUtils getOSVersion] forKey:@"osVersion"];
    [dict setObject:[MTAUtils getClientVersion] forKey:@"appVersion"];
    [dict setObject:[[MTAUtils getNetWorkType] lowercaseString] forKey:@"net"];
    
    long timestamp = (long)[[NSDate date] timeIntervalSince1970];
    [dict setObject:[NSString stringWithFormat:@"%ld", timestamp] forKey:@"curTime"];
    [dict setObject:[MTAUtils md5:[NSString stringWithFormat:@"%ld", timestamp] withKey:MTA_SDK_PRIVATE_KEY] forKey:@"token"];
    
    return dict;
}

- (NSMutableDictionary *)commonParamsForPerformancePV
{
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
    
    double timestamp = [[NSDate date] timeIntervalSince1970];
    [dict setObject:[NSString stringWithFormat:@"%f", timestamp] forKey:@"report_ts"];
    [dict setObject:@"1" forKey:@"proj_id"];
    [dict setObject:[MTAUtils getUserPin] forKey:@"uid"];
    [dict setObject:[MTAUtils getOpenUDID] forKey:@"guid"];
    [dict setObject:@"ios" forKey:@"client"];
    [dict setObject:[MTAUtils getOSVersion] forKey:@"osv"];
    [dict setObject:[MTAUtils getClientVersion] forKey:@"appv"];
    [dict setObject:[MTAUtils getResolution] forKey:@"resolu"];
    NSString *deviceModel = [MTAUtils getDeviceModel];
    [dict setObject:deviceModel forKey:@"device"];
    [dict setObject:MTA_SDK_VERSION forKey:@"sdkv"];
    [dict setObject:@"" forKey:@"channel"];

    [dict setObject:[NSString stringWithFormat:@"%ld", (long)timestamp] forKey:@"curTime"];
    [dict setObject:[MTAUtils md5:[NSString stringWithFormat:@"%ld", (long)timestamp] withKey:MTA_SDK_PRIVATE_KEY] forKey:@"token"];
    
    return dict;
}

- (void)requestURL:(NSString *)url withPostBody:(NSData *)postBody
                              completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler
{
//    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc]
//                                     initWithURL:[NSURL URLWithString:url]
//                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                     timeoutInterval:30] autorelease];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:postBody];
//    
//    NSLog(@"begin send data to url:%@, data:%@", MTA_SEND_NETWORK_DATA_URL, [NSString stringWithUTF8String:[postBody bytes]]);
//    
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:self.networkQueue
//                           completionHandler:handler];
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                         initWithURL:[NSURL URLWithString:url]
                                         cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:30];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:postBody];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if (handler)
        {
            handler(response, responseData, error);
        }
        [request release];
    }];
    [operation setQueuePriority:NSOperationQueuePriorityVeryLow];
    [self.networkQueue addOperation:operation];
}

/** 网络异常上报策略数据格式:
 *
 * 字符串：{ret:1, wifiInt:”10”,wifiSz:”100”,g3Int:”10”,g3Sz:”100”,g2Int:”10”,g2Sz:”100”}
 * ret  1--上报  0--不上报
 * Int: 隔多少秒上报一次
 * Sz:累计多少条数据上报一次
 */
- (void)updateStrategy:(MTAStrategy *)strategy withString:(NSString *)strategyString
{
    if ([strategyString length])
    {
        NSError *err = nil;
        NSDictionary *strategyDict = [NSJSONSerialization JSONObjectWithData:[strategyString dataUsingEncoding:NSUTF8StringEncoding]
                                                                     options:0
                                                                       error:&err];
        if (strategyDict) {
            strategy.isSendEnabled = [(NSString *)[strategyDict objectForKey:@"ret"] integerValue] > 0;
            strategy.sendMinIntervalWifi = [(NSString *)[strategyDict objectForKey:@"wifiInt"]  integerValue];
            strategy.sendMinLinesWifi = [(NSString *)[strategyDict objectForKey:@"wifiSz"] integerValue];
            strategy.sendMinInterval3G = [(NSString *)[strategyDict objectForKey:@"g3Int"] integerValue];
            strategy.sendMinLines3G = [(NSString *)[strategyDict objectForKey:@"g3Sz"] integerValue];
            strategy.sendMinInterval2G = [(NSString *)[strategyDict objectForKey:@"g2Int"] integerValue];
            strategy.sendMinLines2G = [(NSString *)[strategyDict objectForKey:@"g2Sz"] integerValue];
            
        }
        else
        {
            NSLog(@"JSON deserialization failed for %@", strategyString);
        }
    }
}

// 上报网络异常数据
- (void)sendNetworkAbnormalData:(NSArray *)data
{
    if (self.networkAbnormalStrategy.isSendingData)
    {
        return;
    }
    else
    {
        self.networkAbnormalStrategy.isSendingData = YES;
    }
    
    // 失败后重发时间间隔不能小于MTA_NETWORK_REQUEST_RETRY_TIME
    if ([[NSDate date] timeIntervalSince1970] - self.networkAbnormalStrategy.lastFailedTimestamp < MTA_NETWORK_REQUEST_RETRY_TIME)
    {
        return;
    }
    
    NSMutableData *postBody = [NSMutableData data];
    NSMutableDictionary *params = [self commonParamsForNetwork];
    NSMutableArray *dataIDs = [[[NSMutableArray alloc] init] autorelease];
    NSMutableArray *dataload = [[NSMutableArray alloc] init];
    
    for (NSDictionary *recordDict in data)
    {
        if (recordDict)
        {
            NSMutableDictionary *dict = [recordDict mutableCopy];
            
            for (NSString *key in [dict allKeys])
            {
                if ([key isEqualToString:NETWORK_COL_ID])
                {
                    [dataIDs addObject:[dict objectForKey:NETWORK_COL_ID]];
                    [dict removeObjectForKey:NETWORK_COL_ID];
                    break;
                }
            }
            
            [dataload addObject:dict];
            [dict release];
        }
    }
    
    [params setObject:dataload forKey:@"data"];
    [dataload release];
    
    if (params)
    {
        NSString *dataString = [params stringFromJson];
        NSLog(@"Sending network data: %@", dataString);
        [postBody appendData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    __block __typeof__(self) weakSelf = self;

    [self requestURL:MTA_SEND_NETWORK_DATA_URL
        withPostBody:postBody
   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        weakSelf.networkAbnormalStrategy.isSendingData = NO;
        
       if (connectionError)
       {
           if ([connectionError code] == NSURLErrorTimedOut)
           {
               // 为避免给服务器发送重复数据，超时后删除本地数据（有可能丢失数据）
               [weakSelf.operateQueue addOperationWithBlock:^{
                   [weakSelf removeSentDataByIDs:dataIDs fromTable:NETWORK_TABLE_NAME];
               }];
           }
           
           NSLog(@"send data failed: %@", connectionError.description);
           weakSelf.networkAbnormalStrategy.lastFailedTimestamp = (long)[[NSDate date] timeIntervalSince1970];
           return;
       }
       
       if ([response isKindOfClass:[NSHTTPURLResponse class]])
       {
           NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
           if ([res statusCode] != 200)
           {
               NSLog(@"send data failed with status %ld", (long)[res statusCode]);
               return;
           }
       }
       
       NSString *strategyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       NSLog(@"get strategy from server: %@", strategyString);
       [weakSelf updateStrategy:weakSelf.networkAbnormalStrategy withString:strategyString];
       [strategyString release];

       // 删除发送成功的数据
       [weakSelf.operateQueue addOperationWithBlock:^{
           [weakSelf removeSentDataByIDs:dataIDs fromTable:NETWORK_TABLE_NAME];
       }];
   }];
}

- (void)sendPerformancePVData:(NSArray *)data
{
    if (self.performancePVStrategy.isSendingData)
    {
        return;
    }
    else
    {
        self.performancePVStrategy.isSendingData = YES;
    }
    
    // 失败后重发时间间隔不能小于MTA_NETWORK_REQUEST_RETRY_TIME
    if ([[NSDate date] timeIntervalSince1970] - self.performancePVStrategy.lastFailedTimestamp < MTA_NETWORK_REQUEST_RETRY_TIME)
    {
        return;
    }
    
    NSMutableData *postBody = [NSMutableData data];
    NSMutableDictionary *params = [self commonParamsForPerformancePV];
    [params setObject:MTA_PERFORMANCE_METHOD_SEND forKey:@"method"];
    NSMutableArray *dataIDs = [[[NSMutableArray alloc] init] autorelease];
    NSMutableArray *dataload = [[NSMutableArray alloc] init];

    for (NSDictionary *recordDict in data)
    {
        if (recordDict)
        {
            NSMutableDictionary *dict = [recordDict mutableCopy];

            for (NSString *key in [dict allKeys])
            {
                if ([key isEqualToString:PERFROMANCEPV_COL_ID])
                {
                    [dataIDs addObject:[dict objectForKey:PERFROMANCEPV_COL_ID]];
                    [dict removeObjectForKey:PERFROMANCEPV_COL_ID];
                }
                else if ([key isEqualToString:PERFORMANCEPV_COL_TIME])
                {
                    [dict removeObjectForKey:PERFROMANCEPV_COL_ID];
                }
            }
            
            [dataload addObject:dict];
            [dict release];
        }
    }
    
    [params setObject:dataload forKey:@"data"];
    [dataload release];
    
    if (params)
    {
        NSString *dataString = [params stringFromJson];
        NSLog(@"Sending performance data: %@", dataString);
        [postBody appendData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    __block __typeof__(self) weakSelf = self;
    
    [self requestURL:MTA_PERFORMANCE_REQ_URL
        withPostBody:postBody
   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         weakSelf.performancePVStrategy.isSendingData = NO;
         
         if (connectionError)
         {
             if ([connectionError code] == NSURLErrorTimedOut)
             {
                 // 为避免给服务器发送重复数据，超时后删除本地数据（有可能丢失数据）
                 [weakSelf.operateQueue addOperationWithBlock:^{
                     [weakSelf removeSentDataByIDs:dataIDs fromTable:PERFORMANCEPV_TABLE_NAME];
                 }];
             }
             
             NSLog(@"send data failed: %@", connectionError.description);
             weakSelf.performancePVStrategy.lastFailedTimestamp = (long)[[NSDate date] timeIntervalSince1970];
             return;
         }
         
         if ([response isKindOfClass:[NSHTTPURLResponse class]])
         {
             NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
             if ([res statusCode] != 200)
             {
                 NSLog(@"send data failed with status %ld", (long)[res statusCode]);
                 return;
             }
         }
         
         NSString *strategyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         NSLog(@"get strategy from server: %@", strategyString);
         [weakSelf updateStrategy:weakSelf.performancePVStrategy withString:strategyString];
         [strategyString release];
         
         // 删除发送成功的数据
         [weakSelf.operateQueue addOperationWithBlock:^{
             [weakSelf removeSentDataByIDs:dataIDs fromTable:PERFORMANCEPV_TABLE_NAME];
         }];
     }];
}

// 查询网络异常数据上报策略
- (void)queryStrategyByType:(int)type
{
    NSMutableDictionary *commonParams = nil;
    NSString *requestURL = nil;
    
    if (type == STRATEGE_TYPE_NETWORK)
    {
        commonParams = [self commonParamsForNetwork];
        requestURL = MTA_QUERY_NETWORK_STRATEGY_URL;
    }
    else
    {
        commonParams = [self commonParamsForPerformancePV];
        [commonParams setObject:MTA_PERFORMANCE_METHOD_REQ forKey:@"method"];
        requestURL = MTA_PERFORMANCE_REQ_URL;
    }
   
    NSString *commonString = [commonParams stringFromJson];
    NSLog(@"common params: %@", commonString);

    __block __typeof__(self) weakSelf = self;
    
    [self requestURL:requestURL
        withPostBody:[commonString dataUsingEncoding:NSUTF8StringEncoding]
   completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
       if (connectionError) {
           NSLog(@"querying strategy failed: %@", connectionError.description);
           return;
       }
       
       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
           NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
           if ([res statusCode] != 200) {
               NSLog(@"querying strategy failed with status %ld", (long)[res statusCode]);
               return;
           }
       }
    
       NSString *strategyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       NSLog(@"get strategy from server: %@", strategyString);
        if (type == STRATEGE_TYPE_NETWORK)
        {
            [weakSelf updateStrategy:weakSelf.networkAbnormalStrategy withString:strategyString];
        }
        else
        {
            [weakSelf updateStrategy:weakSelf.performancePVStrategy withString:strategyString];
        }
       [strategyString release];

   }];
}

#pragma mark - api for app

// 上报网络异常数据
+ (void)recordNetworkAbnormalData:(NSDictionary *)data
{
    NSMutableDictionary *mutableData = [data mutableCopy];
    
    for (id key in [mutableData allKeys])
    {
        mutableData[key] = [[JDMTA sharedMTA] wrapString:mutableData[key]];
    }

    
    [[JDMTA sharedMTA] insertNetworkAbnormalWithData:mutableData];
    
    [mutableData release];
}

// 上报PV/Performance/Click数据  注意传入参数的key/value均为字符串格式
+ (void)recordWithType:(JDMTA_TYPE)type data:(NSDictionary *)data
{
    NSMutableDictionary *mutableData = [data mutableCopy];
    
    for (id key in [mutableData allKeys])
    {
        mutableData[key] = [[JDMTA sharedMTA] wrapString:mutableData[key]];
    }

    switch (type)
    {
        case JDMTA_TYPE_PV:
            [[JDMTA sharedMTA] insertPerformancePVWithData:mutableData type:[NSString stringWithFormat:@"%d", type]];
            break;
        case JDMTA_TYPE_CLICK:
            [[JDMTA sharedMTA] insertPerformancePVWithData:mutableData type:[NSString stringWithFormat:@"%d", type]];
            break;
        case JDMTA_TYPE_PERFORMANCE:
            [[JDMTA sharedMTA] insertPerformancePVWithData:mutableData type:[NSString stringWithFormat:@"%d", type]];
            break;
        default:
            NSLog(@"recordWithType:%d data:%@ type error", type, data);
            break;
    }
    
    [mutableData release];
}

+ (void)start
{
    // APP启动时查询数据发送策略
    [[JDMTA sharedMTA] queryStrategyByType:STRATEGE_TYPE_NETWORK];
    [[JDMTA sharedMTA] queryStrategyByType:STRATEGE_TYPE_PERFORMANCE];
    NSLog(@"MTA started");
}

#pragma mark - check if requring sending data


// 根据id删除网络异常数据
- (void)removeSentDataByIDs:(NSArray *)dataIDs fromTable:(NSString *)tableName
{
    __block __typeof__(self) weakSelf = self;

    [self.databaseQueue inDatabase:^(FMDatabase *db)
    {
        NSMutableString *dataIDStr = [[NSMutableString alloc] init];
        for (NSString *dataID in dataIDs)
        {
            [dataIDStr appendString:[NSString stringWithFormat:@"%@,", dataID]];
        }
        
        if ([dataIDStr length]) {
            // remove the last ,
            [dataIDStr deleteCharactersInRange:NSMakeRange([dataIDStr length]-1, 1)];
            BOOL success =  [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@ where id in (%@)", tableName, dataIDStr]];
            
            if (success) {
                NSLog(@"Remove data %@ success from DB", dataIDStr);
                
                // 删除完成后，检查是否还有需要发送的数据
                [self.operateQueue addOperationWithBlock:^{
                    [weakSelf checkAndSendData];
                }];
            }
            else
            {
                NSLog(@"Remove data %@ failed from DB", dataIDStr);
            }
        }
        
        [dataIDStr release];
    }];
}

// 存储一条网络异常数据
- (void)insertNetworkAbnormalWithData:(NSDictionary *)data
{
    if (!data || ![data allKeys])
    {
        return;
    }
    
    __block __typeof__(self) weakSelf = self;

    [self.databaseQueue inDatabase:^(FMDatabase *db)
    {
        
        // 查询数据条数是否超过说上限，如果大于最大条数，则先删除最老的一条数据
        NSUInteger count = [db intForQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", NETWORK_TABLE_NAME]];
        if (count > MTA_DATABASE_LIMIT)
        {
            BOOL deleteSuccess = [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where id in (select id from %@ limit 1)", NETWORK_TABLE_NAME, NETWORK_TABLE_NAME]];
            if (!deleteSuccess)
            {
                NSLog(@"delete old network abnormal data failed");
            }
        }

        
        BOOL success =  [db executeUpdate:[NSString stringWithFormat:
                                           @"insert into '%@' ('%@', '%@') values (?, ?)",
                                           NETWORK_TABLE_NAME,
                                           NETWORK_COL_TIME,
                                           NETWORK_COL_DATA],
                                           [NSNumber numberWithLong:(long)[[NSDate date] timeIntervalSince1970]],
                                           [data stringFromJson]];
        if (success) {
            NSLog(@"insert network abnormal data success");
            if (weakSelf.networkAbnormalStrategy.sendImmediately)
            {
                [self.operateQueue addOperationWithBlock:^{
                    [weakSelf queryAndSendNetworkAbnormalData];
                }];
            }
            else
            {
                [self.operateQueue addOperationWithBlock:^{
                    [weakSelf checkAndSendData];
                }];
            }
        }
        else
        {
            NSLog(@"insert network abnormal data failed for %@", data);
        }
    }];
}

- (void)insertPerformancePVWithData:(NSDictionary *)data type:(NSString *)type
{
    if (!data || ![type length] || ![data allKeys])
    {
        return;
    }
    
    __block __typeof__(self) weakSelf = self;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db)
     {
         // 查询数据条数是否超过说上限，如果大于最大条数，则先删除最老的一条数据
         NSUInteger count = [db intForQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", PERFORMANCEPV_TABLE_NAME]];
         if (count > MTA_DATABASE_LIMIT)
         {
             BOOL deleteSuccess = [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where id in (select id from %@ limit 1)",                 PERFORMANCEPV_TABLE_NAME, PERFORMANCEPV_TABLE_NAME]];
             if (!deleteSuccess)
             {
                 NSLog(@"delete old performancepv data failed");
             }
         }
         
         /*
          "type" varchar(8) not null,
          "net_type" varchar(8) null,
          "occurTime" integer not null,
          "data" text NULL
          */
         
         BOOL success =  [db executeUpdate:[NSString stringWithFormat:
                                            @"insert into '%@' ('%@', '%@', '%@') values (?, ?, ?)",
                                            PERFORMANCEPV_TABLE_NAME,
                                            PERFORMANCEPV_COL_TYPE,
                                            PERFORMANCEPV_COL_TIME,
                                            NETWORK_COL_DATA],
                          type,
                          [NSNumber numberWithLong:(long)[[NSDate date] timeIntervalSince1970]],
                          [data stringFromJson]];
         if (success) {
             NSLog(@"insert performancepv data success");
             if (weakSelf.performancePVStrategy.sendImmediately)
             {
                 [self.operateQueue addOperationWithBlock:^{
                     [weakSelf queryAndSendPerformancePVData];
                 }];
             }
             else
             {
                 [self.operateQueue addOperationWithBlock:^{
                     [weakSelf checkAndSendData];
                 }];
             }
         }
         else
         {
             NSLog(@"insert performancepv data failed for %@", data);
         }
     }];
}

/**
 *  从数据库中查询数据并发送给服务器
 */
- (void)queryAndSendNetworkAbnormalData
{
    __block __typeof__(self) weakSelf = self;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ limit %d",
                                            NETWORK_TABLE_NAME,
                                            NETWORK_PAGE_LIMIT]];
        NSMutableArray *networkData = [[NSMutableArray alloc] init];
        
        while ([rs next])
        {
            NSMutableDictionary *record = [[NSMutableDictionary alloc] init];
            [record setObject:[rs stringForColumn:NETWORK_COL_ID] forKey:NETWORK_COL_ID];
            [record setObject:[rs stringForColumn:NETWORK_COL_TIME] forKey:NETWORK_COL_TIME];
            
            NSString *recordMessaget = [rs stringForColumn:NETWORK_COL_DATA];
            NSDictionary *recordDict = [NSJSONSerialization JSONObjectWithData:
                                        [recordMessaget dataUsingEncoding:NSUTF8StringEncoding]
                                                                  options:0
                                                                    error:NULL];
            if (recordDict)
            {
                for (NSString *key in [recordDict allKeys])
                {
                    if (recordDict[key])
                    {
                        [record setObject:recordDict[key] forKey:key];
                    }
                }
            }

            [networkData addObject:record];
            [record release];
        }
        
        if ([networkData count]) {
            [self.operateQueue addOperationWithBlock:^{
                [weakSelf sendNetworkAbnormalData:networkData];
            }];
        }
        
        [networkData release];
    }];
}

/**
 *  从数据库中查询数据并发送给服务器
 */
- (void)queryAndSendPerformancePVData
{
    __block __typeof__(self) weakSelf = self;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db)
    {
        FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ limit %d",
                                            PERFORMANCEPV_TABLE_NAME,
                                            PERFORMANCEPV_PAGE_LIMIT]];
        NSMutableArray *networkData = [[NSMutableArray alloc] init];
        
        while ([rs next])
        {
            NSMutableDictionary *record = [[NSMutableDictionary alloc] init];
            [record setObject:[rs stringForColumn:PERFROMANCEPV_COL_ID] forKey:PERFROMANCEPV_COL_ID];
            [record setObject:[rs stringForColumn:PERFORMANCEPV_COL_TYPE] forKey:PERFORMANCEPV_COL_TYPE];
            
            NSString *recordMessage = [rs stringForColumn:PERFORMANCEPV_COL_DATA];
            NSDictionary *recordDict = [NSJSONSerialization JSONObjectWithData:
                                        [recordMessage dataUsingEncoding:NSUTF8StringEncoding]
                                                                       options:0
                                                                         error:NULL];
            if (recordDict)
            {
                for (NSString *key in [recordDict allKeys])
                {
                    if (recordDict[key])
                    {
                        [record setObject:recordDict[key] forKey:key];
                    }
                }
            }
            
            [networkData addObject:record];
            [record release];
        }
        
        if ([networkData count]) {
            [self.operateQueue addOperationWithBlock:^{
                [weakSelf sendPerformancePVData:networkData];
            }];
        }
        
        [networkData release];
    }];
}

/**
 *  检查是否满足发送策略条件，若满足策略条件则查询并发送数据
 */
- (void)checkAndSendData
{
    __block __typeof__(self) weakSelf = self;
    NSString *currentNetwork = [MTAUtils getNetWorkType];
    
    // 网络异常数据处理
    [self.databaseQueue inDatabase:^(FMDatabase *db)
     {
         if (weakSelf.networkAbnormalStrategy.isSendEnabled)
         {
             // 判断数据条数是否满足发送条件
             NSUInteger count = [db intForQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", NETWORK_TABLE_NAME]];
             
             if ( ([currentNetwork isEqualToString:@"WIFI"] && count > weakSelf.networkAbnormalStrategy.sendMinLinesWifi) ||
                 ([currentNetwork isEqualToString:@"3G"] && count > weakSelf.networkAbnormalStrategy.sendMinLines3G) ||
                 ([currentNetwork isEqualToString:@"2G"] && count > weakSelf.networkAbnormalStrategy.sendMinLines2G) )
             {
                 [weakSelf.operateQueue addOperationWithBlock:^{
                     [weakSelf queryAndSendNetworkAbnormalData];
                 }];
             }
             else // 判断数据是否超过时间间隔
             {
                 FMResultSet * rs = [db executeQuery:[NSString stringWithFormat:@"select %@ from %@ limit 1",
                                                      NETWORK_COL_TIME,
                                                      NETWORK_TABLE_NAME]];
                 while ([rs next]) {
                     double lastDataCreatedAt = [rs doubleForColumn:NETWORK_COL_TIME];
                     double now = [[NSDate date] timeIntervalSince1970];
                     if ( ([currentNetwork isEqualToString:@"WIFI"] &&
                                (now - lastDataCreatedAt > weakSelf.networkAbnormalStrategy.sendMinIntervalWifi) ) ||
                         ([currentNetwork isEqualToString:@"3G"] &&
                                (now - lastDataCreatedAt > weakSelf.networkAbnormalStrategy.sendMinInterval3G) ) ||
                         ([currentNetwork isEqualToString:@"2G"] &&
                                (now - lastDataCreatedAt > weakSelf.networkAbnormalStrategy.sendMinInterval2G)) )
                     {
                         [weakSelf.operateQueue addOperationWithBlock:^{
                             [weakSelf queryAndSendNetworkAbnormalData];
                         }];
                         break;
                    }
                 }
             }
         }
     }];
    
    // 性能数据处理
    [self.databaseQueue inDatabase:^(FMDatabase *db)
     {
         if (weakSelf.performancePVStrategy.isSendEnabled)
         {
             // 判断数据条数是否满足发送条件
             NSUInteger count = [db intForQuery:[NSString stringWithFormat:@"SELECT COUNT(*) FROM %@",
                                                    PERFORMANCEPV_TABLE_NAME]];
             
             if ( ([currentNetwork isEqualToString:@"WIFI"] && count > weakSelf.performancePVStrategy.sendMinLinesWifi) ||
                 ([currentNetwork isEqualToString:@"3G"] && count > weakSelf.performancePVStrategy.sendMinLines3G) ||
                 ([currentNetwork isEqualToString:@"2G"] && count > weakSelf.performancePVStrategy.sendMinLines2G) )
             {
                 [weakSelf.operateQueue addOperationWithBlock:^{
                     [weakSelf queryAndSendPerformancePVData];
                 }];
             }
             else // 判断数据是否超过时间间隔
             {
                 FMResultSet * rs = [db executeQuery:[NSString stringWithFormat:@"select %@ from %@ limit 1",
                                                      PERFORMANCEPV_COL_TIME,
                                                      PERFORMANCEPV_TABLE_NAME]];
                 while ([rs next]) {
                     double lastDataCreatedAt = [rs doubleForColumn:PERFORMANCEPV_COL_TIME];
                     double now = [[NSDate date] timeIntervalSince1970];
                     if ( ([currentNetwork isEqualToString:@"WIFI"] &&
                           (now - lastDataCreatedAt > weakSelf.performancePVStrategy.sendMinIntervalWifi) ) ||
                         ([currentNetwork isEqualToString:@"3G"] &&
                          (now - lastDataCreatedAt > weakSelf.performancePVStrategy.sendMinInterval3G) ) ||
                         ([currentNetwork isEqualToString:@"2G"] &&
                          (now - lastDataCreatedAt > weakSelf.performancePVStrategy.sendMinInterval2G)) )
                     {
                         [weakSelf.operateQueue addOperationWithBlock:^{
                             [weakSelf queryAndSendPerformancePVData];
                         }];
                         break;
                     }
                 }
             }
         }
     }];
}

- (void)onDidApplicationBecomeActive
{
    [self checkAndSendData];
}

- (void)onWillApplicationEnterBackground
{
    [self.operateQueue cancelAllOperations];
    [self.networkQueue cancelAllOperations];
}

- (void)onDidApplicationRecvMemoryWarning
{
    [self.operateQueue cancelAllOperations];
    [self.networkQueue cancelAllOperations];
}

@end
