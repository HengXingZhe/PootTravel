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
#import "HomeCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "WebViewController.h"
#import "MoreDiscountViewController.h"
#import "DetailDiscountViewController.h"
#import "HotTravelTabView.h"
@interface RecommendViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@property (nonatomic, strong) FirstPageHeaderViewController *first;

@property (nonatomic, strong) UICollectionView *collectionView;


@property (nonatomic, strong) NSMutableArray *Source;

@property (nonatomic, strong) UIImageView *discount_subject;

@property (nonatomic, strong) UIScrollView *scrollerView;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) HotTravelTabView *hotView;
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollerView];
    [self createHeaderView];
    [self creteCollectionView];
    [self createHotTabView];
    [self loadNetData];
    self.edgesForExtendedLayout = NO;
    
    // Do any additional setup after loading the view.
}

//创建滑动视图

- (void)createScrollerView {
    _scrollerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollerView.scrollEnabled = NO;
    _scrollerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollerView];
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
        self.Source = [home.data.discount copy];
        
        NSArray *dissubject = [response[@"data"] objectForKey:@"discount_subject"];
        home.data.discount_subject = [Discount_Subject arrayOfModelsFromDictionaries:dissubject error:nil];
        [_discount_subject sd_setImageWithURL:[NSURL URLWithString:home.data.discount_subject[0].photo]];
        _url = home.data.discount_subject[0].url;

        
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
        [self.collectionView reloadData];
    } filed:^(id error) {
        
    
    }];
}

//上面的滚动视图
- (void)createHeaderView {
    
   
    
    _first = [[FirstPageHeaderViewController alloc] init];
    [self addChildViewController:_first];
    [self.scrollerView addSubview:_first.view];
    
    CGFloat Y = CGRectGetMaxY(_first.view.frame);
    
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    _discount_subject = [[UIImageView alloc] initWithFrame:
                         CGRectMake(10, Y - 140, self.view.frame.size.width-20, 150)];
    [_discount_subject addGestureRecognizer:tap];
    _discount_subject.userInteractionEnabled = YES;
    [tap addTarget:self action:@selector(tapTap:)];
    [self.scrollerView addSubview:_discount_subject];
}
- (void)tapTap:(UITapGestureRecognizer*)tap {
    WebViewController *web = [[WebViewController alloc] init];
    web.url = [NSURL URLWithString:_url];
    [self.navigationController pushViewController:web animated:YES];
}

//创建collectionview


- (void)creteCollectionView {
    UICollectionViewFlowLayout *fly = [[UICollectionViewFlowLayout alloc] init];
    fly.itemSize = CGSizeMake(191, 187);
    fly.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
    fly.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    
    CGFloat Y = CGRectGetMaxY(_discount_subject.frame);
    _collectionView = [[UICollectionView alloc] initWithFrame:
                       CGRectMake(10, Y + 10, self.view.frame.size.width - 20, 400)
                                         collectionViewLayout:fly];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.scrollEnabled = NO;
    [self.scrollerView addSubview:_collectionView];
    
    [self.collectionView registerNib:
        [UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"cellID"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, CGRectGetMaxY(_collectionView.frame),
                           self.view.frame.size.width - 20, 44);
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"查看全部折扣" forState:
                                UIControlStateNormal];
    [btn addTarget:self action:@selector(moreSubject:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 200;
    [self.scrollerView addSubview:btn];
    
}

- (void)moreSubject:(UIButton*)btn {
    MoreDiscountViewController *discount = [[MoreDiscountViewController alloc] init];
    [self.navigationController pushViewController:discount animated:YES];

}

//标题
- (UILabel*)createHotTravelHeaderView {
    
    UIButton *btn = (UIButton*)[self.view viewWithTag:200];
    
    CGFloat Y = CGRectGetMaxY(btn.frame);
    
    UILabel *view = [[UILabel alloc] initWithFrame:
                     CGRectMake(10, Y + 10, _scrollerView.frame.size.width - 20, 44)];
    view.text = @" 查看热门游记";
    view.textColor = [UIColor grayColor];
    
     _scrollerView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(view.frame));
    return view;
}

//查看热门旅游
- (void)createHotTabView {

    UILabel *la = [self createHotTravelHeaderView];
    
    [_scrollerView addSubview:la];
    
    
    _hotView = [[HotTravelTabView alloc] initWithFrame:CGRectMake(10,0, self.view.frame.size.width - 20, self.view.frame.size.height)
                                                                  style:UITableViewStylePlain];
    _hotView.tableHeaderView = _scrollerView;
    
    _hotView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_hotView];
    
    __block typeof(self) weakSelf = self;
    [_hotView setBlock:^(NSURL *url) {
        WebViewController *web = [[WebViewController alloc] init];
        web.url = url;
        [weakSelf.navigationController pushViewController:web animated:YES];
    }];
    
}

#pragma mark - 协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.Source.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    Discount *dis = self.Source[indexPath.row];
    [cell configData:dis];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailDiscountViewController *detail = [[DetailDiscountViewController alloc] init];
    detail.id = [self.Source[indexPath.row] id];

    [self.navigationController pushViewController:detail animated:YES];
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
