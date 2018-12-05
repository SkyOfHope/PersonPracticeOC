

//
//  DynamicTabBarViewController.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/29.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "DynamicTabBarViewController.h"

#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendTrendsViewController.h"
#import "MeViewController.h"

#import "DynamicTabBar.h"

@interface DynamicTabBarViewController ()<DynamicTabBarDelegate>

@property (nonatomic, strong)EssenceViewController *essenceVC;
@property (nonatomic, strong)NewViewController *newsVC;
@property (nonatomic, strong)FriendTrendsViewController *friendVC;
@property (nonatomic, strong)MeViewController *meVC;

@property (nonatomic, strong)DynamicTabBar *dynamicTabBar;

@property (nonatomic, strong)NSMutableArray *viewControllerCountArr;

@end

@implementation DynamicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatChildVC];
    
    [self.tabBar showBadge:@"99" BadgeColore:[UIColor redColor] BadgeBackGroundColor:[UIColor greenColor] atIndex:2];
}


#pragma mark - Private
-(void)creatChildVC{
    self.essenceVC = [[EssenceViewController alloc] init];
    self.newsVC = [[NewViewController alloc] init];
    self.friendVC = [[FriendTrendsViewController alloc] init];
    self.meVC = [[MeViewController alloc] init];
    
    [self creatTabBarWithChildVCArr:@[self.essenceVC,self.newsVC,self.friendVC,self.meVC] TitleArr:@[@"首页",@"新帖",@"关注",@"我的"] ImgArr:@[@"home-normal",@"near-normal",@"fenlei-normal",@"shopping-normal"] SelectImageArr:@[@"home-Selected",@"near-selected",@"fenlei-Selected",@"shopping-selected"]];
}

//添加子模块
-(void)creatTabBarWithChildVCArr:(NSArray <UIViewController *> *)childVCArr TitleArr:(NSArray <NSString *> *)titleArr ImgArr:(NSArray <NSString *> *)imageArr SelectImageArr:(NSArray <NSString*> *)selImageArr{
    
    for (UIViewController *viewController in childVCArr) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        [self.viewControllerCountArr addObject:nav];
    }
    
    self.dynamicTabBar = [DynamicTabBar TabBarWithFrame:self.tabBar.bounds TitleArray:titleArr ImageArray:imageArr selectImageArray:selImageArr];
    self.dynamicTabBar.dynamicTabBarDelegate = self;
    
    [self setValue:self.dynamicTabBar forKeyPath:@"tabBar"];
    
    self.viewControllers = self.viewControllerCountArr;
    
    self.selectedIndex = 0;
    
}


//重写selectedIndex的set方法
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    self.dynamicTabBar.selectedIndex = selectedIndex;
}


#pragma mark - PrivateDelegate
-(void)selectDynamicTabBaritemAtIndex:(NSInteger)index{
    self.selectedIndex = index;
    
}



#pragma mark - 懒加载
-(NSMutableArray *)viewControllerCountArr{
    if (!_viewControllerCountArr) {
        _viewControllerCountArr = [[NSMutableArray alloc] init];
        
    }
    
    return _viewControllerCountArr;
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
