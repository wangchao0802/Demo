//
//  TestIos7Tests.m
//  TestIos7Tests
//
//  Created by WangChao on 8/2/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CTViewController.h"

@interface TestIos7Tests : XCTestCase

@end

@implementation TestIos7Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}







- (void)testExample
{
    
    CTViewController *cv = [[CTViewController alloc]init];
    UITableView *ta = [cv createUI];

    NSString *f1 = NSStringFromCGRect(ta.frame);
    NSString *f2 = NSStringFromCGRect(CGRectMake(0, 0, 320, 400));

    XCTAssertEqualObjects(f1,f2);
    
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
