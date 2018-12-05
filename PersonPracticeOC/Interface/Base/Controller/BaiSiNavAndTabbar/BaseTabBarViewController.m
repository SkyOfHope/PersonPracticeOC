//
//  BaseTabBarViewController.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "BaseTabBarViewController.h"

#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendTrendsViewController.h"
#import "MeViewController.h"

#import "BaseNavigtionViewController.h"


@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

// 第一次使用这个类的时候调用
-(void)initialize{
    //设置tabbarItem的主题
    UITabBarItem *tabbarItem = [UITabBarItem appearance];
    
    NSMutableDictionary *norAttributes = [NSMutableDictionary dictionary];
    //颜色
    norAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    //字体
    norAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabbarItem setTitleTextAttributes:norAttributes forState:UIControlStateNormal];
    
    
    NSMutableDictionary *selAttributes = [NSMutableDictionary dictionaryWithDictionary:norAttributes];
    //颜色
    selAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [tabbarItem setTitleTextAttributes:selAttributes forState:UIControlStateSelected];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加子控制器
    EssenceViewController *essenceVC = [[EssenceViewController alloc] init];
    [self addChildViewController:essenceVC Title:@"精华" Image:@"tabBar_essence_icon" selImage:@"tabBar_essence_click_icon"];
    
    NewViewController *newVC = [[NewViewController alloc] init];
    [self addChildViewController:newVC Title:@"新帖" Image:@"tabBar_new_icon" selImage:@"tabBar_new_click_icon"];
    
    FriendTrendsViewController *friendTrendsVC = [[FriendTrendsViewController alloc] init];
    [self addChildViewController:friendTrendsVC Title:@"关注" Image:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon"];
    
    MeViewController *meVC = [[MeViewController alloc] init];
    [self addChildViewController:meVC Title:@"我的" Image:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon"];
    
}

//添加子控制器
-(void)addChildViewController:(UIViewController *)childController Title:(NSString *)title Image:(NSString *)imgName selImage:(NSString *)selImgName{
    
    childController.view.backgroundColor = [UIColor yellowColor];
    
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:imgName];
    
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selImgName];
    
    BaseNavigtionViewController *nav = [[BaseNavigtionViewController alloc] initWithRootViewController:childController];
    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
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
