//
//  PlayerViewController.h
//  TestStoryBoard
//
//  Created by clark on 15/6/4.
//  Copyright (c) 2015年 clark. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayerViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;


@end
