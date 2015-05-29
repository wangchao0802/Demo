//
//  FirstViewController.m
//  testARC2
//
//  Created by WangChao on 5/3/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   NSString *apara = @"good";
    NSLog(@"%ld",[apara retainCount]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
