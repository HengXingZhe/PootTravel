//
//  IdeaDetailModel.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CommonModel.h"

@class IdeaDeatilData,IdeaDetailMobile,IdeaDetailAuthors,IdeaDetailRelated_Guides,IdeaDetailMobile;
@interface IdeaDetailModel : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) IdeaDeatilData *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface IdeaDeatilData : CommonModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *country_name_py;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *category_title;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, strong) NSArray<IdeaDetailAuthors *> *authors;

@property (nonatomic, copy) NSString *country_name_cn;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, copy) NSString *pinyin;

@property (nonatomic, assign) NSInteger country_id;

@property (nonatomic, strong) NSArray<IdeaDetailRelated_Guides *> *related_guides;

@property (nonatomic, strong) IdeaDetailMobile *mobile;

@property (nonatomic, copy) NSString *cover_updatetime;

@property (nonatomic, copy) NSString *update_time;

@property (nonatomic, copy) NSString *country_name_en;

@property (nonatomic, assign) NSInteger download;

@property (nonatomic, assign) NSInteger category_id;

@end

@interface IdeaDetailMobile : CommonModel

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *file;

@property (nonatomic, assign) NSInteger size;

@end

@interface IdeaDetailAuthors : CommonModel

@property (nonatomic, copy) NSString *username;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *avatar;

@end

@interface IdeaDetailRelated_Guides : CommonModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *category_title;

@property (nonatomic, copy) NSString *country_name_py;

@property (nonatomic, assign) NSInteger country_id;

@property (nonatomic, strong) IdeaDetailMobile *mobile;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, copy) NSString *country_name_en;

@property (nonatomic, copy) NSString *pinyin;

@property (nonatomic, copy) NSString *country_name_cn;

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, assign) NSInteger download;

@property (nonatomic, copy) NSString *cover_updatetime;

@property (nonatomic, copy) NSString *update_time;

@end

//@interface IdeaDetailMobile : CommonModel
//
//@property (nonatomic, assign) NSInteger page;
//
//@property (nonatomic, copy) NSString *file;
//
//@property (nonatomic, assign) NSInteger size;
//
//@end

