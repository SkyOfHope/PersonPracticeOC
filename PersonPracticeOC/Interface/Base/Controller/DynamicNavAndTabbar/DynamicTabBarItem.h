//
//  DynamicTabBarItem.h
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/21.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicTabBarItem : UIView

/* 标题 */
@property (nonatomic, strong) UILabel *titleLab;

/* 图片 */
@property (nonatomic, strong) UIImageView *imageView;

/* 选中的图片 */
@property (nonatomic, strong) UIImageView *selectImageView;

/* 角标 */
@property (nonatomic, strong) UILabel *badgeLab;

@property (nonatomic, assign) BOOL isSelect;


@end

NS_ASSUME_NONNULL_END
