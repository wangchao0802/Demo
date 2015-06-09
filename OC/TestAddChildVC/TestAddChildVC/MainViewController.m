//
//  MainViewController.m
//  TestAddChildVC
//
//  Created by clark on 6/8/15.
//  Copyright (c) 2015 clark. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property( nonatomic, strong) UIViewController *v1;
@property( nonatomic, strong) UIViewController *v2;
@property( nonatomic, assign) UIViewController *current;

@property( nonatomic, assign) BOOL isTrans;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *v1 = [board instantiateViewControllerWithIdentifier:@"hello1"];
    v1.view.frame = CGRectMake(0, 40, 320, 500);
    self.v1 =v1;
    UIViewController *v2 = [board instantiateViewControllerWithIdentifier:@"hello2"];
    v2.view.frame = CGRectMake(0, 20, 320, 600);
    self.v2 = v2;
    [self addChildViewController:v1];
    [self.view addSubview:v1.view];
    [v1 didMoveToParentViewController:self];
    self.current = v1;
}



-(void) viewWillAppear:(BOOL)animated
{
    [self.current beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.current endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.current beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.current endAppearanceTransition];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bu1:(id)sender
{
    [self changeVCFrom:self.v2 toViewController:self.v1];

}

- (IBAction)b2:(id)sender
{
    [self changeVCFrom:self.v1 toViewController:self.v2];
}
- (IBAction)ssss:(id)sender
{
//    if ((self.currentVC == self.firstVC && button.tag == 100)||(self.currentVC == self.secondVC && button.tag == 101.)) {
//        return;
    
    UISegmentedControl *s = (UISegmentedControl *)sender;
    if (s.selectedSegmentIndex == 0)
    {
        [self changeVCFrom:self.v2 toViewController:self.v1];
    }
    else
    {
        [self changeVCFrom:self.v1 toViewController:self.v2];
    }
}


-(void)changeVCFrom:(UIViewController *)oldVC toViewController:(UIViewController *)newVC
{
    if (self.isTrans) {
        return;
    }
    self.isTrans = YES;
    
    [self addChildViewController:newVC];
    [self transitionFromViewController:oldVC toViewController:newVC duration:.0 options:UIViewAnimationOptionTransitionNone
        animations:^{
            
            
    } completion:^(BOOL finished) {
        if(finished)
        {
            [newVC didMoveToParentViewController:self];
            [oldVC willMoveToParentViewController:nil];
            [oldVC removeFromParentViewController];
            self.current = newVC;
        }
        else
        {
            self.current = oldVC;
        }
        self.isTrans = NO;
    }];
}


////  切换各个标签内容
//- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
//{
//    /**
//     *			着重介绍一下它
//     *  transitionFromViewController:toViewController:duration:options:animations:completion:
//     *  fromViewController	  当前显示在父视图控制器中的子视图控制器
//     *  toViewController		将要显示的姿势图控制器
//     *  duration				动画时间(这个属性,old friend 了 O(∩_∩)O)
//     *  options				 动画效果(渐变,从下往上等等,具体查看API)
//     *  animations			  转换过程中得动画
//     *  completion			  转换完成
//     */
//    
//    [self addChildViewController:newController];
//    [self transitionFromViewController:oldController toViewController:newController duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
//        
//        if (finished) {
//            
//            [newController didMoveToParentViewController:self];
//            [oldController willMoveToParentViewController:nil];
//            [oldController removeFromParentViewController];
//            self.currentVC = newController;
//            
//        }else{
//            
//            self.currentVC = oldController;
//            
//        }
//    }];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
