//
//  DestationViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "DestationViewController.h"
#import "AFNetworking.h"
#import "PlayerTableViewCell.h"
#import "DataModel.h"
#import "JHRefresh.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#define videoURL @"http://c.m.163.com/nc/video/list/VAP4BFE3U/y/%d-%d.html"
@interface DestationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataSource;

@property (nonatomic) NSInteger small;
@property (nonatomic) NSInteger max;

@property(nonatomic)BOOL isRefreshing;

@property (nonatomic ,strong) AVPlayerViewController *av;
@end

@implementation DestationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[NSMutableArray alloc] init];
    self.small = 0;
    self.max = 10;
    self.edgesForExtendedLayout = NO;
    [self loadDataSource];
    [self createTableView];
    self.av = [[AVPlayerViewController alloc] init];
    //创建下拉刷新的头视图
    [self createRefreshHeadView];
    //创建上拉加载更多的尾视图
    [self createRefreshFoot];
}

- (void)loadDataSource {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSSet *currentAcceptSet = manager.responseSerializer.acceptableContentTypes;
    NSMutableSet *mSet = [NSMutableSet setWithSet:currentAcceptSet];
    [mSet addObject:@"text/html"];
    [mSet addObject:@"text/xml"];
    manager.responseSerializer.acceptableContentTypes = mSet;
    NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/list/VAP4BFE3U/y/%ld-%ld.html",self.small,self.max];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.dataSource addObjectsFromArray:[DataModel arrayOfModelsFromDictionaries:responseObject[@"VAP4BFE3U"]]];
        [self.tableView reloadData];
        [self endRefresh];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)createRefreshHeadView {
    __weak typeof (self)weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.small = 0;
        [weakSelf loadDataSource];
    }];
}

- (void)createRefreshFoot {
    __weak typeof (self)weakSelf = self;
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return;
        }
        weakSelf.small += 1;
        weakSelf.max += 10;
        [weakSelf loadDataSource];
    }];
}

- (void)endRefresh {
    self.isRefreshing = NO;
    [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    [self.tableView footerEndRefreshing];
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayerTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:self.tableView];
}

#pragma mark ---------  代理方法   -------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    DataModel *model = self.dataSource[indexPath.row];
    [cell configDataSource:model];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataModel *model = [self.dataSource objectAtIndex:indexPath.row];
    self.av.player = [AVPlayer playerWithURL:[NSURL URLWithString:model.mp4_url]];
    [self presentViewController:self.av animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 272;
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
