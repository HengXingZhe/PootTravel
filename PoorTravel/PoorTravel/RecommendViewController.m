//
//  RecommendViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "RecommendViewController.h"
#import "LoadNetData.h"
#import "HomePageScrollerModel.h"
#import "Header.h"
#import "FirstPageHeaderViewController.h"
@interface RecommendViewController ()

@property (nonatomic, strong) FirstPageHeaderViewController *first;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNetData];
    [self createHeaderView];
    self.edgesForExtendedLayout = NO;
    
    // Do any additional setup after loading the view.
}


//请求网络数据

- (void)loadNetData {
    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:FirstScrollerView success:^(id response) {
        HomePageScrollerModel *home = [[HomePageScrollerModel alloc]
                                       initWithDictionary:response error:nil];
        
        home.data = [[Data alloc] initWithDictionary:response[@"data"] error:nil];

        NSDictionary *chicken = [response[@"data"] objectForKey:@"checkin"];
        home.data.checkin = [[Checkin alloc] initWithDictionary:
                             chicken error:nil];
     
        NSArray *discount = [response[@"data"] objectForKey:@"discount"];
        home.data.discount = [Discount arrayOfModelsFromDictionaries:
                              discount error:nil];
        
        NSArray *dissubject = [response[@"data"] objectForKey:@"discount_subject"];
        home.data.discount_subject = [Discount_Subject arrayOfModelsFromDictionaries:dissubject error:nil];
        
        home.data.seckilling = [[Seckilling arrayOfModelsFromDictionaries:
                                 [response[@"data"]objectForKey:@"seckilling"] error:nil] copy];
//        home.data.seckilling.seckill_object = nil;
//        home.data.seckilling.seckill_switch = 1;//
        
        home.data.slide = [Slide arrayOfModelsFromDictionaries:
                           [response[@"data"] objectForKey:@"slide"] error:nil];
        home.data.subject = [Subject arrayOfModelsFromDictionaries:
                             [response[@"data"] objectForKey:@"subject"] error:nil];
             _first.model = home;
             [_first configData];
    } filed:^(id error) {
        
    
    }];
}

- (void)createHeaderView {
    _first = [[FirstPageHeaderViewController alloc] init];
    [self addChildViewController:_first];
    [self.view addSubview:_first.view];

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
