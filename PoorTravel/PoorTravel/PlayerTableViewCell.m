//
//  PlayerTableViewCell.m
//  PoorTravel
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation PlayerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configDataSource:(DataModel *)model {
    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.theDescription;
    self.playCountLabel.text = [NSString stringWithFormat:@"评论:%@",model.replyCount];
    self.timeLabel.text = [NSString stringWithFormat:@"时间:%@",model.ptime];
    [self.playerImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
