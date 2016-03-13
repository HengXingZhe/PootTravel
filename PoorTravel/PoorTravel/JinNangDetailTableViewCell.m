//
//  JinNangDetailTableViewCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "JinNangDetailTableViewCell.h"
#import "UIImageView+WebCache.h"

#import "CaculateDate.h"
#import "TableHeaderView.h"
@interface JinNangDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *countryLable;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UILabel *downlosadSize;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;


@end
@implementation JinNangDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
   

}
//给tabViewCell赋值
- (void)configData:(IdeaDetailRelated_Guides*)model {

// http://static.qyer.com/upload/Guide_Info/d9/d4/46/260_390.jpg?cover_updatetime=1456743674
//
//    http://static.qyer.com/upload/Guide_Info/19/ca/36/260_390.jpg?cover_updatetime=1456743674
    NSString *url = [NSString stringWithFormat:
                     @"%@/260_390.jpg?cover_updatetime=1456743674",model.cover];
    
    [self.photo sd_setImageWithURL:[NSURL URLWithString:url]];
    
    self.countryLable.text = model.cnname;
    
    self.region.text = [NSString stringWithFormat:
                              @"%@/%@",model.category_title,model.country_name_en];
    
    self.downlosadSize.text = [NSString stringWithFormat:
                                     @"%.2f",model.download*1.0/1024];
    NSString *update = [CaculateDate caculateDataWithSecond:
                                    [model.cover_updatetime integerValue]];
    
    self.updateTime.text = [NSString stringWithFormat:
                                                @"%@ 更新",update];

}


- (IBAction)downloadButtonClick:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
