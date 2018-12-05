//
//  DynamicTabBar.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/21.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "DynamicTabBar.h"

#import "DynamicTabBarItem.h"

@implementation DynamicTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}

//删除系统tabbar的UITabbarButton
-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

+(instancetype)TabBarWithFrame:(CGRect)frame TitleArray:(NSArray<NSString *> *)titleArr ImageArray:(NSArray<NSString *> *)imageArr selectImageArray:(NSArray<NSString *> *)selectImageArr{
    DynamicTabBar *tabBar = [[DynamicTabBar alloc] initWithFrame:frame];
    
    tabBar.titleArr = titleArr;
    tabBar.imageArr = imageArr;
    tabBar.selectImageArr = selectImageArr;
    
    [tabBar setUpUI];
    return tabBar;
}

-(void)setUpUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < self.titleArr.count; i++) {
        DynamicTabBarItem *item = [[DynamicTabBarItem alloc] initWithFrame:CGRectMake(i * (ScreenWidth / self.titleArr.count), 0, (ScreenWidth / self.titleArr.count), 49)];
        item.imageView.image = [UIImage imageNamed:self.imageArr[i]];
        item.selectImageView.image = [UIImage imageNamed:self.selectImageArr[i]];
        item.titleLab.text = self.titleArr[i];
        item.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemAction:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        [self.itemArr addObject:item];
    }
    
    self.selectedIndex = 0;
    
}

-(void)itemAction:(UIGestureRecognizer *)sender{
    self.selectedIndex = sender.view.tag;
    if ([self.dynamicTabBarDelegate respondsToSelector:@selector(selectDynamicTabBaritemAtIndex:)]) {
        [self.dynamicTabBarDelegate selectDynamicTabBaritemAtIndex:sender.view.tag];
    }
    
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    [self.itemArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DynamicTabBarItem *item = (DynamicTabBarItem *)obj;
        if (idx == selectedIndex) {
            item.isSelect = YES;
        }else{
            item.isSelect = NO;
        }
    }];
}

//设置角标
-(void)showBadge:(NSString *)badge atIndex:(NSInteger)index{
    [super showBadge:badge atIndex:index];
    
    if (index >= self.itemArr.count) {
        return;
    }
    
    DynamicTabBarItem *item = self.itemArr[index];
    //设置 角标为0,自动隐藏
    if ([badge integerValue] == 0) {
        item.badgeLab.hidden = YES;
    }else{
        item.badgeLab.hidden = NO;
        item.badgeLab.text = badge;
    }
    [item setNeedsLayout];
    [item layoutIfNeeded];
}

//自定义角标颜色和背景颜色
-(void)showBadge:(NSString *)badge BadgeColore:(UIColor *)badegeColore BadgeBackGroundColor:(UIColor *)backgroundColor atIndex:(NSInteger)index{
    [super showBadge:badge BadgeColore:badegeColore BadgeBackGroundColor:backgroundColor atIndex:index];
    
    if (index >= self.itemArr.count) {
        return;
    }
    
    DynamicTabBarItem *item = self.itemArr[index];
    
    //角标为0,自动隐藏
    if ([badge integerValue] == 0) {
        item.badgeLab.hidden = YES;
    }else{
        item.badgeLab.hidden = NO;
        item.badgeLab.text = badge;
        item.badgeLab.textColor = badegeColore;
        item.badgeLab.backgroundColor = backgroundColor;
    }
    
    [item setNeedsLayout];
    [item layoutIfNeeded];
    
}

//清除角标
-(void)clearBadgeAtIndex:(NSInteger)index{
    [super clearBadgeAtIndex:index];
    
    if (index >= self.itemArr.count) {
        return;
    }
    
    DynamicTabBarItem *item = self.itemArr[index];
    item.badgeLab.text = nil;
    item.badgeLab.hidden = YES;
    
}



#pragma mark - 懒加载
-(NSMutableArray *)itemArr{
    if (!_itemArr) {
        _itemArr = [NSMutableArray array];
    }
    
    return _itemArr;
}

-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = [NSArray array];
    }
    
    return _titleArr;
}

-(NSArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [NSArray array];
    }
    
    return _imageArr;
}

-(NSArray *)selectImageArr{
    if (!_selectImageArr) {
        _selectImageArr = [NSArray array];
    }
    
    return _selectImageArr;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
