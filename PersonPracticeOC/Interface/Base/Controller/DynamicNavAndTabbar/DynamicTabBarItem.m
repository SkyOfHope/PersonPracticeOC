//
//  DynamicTabBarItem.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/21.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "DynamicTabBarItem.h"

@implementation DynamicTabBarItem

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

#pragma mark - Private

-(void)setUpUI{
    
    [self addSubview:self.titleLab];
    [self addSubview:self.imageView];
    [self addSubview:self.selectImageView];
    [self addSubview:self.badgeLab];
    
    self.imageView.frame = CGRectMake(0, 0, 21.5, 22);
    self.imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - 5);
    
    self.titleLab.frame = CGRectMake(0, self.bounds.size.height - 12, self.bounds.size.width, 12);
    
    self.selectImageView.frame = CGRectMake(0, 0, 32, 32);
    self.selectImageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    self.badgeLab.center = CGPointMake((CGRectGetMaxX(self.imageView.frame) - 6), (self.imageView.bounds.origin.y) + 5);
    
}

-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (_isSelect) {
        self.selectImageView.hidden = NO;
        [self animationWithSelectedImg];
        self.imageView.hidden = YES;
        self.titleLab.hidden = YES;
    }else{
        self.selectImageView.hidden = YES;
        self.imageView.hidden = NO;
        self.titleLab.hidden = NO;
    }
    
}

/** 动画 **/
-(void)animationWithSelectedImg{
    
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //动画的时长
    pulse.duration = 0.15;
    //重复的次数
    pulse.repeatCount = 1;
    //动画结束时是否执行逆动画
    pulse.autoreverses = YES;
    //所改变属性的起始值
    pulse.fromValue = [NSNumber numberWithFloat:0.8];
    //所改变属性的结束时的值
    pulse.toValue = [NSNumber numberWithFloat:1.2];
    
    //添加动画
    [self.selectImageView.layer addAnimation:pulse forKey:nil];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.badgeLab sizeToFit];
    
    //为了左右两边切圆角留间距
    CGSize size = [@"#" sizeWithAttributes:@{NSFontAttributeName:self.badgeLab.font}];
    float width = self.badgeLab.bounds.size.width + size.width;
    float height = self.badgeLab.bounds.size.height;
    if (width < height) {
        width = height;
    }
    self.badgeLab.layer.cornerRadius = height / 2;
    self.badgeLab.clipsToBounds = YES;
    CGRect frame = self.badgeLab.frame;
    frame.size.width = width;
    frame.size.height = height;
    self.badgeLab.frame = frame;
    
}

-(void)sizeToFit{
    [super sizeToFit];
    
}


#pragma mark - 懒加载
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:10];
        _titleLab.textColor = [UIColor lightGrayColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"首页";
    }
    
    return _titleLab;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
        
    }
    
    return _imageView;
}

-(UIImageView *)selectImageView{
    if (!_selectImageView) {
        _selectImageView = [[UIImageView alloc] init];
        _selectImageView.userInteractionEnabled = YES;
        
    }
    
    return _selectImageView;
}

-(UILabel *)badgeLab{
    if (!_badgeLab) {
        _badgeLab = [[UILabel alloc] init];
        _badgeLab.font = [UIFont systemFontOfSize:12];
        _badgeLab.textColor = [UIColor whiteColor];
        _badgeLab.textAlignment = NSTextAlignmentCenter;
        _badgeLab.hidden = YES;
        _badgeLab.backgroundColor = [UIColor redColor];
        
    }
    
    return _badgeLab;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
