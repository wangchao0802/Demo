//
//  ViewController.m
//  gg
//
//  Created by WangChao on 12/14/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<10000; i++)
    {
        dispatch_async(global, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [arr addObject:[NSNumber numberWithInt:i]];
            dispatch_semaphore_signal(semaphore);
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
