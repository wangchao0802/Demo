//
//  SecondViewController.m
//  TestMessageSend
//
//  Created by WangChao on 4/19/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "SecondViewController.h"
#import "NSWriteObject.h"
//#import "NSWriteObject+Go.h"

@interface SecondViewController ()
{
    NSWriteObject *_object;
    NSWriteObject *_copyObject;

}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _object = [[NSWriteObject alloc] init];
    _copyObject = [_object copy];
    NSLog(@"%@=== %@",_object,_copyObject);
    
    
    [_object test];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
