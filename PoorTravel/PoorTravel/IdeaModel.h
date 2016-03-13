//
//  IdeaModel.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CommonModel.h"
@class IdeaData,IdeaGuides;
@interface IdeaModel :CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<IdeaData *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;


@end

@interface IdeaData : CommonModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<IdeaGuides *> *guides;

@end

@interface IdeaGuides : CommonModel

@property (nonatomic, copy) NSString *category_title;

@property (nonatomic, copy) NSString *country_name_py;

@property (nonatomic, copy) NSString *country_id;

@property (nonatomic, copy) NSString *guide_id;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *file;

@property (nonatomic, copy) NSString *guide_enname;

@property (nonatomic, copy) NSString *country_name_en;

@property (nonatomic, copy) NSString <Optional>*size;

@property (nonatomic, copy) NSString *country_name_cn;

@property (nonatomic, assign) NSInteger download;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *update_log;

@property (nonatomic, copy) NSString *guide_cnname;

@property (nonatomic, copy) NSString *guide_pinyin;

@property (nonatomic, copy) NSString *cover_updatetime;

@property (nonatomic, copy) NSString *update_time;

@end

