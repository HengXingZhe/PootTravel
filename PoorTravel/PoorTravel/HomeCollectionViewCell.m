//
//  HomeCollectionViewCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HomeCollectionViewCell.h"

#import "UIImageView+WebCache.h"
@interface HomeCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *roadLable;
@property (weak, nonatomic) IBOutlet UILabel *discountLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;


@end
@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configData:(Discount*)model {
    [_headerView sd_setImageWithURL:
               [NSURL URLWithString:model.photo]];

    _discountLable.text = model.priceoff;
    
    NSString *temp = [model.price substringToIndex:8];
    _priceLable.text = [NSString stringWithFormat:@"%@元起",
                        [temp substringFromIndex:4]];
    
    _roadLable.text = model.title;
}


@end
