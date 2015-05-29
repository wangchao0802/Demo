//
//  MTAGlobal.h
//  MTA
//
//  Created by nipengfei on 14-6-12.
//  Copyright (c) 2014年 360Buy. All rights reserved.
//

#ifndef MTA_global_h
#define MTA_global_h

#define MTA_SDK_VERSION       @"1"
#define MTA_SDK_PRIVATE_KEY   @"5YT%aC89$22OI@pQ"

#define NETWORK_TABLE_NAME    @"networkabnormal"
#define NETWORK_COL_ID        @"id"
#define NETWORK_COL_TIME      @"occurTime"
#define NETWORK_COL_DATA      @"data"
#define NETWORK_PAGE_LIMIT    10         // 每次上报数据条数上限

#define PERFORMANCEPV_TABLE_NAME        @"performancepv"
#define PERFROMANCEPV_COL_ID            @"id"
#define PERFORMANCEPV_COL_TYPE          @"type"
#define PERFORMANCEPV_COL_DATA          @"data"
#define PERFORMANCEPV_COL_TIME          @"occurTime"
#define PERFORMANCEPV_PAGE_LIMIT        10         // 每次上报数据条数上限


#define MTA_DATABASE_LIMIT   1000000       // 数据库最大记录条数
#define MTA_NETWORK_REQUEST_RETRY_TIME 300 // 失败后下次重试时间间隔
#define MTA_DEFAULT_SEND_MIN_INTERVAL 24*3600
#define MTA_DEFAULT_SEND_MIN_LINES 100
#define MTA_DATABASE_FILENAME @".JDMTA.sqlite"

#define MTA_QUERY_NETWORK_STRATEGY_URL  @"http://stat.m.jd.com/exception_monitor/getRule"
#define MTA_SEND_NETWORK_DATA_URL       @"http://stat.m.jd.com/exception_monitor/report"

#define MTA_PERFORMANCE_REQ_URL         @"http://stat.m.jd.com/stat/access"
#define MTA_PERFORMANCE_METHOD_REQ      @"bp.search"
#define MTA_PERFORMANCE_METHOD_SEND     @"bp.report"

#endif
