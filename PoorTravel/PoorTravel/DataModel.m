//
//  DataModel.m
//  PoorTravel
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
+ (JSONKeyMapper *)keyMapper {
    JSONKeyMapper * keyMapper=[[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"theDescription"}];
    return keyMapper;
}
@end
