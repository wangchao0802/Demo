//
//  CTViewController.m
//  TestFMDB
//
//  Created by WangChao on 6/25/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTViewController.h"
#import "CTDataManager.h"


@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [CTDataManager defaultManager];
    
    NSLog(@"scc");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
