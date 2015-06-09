//
//  ViewController.m
//  TestMJExtension
//
//  Created by clark on 15/5/29.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "JDFirstLevelObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSHTTPCookie *pin_cookie = [NSHTTPCookie cookieWithProperties:pin_dic];
//    NSHTTPCookie *wskey_cookie = [NSHTTPCookie cookieWithProperties:wskey_dic];
//    NSArray *arr_cookies = [NSArray arrayWithObjects:pin_cookie,wskey_cookie, nil];
//    NSDictionary *dic_cookies = [NSHTTPCookie requestHeaderFieldsWithCookies:arr_cookies];
//    [request setValue:[dic_cookies objectForKey:@"Cookie"] forHTTPHeaderField:@"Cookie"];
//    
//    NSURLResponse *respone = nil;
//    NSMutableDictionary *delivery_dic = nil;
//    NSError *err = nil;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&respone error:&err];
//
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://portal.m.jd.com/client.action?functionId=welcomeHome"]
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                           timeoutInterval:60];
   
        [request setHTTPMethod:@"post"];
        NSString * str = @"d_model=x86_64&networkType=wifi&adid=F2253919-DDF0-44A6-B8F2-6851E3E10490&st=1433216198244&body=%7B%22geo%22%3A%7B%22lng%22%3A%220.000000%22%2C%22lat%22%3A%220.000000%22%7D%2C%22identity%22%3A%22663145d0628561cef1ae021b3830369072db87b9%22%7D&osVersion=8.1&d_brand=apple&client=apple&screen=640%2A1136&sv=1&build=21906&sign=bi6gUUAWLpt30HM8WqaNdA&uuid=ovw3G5wmwK64fxk5JEjeMg%3D%3D&clientVersion=4.2.1&openudid=663145d0628561cef1ae021b3830369072db87b9&partner=apple";
        
        [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
        NSURLResponse *respon= nil;
        NSData *data =  [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&respon
                                                          error:nil];
        NSString * str2 = [[NSString  alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str2);
        
        [JDFirstLevelObject setupObjectClassInArray:^NSDictionary *{
            return @{@"floorList":@"JDSecondLevelObject"};
        }];
        
        JDFirstLevelObject *obj = [JDFirstLevelObject objectWithKeyValues:str2];
        NSLog(@"%@",obj);

        
        
        
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
