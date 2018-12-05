//
//  BaseModel.m
//  PersonPracticeOC
//
//  Created by jiangkuiquan on 2018/11/20.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(id)initWithDictionary:(NSDictionary *)jsonDic{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:jsonDic];
    }
    
    return self;
}


-(void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = [NSString stringWithFormat:@"%@",value];
    }else{
        [super setValue:value forKey:key];
    }
}


@end
