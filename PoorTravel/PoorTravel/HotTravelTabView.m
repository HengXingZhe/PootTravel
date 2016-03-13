//
//  HotTravelTabView.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HotTravelTabView.h"
#import "HotNoteTrovelTableViewCell.h"
#import "Header.h"
#import "LoadNetData.h"
@interface HotTravelTabView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *Source;

@property (nonatomic) NSInteger page;
@end
@implementation HotTravelTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self createData];
        _Source = [NSMutableArray array];
    }
    _page = 1;
    [self registerNib:
          [UINib nibWithNibName:@"HotNoteTrovelTableViewCell" bundle:nil]
                 forCellReuseIdentifier:@"cellID"];
    self.delegate = self;
    self.dataSource = self;
    return self;

}


- (void)createData {
    
    NSString *str = [NSString stringWithFormat:@"psge=%ld",_page];
    
    NSString *url = [HotTravelNote stringByReplacingOccurrencesOfString:@"^^" withString:str];
    
    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:url success:^(id response) {
        
        HotNoteTravelModel *model = [[HotNoteTravelModel alloc] initWithDictionary:response error:nil];
        
        model.data = [HotData arrayOfModelsFromDictionaries:response[@"data"] error:nil];
        
        [self.Source addObjectsFromArray:model.data];
        [self reloadData];
    } filed:^(id error) {
        
    }];

    url = HotTravelNote;
}

- (void)referch {
    _page ++;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.Source.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HotNoteTrovelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    HotData *hot = self.Source[indexPath.row];
    [cell configData:hot];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.block) {
        HotData *data = self.Source[indexPath.row];
        NSURL *url = [NSURL URLWithString:data.view_url];
        self.block(url);
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == _Source.count-1) {
        _page++;
        [self createData];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
