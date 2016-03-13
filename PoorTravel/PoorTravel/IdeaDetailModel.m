//
//  IdeaDetailModel.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "IdeaDetailModel.h"

@implementation IdeaDetailModel

//- (void)crea {
//
//    NSString *Page = NSString stringWithFormat:@"%ld";
//    
//    NSDictionary *IdeaDetail = @{@"cliend_id":@"qyer_ios",@"client":@"cd254439208ab658ddf9",@"count":@20,@"id":288,@"lat":@34.77416518102751,@"lon":@113.6696762321501,@"page":Page,@"track_app_channel",@"App%20Store",@"track_app_version",@"6.8.5",@"track_device_info":@"iPhone%204S",@"track_device":@"0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180",@"track_os":@"ios%208.0.2",@"v",@1};
//
//}

@end
@implementation IdeaDeatilData

+ (NSDictionary *)objectClassInArray{
    return @{@"authors" : [IdeaDetailAuthors class], @"related_guides" : [IdeaDetailRelated_Guides class]};
}

@end


@implementation IdeaDetailMobile

@end


@implementation IdeaDetailAuthors

@end


@implementation IdeaDetailRelated_Guides

@end


//@implementation IdeaDetailMobile
//
//@end


