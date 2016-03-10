//
//  HomePageScrollerModel.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HomePageScrollerModel.h"

@implementation HomePageScrollerModel

@end
@implementation Data

+ (NSDictionary *)objectClassInArray{
    return @{@"discount" : [Discount class], @"subject" : [Subject class], @"discount_subject" : [Discount_Subject class], @"slide" : [Slide class]};
}

@end


@implementation Checkin

@end


@implementation Seckilling

+ (BOOL)propertyIsIgnored:(NSString *)propertyName {
    return YES;
}

@end


@implementation Seckill_Object

@end


@implementation Discount

@end


@implementation Subject

@end


@implementation Discount_Subject

@end


@implementation Slide

@end


