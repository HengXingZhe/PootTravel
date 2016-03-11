//
//  HotNoteTravelModel.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CommonModel.h"

@class HotData;
@interface HotNoteTravelModel : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<HotData *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface HotData : CommonModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *view_author_url;

@property (nonatomic, copy) NSString *lastpost;

@property (nonatomic, assign) NSInteger digest_level;

@property (nonatomic, copy) NSString *replys;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view_url;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, assign) NSInteger views;

@end

