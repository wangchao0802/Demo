//
//  CTDataManager.m
//  TestFMDB
//
//  Created by WangChao on 6/25/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTDataManager.h"
#import "FMDatabaseQueue.h"


@implementation CTDataManager


static CTDataManager *_sharedDBMangager;

+(CTDataManager *)defaultManager
{

   static dispatch_once_t once;
    dispatch_once(&once, ^{
    
        if (!_sharedDBMangager) {
            _sharedDBMangager = [[CTDataManager alloc] init];
        }
        
    });
    
    return _sharedDBMangager;
}


-(id)init
{
    self = [super init];
    
    if (self) {
        int state = [self initDB:@"gogo.sqlite"];
        if (state == -1) {
            NSLog(@"shit ! not create db");
        }
    }
    
    return self;
    
}

-(int) initDB:(NSString *)name
{
    if (!name) {
        return -1;
    }
    NSString *docp = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _name = [docp stringByAppendingPathComponent:name];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL exist = [fm fileExistsAtPath:_name];
    
    [self connect];
    if (!exist) {
        return 0;
    }
    return 1;
    
}


-(void)connect
{
    if (!_database)
    {
        _database = [[FMDatabase alloc] initWithPath:_name];
//        FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:aPath];

    }
    
    if (![_database open]) {
        NSLog(@"cannot open db");
    }
    
}


-(void)close
{
    [_database close];
    _sharedDBMangager = nil;
}



























@end
