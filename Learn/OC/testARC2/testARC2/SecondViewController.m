//
//  SecondViewController.m
//  testARC2
//
//  Created by WangChao on 5/3/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong) NSString * fuck;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.fuck = [@"hha" copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
