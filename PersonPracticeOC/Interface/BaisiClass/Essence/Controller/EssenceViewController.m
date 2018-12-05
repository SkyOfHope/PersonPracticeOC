//
//  EssenceViewController.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "EssenceViewController.h"

@interface EssenceViewController ()

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.tabBar showBadge:@"4" atIndex:0];
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(0, 0, 100, 30);
    clearBtn.center = self.view.center;
    [clearBtn setTitle:@"清除角标" forState:UIControlStateNormal];
    [clearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    clearBtn.backgroundColor = [UIColor grayColor];
    [clearBtn addTarget:self action:@selector(clearBadge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
    
    
    //替换导航栏标题为图片
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"Pagename"];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"Pagename"];
}


- (void)clearBadge {
    [self.tabBarController.tabBar clearBadgeAtIndex:0];
}

-(void)buildWithTableView{
    
    
}




#pragma mark - 点击事件
-(void)tagClick{
    NSLog(@"123456789");
    [MobClick event:@"Forward"];
    
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
