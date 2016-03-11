//
//  MoreSubject.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CommonModel.h"

@class SubjectData;
@interface MoreSubject : CommonModel


@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<SubjectData *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@end
@interface SubjectData : CommonModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

