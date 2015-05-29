//
//  CTDataManager.h
//  TestFMDB
//
//  Created by WangChao on 6/25/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"



@interface CTDataManager : NSObject
{
    NSString *_name;
}


@property (nonatomic) FMDatabase* database;

+(CTDataManager *)defaultManager;

-(void)close;

@end
