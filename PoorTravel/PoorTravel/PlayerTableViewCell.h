//
//  PlayerTableViewCell.h
//  PoorTravel
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface PlayerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playerImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;


- (void)configDataSource:(DataModel *)model;
@end
