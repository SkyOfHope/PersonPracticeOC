//
//  BaseNavigtionViewController.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "BaseNavigtionViewController.h"

@interface BaseNavigtionViewController ()

@end

@implementation BaseNavigtionViewController

-(void)initialize{
    
    //设置导航条的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [navBar setTitleTextAttributes:attributes];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/* 重写push */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(70, 30);
        
        //设置按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //设置按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        //修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)back{
    [self popViewControllerAnimated:YES];
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
