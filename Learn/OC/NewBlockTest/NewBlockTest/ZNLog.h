//
//  ZNLog.h
//  Jdmobile
//
//  Created by Steven Sun on 11/15/10.
//  Copyright 2010 360buy All rights reserved.
//

@interface ZNLog : NSObject {}


+(void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...;

#define ZNLog(s, ...) [ZNLog file:__FILE__ function: (char *)__FUNCTION__ lineNumber:__LINE__ format:(s),##__VA_ARGS__]

@end

