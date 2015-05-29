//
//  ViewController.m
//  exceptioncontion
//
//  Created by WangChao on 11/7/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testFor];
//    [self testExcep];

}

-(void)testFor
{
    for (int i = 0; i<100; i++) {
    NSLog(@" i%d" ,i);
}
 
}

-(void)testExcep
{
    NSArray *array = [[NSArray alloc] init];
    
    NSObject *i = [array objectAtIndex:0];
    
    NSLog(@"%@", i);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
