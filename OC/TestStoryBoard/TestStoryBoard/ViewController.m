//
//  ViewController.m
//  TestStoryBoard
//
//  Created by clark on 15/6/3.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)push:(id)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *vc = [story instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:^{
         
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
