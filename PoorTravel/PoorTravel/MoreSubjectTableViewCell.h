//
//  MoreSubjectTableViewCell.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreSubject.h"

@interface MoreSubjectTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *topImageView;

- (void)configData:(SubjectData*)model;

@end
