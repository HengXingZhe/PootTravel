//
//  TabBaseViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "TabBaseViewController.h"
#import "MoreSubjectTableViewCell.h"
#import "MoreSubject.h"
#import "LoadNetData.h"
#import "Header.h"
@interface TabBaseViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tabView;

@property (nonatomic, strong) MoreSubject *subject;

@property (nonatomic) NSInteger page;

@property (nonatomic, strong) NSMutableArray *Source;

@end

@implementation TabBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _Source = [NSMutableArray array];
    _page = 1;
    [self loadNetData];
    [self createTabView];
}

- (void)loadNetData {
    
    
//    [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    NSString *temp = [NSString stringWithFormat:@"%ld",_page];
    
    NSString *url = [NetSubject stringByReplacingOccurrencesOfString:@"^^" withString:temp];
    
    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:
     url success:^(id response) {
         _subject = [[MoreSubject alloc] initWithDictionary:response error:nil];
         
         _subject.data = [SubjectData arrayOfModelsFromDictionaries:response[@"data"] error:nil];
         [_Source addObjectsFromArray:_subject.data];
         [self.tabView reloadData];
    } filed:^(id error) {
        
    }];

    url = NetSubject;
}


//创建tabView；
- (void)createTabView {
    _tabView = [[UITableView alloc] initWithFrame:
                CGRectMake(10, 10, self.view.frame.size.width - 20, self.view.frame.size.height)
                                            style:UITableViewStylePlain];
    [self.tabView registerNib:
           [UINib nibWithNibName:@"MoreSubjectTableViewCell" bundle:nil]
                       forCellReuseIdentifier:@"cellID"];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];

}

#pragma mark - 协议方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 305;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _Source.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MoreSubjectTableViewCell *cell = [tableView
                                      dequeueReusableCellWithIdentifier:@"cellID"];
    SubjectData *data = _Source[indexPath.row];
    
    [cell configData:data];
    
    return cell;
    
}

#pragma mark - scroller的代理方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //刷新动画
    if (indexPath.row == self.Source.count - 1) {
       
        self.tabView.tableFooterView = [self createImageArrayWithNmae:@"DOVE" count:19];
        dispatch_queue_t quene = dispatch_get_global_queue(0, 0);
        dispatch_queue_t mainQuene = dispatch_get_main_queue();
        
        dispatch_async(quene, ^{
            
            _page ++;
            [self loadNetData];
            sleep(1);
            dispatch_async(mainQuene, ^{
                
                
                self.tabView.tableFooterView = nil;
            });
        
        });
}
    
    
}

//创建image数组

- (UIView*)createImageArrayWithNmae:(NSString*)imageNmae count:(NSInteger)count {

    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 1; i < count; i ++) {
        
        NSString *image = [NSString stringWithFormat:@"%@%.2d",imageNmae,i];
        
        UIImage *images = [UIImage imageNamed:image];
        [arr addObject:images];
    }
    
    
    UIView *footerView = [[UIImageView alloc] initWithFrame:
                          CGRectMake(0, 0, self.tabView.frame.size.width, self.tabView.frame.size.height)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 200, footerView.frame.size.height)];
    
    imageView.animationImages = arr;
    imageView.animationDuration = 1.0;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    
    [footerView addSubview:imageView];
    
    return footerView;
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
