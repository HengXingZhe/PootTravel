//
//  JinNangDetailViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "JinNangDetailViewController.h"
#import "TableHeaderView.h"
#import "JinNangDetailTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "RightCollectionView.h"
@interface JinNangDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@property (weak, nonatomic) IBOutlet UIButton *downLoadButon;

@property (weak, nonatomic) IBOutlet UILabel *sizeLable;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *downloadTimes;



@end

@implementation JinNangDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  [self configTabView];
    // Do any additional setup after loading the view from its nib.
}



- (void)configData:(IdeaDetailModel*)model {
    //[self.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.]];


}

- (void)configTabView {
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.tabView registerNib:
          [UINib nibWithNibName:@"JinNangDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
    
    TableHeaderView *view = [[TableHeaderView alloc] initWithFrame:
                             CGRectMake(0, 0, self.tabView.frame.size.width, 100)];
    
    self.tabView.tableHeaderView = view;
    self.headerImageView.backgroundColor = [UIColor redColor];
    self.tabView.backgroundColor = [UIColor redColor];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:_url]];
}

#pragma mark - 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JinNangDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    IdeaDetailRelated_Guides *guide = self.sourceArray[indexPath.row];
    [cell configData:guide];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 137;
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
