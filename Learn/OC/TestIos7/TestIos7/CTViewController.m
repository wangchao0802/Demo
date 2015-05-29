//
//  CTViewController.m
//  TestIos7
//
//  Created by WangChao on 8/2/14.
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
#if __IPHONE_OS_VERSION_MAX_ALLOWED
#endif
#if  __IPHONE_6_1
    
    
#endif
    
    UITableView *tv = [self createUI];
    
    [self printRect:self.view];
    
    
}



-(void)printRect:(UIView *)view
{
    for (UIView *v  in view.subviews)
    {
        if ([v isKindOfClass:[UILabel class]])
        {
            NSLog(@"UILabel frame  %@ ",NSStringFromCGRect(v.frame));
        }
        
        if ([v isKindOfClass:[UIButton class]])
        {
            NSLog(@"UIButton frame  %@ ",NSStringFromCGRect(v.frame));
        }
        
        if ([v isKindOfClass:[UITextField class]])
        {
            NSLog(@"UITextField frame  %@ ",NSStringFromCGRect(v.frame));
        }

        if ([v isKindOfClass:[UIScrollView class]])
        {
            NSLog(@"UIScrollView frame  %@ ",NSStringFromCGRect(v.frame));
        }
        
        if ([v isKindOfClass:[UIImageView class]])
        {
            NSLog(@"UIImageView frame  %@ ",NSStringFromCGRect(v.frame));
        }

        if ([v isKindOfClass:[UITableView class]])
        {
            NSLog(@"UITableView frame  %@ ",NSStringFromCGRect(v.frame));
        }
        else if ([v isKindOfClass:[UIWebView class]])
        {
            NSLog(@"UIWebView frame  %@ ",NSStringFromCGRect(v.frame));
        }
        else if ([v isKindOfClass:[UITableViewCell class]])
        {
            NSLog(@"UITableViewCell frame  %@ ",NSStringFromCGRect(v.frame));
        }
        
    }
}



-(UITableView* ) createUI
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UITableView*table           = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)
                                                     style:UITableViewStyleGrouped];
    [table setSeparatorInset:UIEdgeInsetsZero];
    //    table.backgroundColor = [UIColor clearColor];
    table.dataSource            = (id<UITableViewDataSource>) self;
    table.delegate              = (id<UITableViewDelegate>)self;

    [self.view addSubview:table];
    return table;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"%",@"B",UITableViewIndexSearch];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cel = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
//    cel.backgroundColor = [UIColor clearColor];
    return cel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
