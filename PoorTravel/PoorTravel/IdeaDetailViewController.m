
//
//  IdeaDetailViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "IdeaDetailViewController.h"
#import "LoadNetData.h"
#import "Header.h"
#import "JinNangDetailViewController.h"
#import "IdeaDetailModel.h"
#import "TableHeaderView.h"
#import "JinNangDetailViewController.h"
@interface IdeaDetailViewController ()

@property (nonatomic) NSInteger page;

@property (nonatomic, strong) JinNangDetailViewController *detailView;


@end

@implementation IdeaDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _page = 1;
    _id = 37;
    [self createTabView];
    [self loadDataSource];
    // Do any additional setup after loading the view.
}

- (void)loadDataSource {

    NSDictionary *dic =  @{@"client_id":@"qyer_ios",@"client_secret":@"cd254439208ab658ddf9",@"count":@20,@"id":@(_id),@"lat":@34.77416518102751,@"lon":@113.6696762321501,@"page":@(_page),@"track_app_channel":@"App%20Store",@"track_app_version":@"6.8.5",@"track_device_info":@"iPhone%204S",@"track_device":@"0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180",@"track_os":@"ios%208.0.2",@"v":@1};
    
    [[LoadNetData sharedLoadNetData] laodNetDataByPostUrl:@"http://open.qyer.com/qyer/guide/detail" para:dic success:^(id response) {
        
        IdeaDetailModel *ideaMoel = [[IdeaDetailModel alloc] initWithDictionary:response error:nil];
        ideaMoel.data = [[IdeaDeatilData alloc] initWithDictionary:response[@"data"] error:nil];
        ideaMoel.data.authors = [IdeaDetailAuthors arrayOfModelsFromDictionaries:response[@"data"][@"authors"] error:nil];
        ideaMoel.data.related_guides = [IdeaDetailRelated_Guides arrayOfModelsFromDictionaries:response[@"data"][@"related_guides"] error:nil];
        
        _detailView.sourceArray = [ideaMoel.data.related_guides copy];
        [_detailView.tabView reloadData];
        ideaMoel.data.mobile = [[IdeaDetailMobile alloc] initWithDictionary:response[@"data"][@"mobile"] error:nil];
    } filed:^(id error) {
        
    }];

}

- (void)createTabView {
    _detailView = [[JinNangDetailViewController alloc] init];
    _detailView.url = _url;
    _detailView.view.frame = self.view.frame;
    [self addChildViewController:_detailView];
    [self.view addSubview:_detailView.view];
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
