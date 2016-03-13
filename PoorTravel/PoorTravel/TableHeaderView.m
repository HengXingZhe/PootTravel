//
//  TableHeaderView.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "TableHeaderView.h"
#import "CaculateDate.h"
#import "LoadNetData.h"
#import "UIImageView+WebCache.h"
@interface TableHeaderView ()

@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) UILabel *introduce;

@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) UILabel *travelAuthor;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *name;


@property (nonatomic, strong) UILabel *authorIntroduce;
@end
@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self cretaeAuthorUI];
        [self createIntroduceUI];
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, _Heigh);
    }
    return self;

}

//内容简介
- (void)createIntroduceUI {
    
    _introduce = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, 30)];
    _introduce.font = [UIFont systemFontOfSize:20];
    _introduce.text = @"简介";
    [self addSubview:_introduce];

    
    CGSize size = [CaculateDate   caculateSizeWithString:
                               _model.info];
    
    _content = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, size.width, size.height)];
   
    _content.font = [UIFont systemFontOfSize:14];
    _content.textColor = [UIColor grayColor];
    [self addSubview:_content];
    
    
    
    CGFloat Y = CGRectGetMaxY(_content.frame);
    _line = [[UIView alloc] initWithFrame:
             CGRectMake(10, Y + 10, self.frame.size.width-20, 1)];
    _line.backgroundColor = [UIColor grayColor];
    
    [self addSubview:_line];
}

//作者简介

- (void)cretaeAuthorUI {
    CGFloat Y = CGRectGetMaxY(_line.frame);
    
    _travelAuthor = [[UILabel alloc] initWithFrame:
                       CGRectMake(10, Y + 10, 200, 30)];
    _travelAuthor.font = [UIFont systemFontOfSize:20];
    _travelAuthor.text = @"锦囊作者";
    [self addSubview:_travelAuthor];

    _imageView = [[UIImageView alloc] initWithFrame:
                              CGRectMake(10, Y + 40, 40, 40)];
    
    [self addSubview:_imageView];
    
    _name = [[UILabel alloc] initWithFrame:
                       CGRectMake(60, Y + 20, 200, 30)];
   
    [self addSubview:_name];
    
    
    CGSize size = [CaculateDate caculateSizeWithString:_author.intro];
    _authorIntroduce = [[UILabel alloc] initWithFrame:
                       CGRectMake(10, Y + 90, size.width, size.height)];

   
    
    _authorIntroduce.textColor = [UIColor grayColor];
    _authorIntroduce.font = [UIFont systemFontOfSize:14];
    [self addSubview:_authorIntroduce];
    
    
    CGFloat lineY = CGRectGetMaxY(_authorIntroduce.frame);
    UILabel *secondLine = [[UILabel alloc] initWithFrame:
                           CGRectMake(10, lineY + 10, self.frame.size.width - 20, 1)];
    secondLine.backgroundColor = [UIColor grayColor];
    
    [self addSubview:secondLine];
    
    
    UILabel *relation = [[UILabel alloc] initWithFrame:
                         CGRectMake(10, lineY + 10, self.frame.size.width - 20, 10)];
    relation.text = @"相关锦囊";
    relation.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:relation];
    
    _Heigh = CGRectGetMaxY(relation.frame);
}

- (void)configData {

    _content.text = _model.info;
    
    [_imageView sd_setImageWithURL:
     [NSURL URLWithString:_author.avatar]];
    
    _name.text = _author.username;
    
    _authorIntroduce.text = _author.intro;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
