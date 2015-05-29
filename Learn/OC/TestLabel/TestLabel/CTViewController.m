//
//  CTViewController.m
//  TestLabel
//
//  Created by WangChao on 8/1/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import "CTViewController.h"
#import <CoreText/CoreText.h>
#import "CTLabel.h"


@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    CTLabel *label = [[CTLabel alloc] initWithFrame:CGRectMake(20, 20, 100, 40)];
    
//    label.text = @"8";//@"just only a test fuck uaaaaaaagegewgwgwgwgwgagagagewgwg";
//    label.font = [UIFont systemFontOfSize:14.0];
//    label.textColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    
    
    
//    [self createLabel1];
//    [self createLabel2];
//    [self createLabel3];


    NSDictionary *dict = @{@"key1": @"f1"};
    NSLog(@"%@",[dict valueForKey:@"fuck"]);
}
- (IBAction)aa:(id)sender {
}


//定点固定 zidong daxiao
-(void)createLabel1
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED
#endif
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    label.text = @"fuck u ml m";//@"just only a test fuck uaaaaaaagegewgwgwgwgwgagagagewgwg";
    label.font = [UIFont systemFontOfSize:14.0];
//    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    label.textColor = [UIColor yellowColor];
//    label.shadowOffset = CGSizeMake(2, 5);
    [self.view addSubview:label];
    
    label.highlighted = YES;
    label.highlightedTextColor = [UIColor redColor];
}

//定点固定 zidong daxiao
-(void)createLabel2
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,20, 100, 320)];
    label.numberOfLines =0;
    label.text = @"just only a test fuck uaaaaaaagegeauaaaaaaagegeagagagewgwguaaaaaaagegeagagagewgwguaaaaaaagegeagagagewgwguaaaaaaagegeagagagewgwggagagewgwgt only a test ";
    label.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:label];

    [label sizeToFit];
}

//定点固定 zidong daxiao
-(void)createLabel3
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,20, 160, 320)];
    label.numberOfLines =1;
    label.text = @"just only a tes";
    label.font = [UIFont systemFontOfSize:18.0];
    [self.view addSubview:label];
    [label sizeToFit];

    
    CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14], NSStrokeColorAttributeName:[[UIColor greenColor] colorWithAlphaComponent:0.5]}];
    
    
    [@"just only a tesgagaag" drawAtPoint:CGPointMake(30, 20)withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0], NSStrokeColorAttributeName:[[UIColor greenColor] colorWithAlphaComponent:0.5]} ];
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
