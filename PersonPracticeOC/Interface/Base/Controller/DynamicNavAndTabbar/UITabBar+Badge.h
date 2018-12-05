//
//  UITabBar+Badge.h
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/21.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (Badge)

/**
 设置角标
 
 @param badge 角标值
 @param index tabbar的位置
 */
-(void)showBadge:(NSString *)badge atIndex:(NSInteger)index;

/**
 自定义角标背景,字体颜色
 
 @param badge 角标值
 @param badegeColore 角标字体颜色
 @param backgroundColor 角标背景颜色
 @param index tabbar位置
 */
-(void)showBadge:(NSString *)badge BadgeColore:(UIColor *)badegeColore BadgeBackGroundColor:(UIColor *)backgroundColor atIndex:(NSInteger)index;


/**
 清除角标
 
 @param index tabbar位置
 */
-(void)clearBadgeAtIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
