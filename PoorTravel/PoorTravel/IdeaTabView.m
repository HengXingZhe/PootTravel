//
//  IdeaTabView.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "IdeaTabView.h"
@interface IdeaTabView ()<UITableViewDelegate,UITableViewDataSource>


@end
@implementation IdeaTabView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[UITableViewCell class]
                      forCellReuseIdentifier:@"cellID"];
        
        
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.sourceArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [self.sourceArray[indexPath.row] cnname];
    cell.textLabel.textColor = [UIColor grayColor];
    UIColor *color = [UIColor grayColor];
    cell.backgroundColor = [color colorWithAlphaComponent:0.1];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self deselectRowAtIndexPath:indexPath animated:YES];
    if (self.block) {
        self.block([self.sourceArray[indexPath.row] id],indexPath,tableView.contentOffset);
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    
    
    if (self.scrollerBlock) {
        self.scrollerBlock(scrollView.contentOffset);
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   
    NSInteger freshId =
                  scrollView.contentOffset.y/80 + 2;
    NSInteger stopId = [self.sourceArray[freshId] id];
    
    if (self.stop) {
        self.stop(stopId);
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
