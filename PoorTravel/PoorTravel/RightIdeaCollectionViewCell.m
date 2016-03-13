//
//  RightIdeaCollectionViewCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "RightIdeaCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface RightIdeaCollectionViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *photoView;


@end
@implementation RightIdeaCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}





- (void)configData:(IdeaGuides *)model {
    
//    http://static.qyer.com/upload/Guide_Info/d9/d4/46/260_390.jpg?cover_updatetime=1456743674
    //拼接网址
    NSString *url = [NSString stringWithFormat:@"%@/260_390.jpg?cover_updatetime=1456743674",model.cover];
    [self.photoView sd_setImageWithURL:
                          [NSURL URLWithString:url]];
}

@end
