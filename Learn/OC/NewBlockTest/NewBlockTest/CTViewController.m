//
//  CTViewController.m
//  NewBlockTest
//
//  Created by WangChao on 6/24/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTViewController.h"

@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSLog(@"First Log");
        
    });
    
    NSLog(@"Second Log");

/*
   __block NSInteger outVar = 10;
    void (^bolck)(void) = ^(void)
    {
        NSLog(@" out %d",outVar);
    };
    
    outVar = 20;

    
    bolck();
  */


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
