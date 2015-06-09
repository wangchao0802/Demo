//
//  PlayerDetailsViewController.m
//  TestStoryBoard
//
//  Created by clark on 15/6/5.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "PlayerDetailsViewController.h"

@implementation PlayerDetailsViewController

- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    [self.delegate playerDetailsViewControllerDidSave:self];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}
@end
