//
//  CtategoryIdea.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CommonModel.h"

@class CategrayIdeaData;
@interface CtategoryIdea : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<CategrayIdeaData *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface CategrayIdeaData : CommonModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger pdf_count;

@property (nonatomic, assign) NSInteger mobile_count;

@property (nonatomic, copy) NSString *pinyin;

@property (nonatomic, copy) NSString *enname;

@end

