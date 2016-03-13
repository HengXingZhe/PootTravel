//
//  IdeaModel.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "IdeaModel.h"

@implementation IdeaModel : CommonModel







+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [IdeaData class]};
}
@end





@implementation IdeaData

+ (NSDictionary *)objectClassInArray{
    return @{@"guides" : [IdeaGuides class]};
}

@end


@implementation IdeaGuides

@end


