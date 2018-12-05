//
//  UIBarButtonItem+Extension.h
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)

+(instancetype)barButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;


@end

NS_ASSUME_NONNULL_END
