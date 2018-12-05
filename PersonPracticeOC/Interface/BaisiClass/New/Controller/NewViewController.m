//
//  NewViewController.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.tabBar showBadge:@"10" BadgeColore:[UIColor grayColor] BadgeBackGroundColor:[UIColor orangeColor] atIndex:1];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:@"Pagename"];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"Pagename"];
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
