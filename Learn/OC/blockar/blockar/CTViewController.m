//
//  CTViewController.m
//  blockar
//
//  Created by WangChao on 10/7/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTViewController.h"

@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self ts];
}

-(void)ts2
{
    ^(void) { printf("hello");};
    
    
}

-(void)ts
{
    __block int val = 0;
    
    void (^bb)(void) = [^{++val;} copy];
    ++val;
    bb();
    NSLog(@"int val %d",val);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
