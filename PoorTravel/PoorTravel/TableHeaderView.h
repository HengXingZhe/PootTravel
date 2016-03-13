//
//  TableHeaderView.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdeaDetailModel.h"
@interface TableHeaderView : UIView

@property (nonatomic, strong) IdeaDetailModel *model;

@property (nonatomic, strong) IdeaDetailAuthors *author;

@property (nonatomic) CGFloat Heigh;

- (void)configData;

@end
