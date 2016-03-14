//
//  DataModel.h
//  PoorTravel
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "JSONModel.h"

@interface DataModel : JSONModel
@property (nonatomic ,copy) NSString *cover;
@property (nonatomic ,copy) NSString *mp4_url;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *ptime;
@property (nonatomic ,copy) NSString *replyCount;
@property (nonatomic ,copy) NSString *theDescription;
@end
