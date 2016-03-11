//
//  MoreSubjectTableViewCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "MoreSubjectTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface MoreSubjectTableViewCell ()



@end


@implementation MoreSubjectTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configData:(SubjectData*)model {
    
    [self.topImageView sd_setImageWithURL:
                       [NSURL URLWithString:model.photo]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
