//
//  CTModelController.h
//  fuckVC
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTDataViewController;

@interface CTModelController : NSObject <UIPageViewControllerDataSource>

- (CTDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(CTDataViewController *)viewController;

@end
