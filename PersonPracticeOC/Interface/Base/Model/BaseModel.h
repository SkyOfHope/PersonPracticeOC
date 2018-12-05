//
//  BaseModel.h
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic, strong) NSString *ID;

-(id)initWithDictionary:(NSDictionary *)jsonDic;


@end

NS_ASSUME_NONNULL_END
