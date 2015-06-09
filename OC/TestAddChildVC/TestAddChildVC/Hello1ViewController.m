//
//  Hello1ViewController.m
//  TestAddChildVC
//
//  Created by clark on 6/8/15.
//  Copyright (c) 2015 clark. All rights reserved.
//

#import "Hello1ViewController.h"

@interface Hello1ViewController ()

@end

@implementation Hello1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated
{
    [self beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self endAppearanceTransition];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
