//
//  UIBarButtonItem+Extension.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(instancetype)barButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
    button.width = 30;
    button.height = 30;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
