//
//  ViewController.m
//  testPods
//
//  Created by WangChao on 2/22/15.
//  Copyright (c) 2015 WangChao. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CFStringRef s1 = (__bridge CFStringRef) [[NSString alloc]
                                    initWithFormat:@"Hello, !%d",12];
    
    CFRelease(s1);
    
    CFStringRef s2 = CFStringCreateWithCString(kCFAllocatorDefault, "gagag",                                               kCFStringEncodingMacRoman);
    NSString *s3 = (__bridge_transfer NSString *)s2;
    NSString *s4 = [[NSString alloc] init];
    CFStringRef ref4 = (__bridge_retained  CFStringRef)s4;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
