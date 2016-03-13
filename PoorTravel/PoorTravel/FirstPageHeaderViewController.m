//
//  FirstPageHeaderViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "FirstPageHeaderViewController.h"
#import "UIImageView+WebCache.h"
#import "HeaderScroller.h"
#import "HeaderScroller.h"
#import "WebViewController.h"
#import "TabBaseViewController.h"
#import "IdeaViewController.h"
@interface FirstPageHeaderViewController ()

@property (nonatomic, strong) HeaderScroller *gunDong;

@property (weak, nonatomic) IBOutlet UIView *scrollerView;

@property (nonatomic, strong) NSArray *btnArray;
@property (weak, nonatomic) IBOutlet UIButton *kanJInNang;
@property (weak, nonatomic) IBOutlet UIButton *qinagZheKou;
@property (weak, nonatomic) IBOutlet UIButton *dingJiuDian;
@property (weak, nonatomic) IBOutlet UIButton *lvTuZhong;

@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *leftView;
@property (weak, nonatomic) IBOutlet UIImageView *rightView;
@property (weak, nonatomic) IBOutlet UIButton *moreSubject;


@end

@implementation FirstPageHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.moreSubject addTarget:self action:
                       @selector(morepress:)
                              forControlEvents:UIControlEventTouchUpInside];
    [self createScrollerHeaderView];
}


- (IBAction)kanJingNangPress:(UIButton *)sender {
    IdeaViewController *idea = [[IdeaViewController alloc] init];
    [self.navigationController pushViewController:idea animated:YES];

}


//创建滚动视图
- (void)createScrollerHeaderView {
    
    
    CGFloat minY = CGRectGetMinY(_kanJInNang.frame);
    _gunDong = [[HeaderScroller alloc] initWithFrame:
                CGRectMake(0, 0, _scrollerView.frame.size.width, minY - 10)];
    
    
    [_scrollerView addSubview:_gunDong];
       [self setImage];
}
- (void)configData {
   
    _gunDong.imageArray =(NSMutableArray*)_model.data.slide;
    
    //添加小圆点 page
    _gunDong.imageArray = (NSMutableArray*)_model.data.slide;
    [_gunDong createImageView];
    [_scrollerView addSubview:_gunDong.page];
    
    __block typeof(self)  weakself = self;
    [_gunDong setBlock:^(NSURL *url) {
        WebViewController *web = [[WebViewController alloc] init];
        web.url = url;
        [weakself.navigationController pushViewController:web animated:YES];
        
    }];
    for (int i = 0; i < 3; i ++) {
        Subject *sub = _model.data.subject[i];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(tap:)];
        
        if (i == 0) {
            self.headerView.userInteractionEnabled = YES;
            [self.headerView sd_setImageWithURL:
             [NSURL URLWithString:sub.photo]];
            self.headerView.tag = 100 ;
            [self.headerView addGestureRecognizer:tap];
        }else if (i == 1) {
            self.rightView.userInteractionEnabled = YES;
            [self.rightView sd_setImageWithURL:
             [NSURL URLWithString:sub.photo]];
            self.rightView.tag = 101;
            [self.rightView addGestureRecognizer:tap];
            
        }else {
            self.leftView.userInteractionEnabled = YES;
            [self.leftView sd_setImageWithURL:
             [NSURL URLWithString:sub.photo]];
            self.leftView.tag = 102;
            [self.leftView addGestureRecognizer:tap];
        }
   }
}

- (void)tap:(UITapGestureRecognizer*)tap {
    UIView *view = tap.view;
    NSInteger num = view.tag - 100;
    Subject *sub = _model.data.subject[num];
    WebViewController *web = [[WebViewController alloc] init];
    web.url = [NSURL URLWithString:sub.url];
    [self.navigationController
     pushViewController:web animated:YES];
}

- (void)setCorBtn:(UIButton*)btn withNmae:(NSString*)name{
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.frame.size.width/2;
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
}

//更多按钮的点击事件
- (void)morepress:(UIButton*)btn {
    
    TabBaseViewController *tab = [[TabBaseViewController
                                   alloc] init];
    tab.title = @"专题";
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:tab
                                         animated:YES];


}

//给按钮设置背景图片

- (void)setImage {
    
    [self setCorBtn:_kanJInNang withNmae:
     @"tab_found_select"];
    _kanJInNang.backgroundColor = [UIColor greenColor];
    
    [self setCorBtn:_qinagZheKou
           withNmae:@"tab_setting_select"];
    _qinagZheKou.backgroundColor = [UIColor yellowColor];
    
    [self setCorBtn:_dingJiuDian
           withNmae:@"tabbar_appfree_press"];
    _dingJiuDian.backgroundColor = [UIColor blueColor];
    //设置动画
   
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 1; i < 24; i ++) {
        UIImage *image2 = [UIImage imageNamed:
                          [NSString stringWithFormat:
                           @"Recommend_Location_Loading_%d",i]];
        [images addObject:image2];
    }
    
    
    
    self.lvTuZhong.backgroundColor = [UIColor redColor];
    self.lvTuZhong.layer.masksToBounds = YES;
    self.lvTuZhong.layer.cornerRadius = 25;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(10, 10, self.lvTuZhong.frame.size.width - 20, self.lvTuZhong.frame.size.width -20);
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 30;
    imageView.userInteractionEnabled = YES;
    [self.lvTuZhong addSubview:imageView];
   
    
    imageView.animationImages = images;
    imageView.animationDuration = 1.0;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];

}
//园按钮的点击事件
- (void)btnPress:(UIButton*)btn {
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
