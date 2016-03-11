//
//  HotNoteTrovelTableViewCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HotNoteTrovelTableViewCell.h"

#import "UIImageView+WebCache.h"
@interface HotNoteTrovelTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *hotPhoto;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *viewsLabe;
@property (weak, nonatomic) IBOutlet UILabel *replysLabel;

@end
@implementation HotNoteTrovelTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configData:(HotData*)model {
    
    [_hotPhoto sd_setImageWithURL:
                      [NSURL URLWithString:model.photo]];

    _titleLable.text = model.title;
    
    _userName.text = model.username;
    
    _viewsLabe.text = [NSString stringWithFormat:@"👀 %ld",model.views];
    
    _replysLabel.text = [NSString stringWithFormat:@"💼 %@",model.replys];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
