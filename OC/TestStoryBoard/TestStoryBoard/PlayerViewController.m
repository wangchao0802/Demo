//
//  PlayerViewController.m
//  TestStoryBoard
//
//  Created by clark on 15/6/4.
//  Copyright (c) 2015年 clark. All rights reserved.
//

#import "PlayerViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@implementation PlayerViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"]) {
        UINavigationController *nav = segue.destinationViewController;
        PlayerDetailsViewController *pVC = [nav viewControllers][0];
        pVC.delegate = self;
    }
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.players count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
//        Player *player = (self.players)[indexPath.row];
//        cell.l1.text = player.name;
//        cell.l2.text = player.game;
//        
//        return cell;
//
//}
//

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
