//
//  DynamicTabBar.h
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/21.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITabBar+Badge.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DynamicTabBarDelegate <NSObject>

/* 选中TabBar */
-(void)selectDynamicTabBaritemAtIndex:(NSInteger)index;

@end


@interface DynamicTabBar : UITabBar

@property (nonatomic, strong) NSMutableArray *itemArr;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *selectImageArr;

@property (nonatomic, weak) id<DynamicTabBarDelegate> dynamicTabBarDelegate;

/** 实例化 */
+(instancetype)TabBarWithFrame:(CGRect)frame TitleArray:(NSArray<NSString *> *)titleArr ImageArray:(NSArray<NSString *> *)imageArr selectImageArray:(NSArray<NSString *> *)selectImageArr;


@end

NS_ASSUME_NONNULL_END
