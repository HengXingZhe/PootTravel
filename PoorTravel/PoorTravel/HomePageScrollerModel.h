//
//  HomePageScrollerModel.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "JSONModel.h"
#import "CommonModel.h"
@class Data,Checkin,Seckilling,Seckill_Object,Discount,Subject,Discount_Subject,Slide;
@interface HomePageScrollerModel : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) Data *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;

@end
@interface Data : CommonModel

@property (nonatomic, copy) NSString *search;

@property (nonatomic, strong) NSArray *mguide;

@property (nonatomic, strong) NSArray<Discount_Subject *> *discount_subject;

@property (nonatomic, strong) Seckilling *seckilling;

@property (nonatomic, strong) Checkin *checkin;

@property (nonatomic, strong) NSArray<Subject *> *subject;

@property (nonatomic, strong) NSArray<Discount *> *discount;

@property (nonatomic, strong) NSArray<Slide *> *slide;

@end

@interface Checkin : CommonModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *url;

@end

@interface Seckilling : CommonModel

//@property (nonatomic, strong) Seckill_Object <Ignore>*seckill_object;

//@property (nonatomic, assign) NSInteger seckill_switch;

@end

@interface Seckill_Object : CommonModel

@end

@interface Discount : CommonModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *end_date;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *priceoff;

@property (nonatomic, copy) NSString *photo;

@end

@interface Subject : CommonModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

@interface Discount_Subject : CommonModel

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

@interface Slide : CommonModel

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

