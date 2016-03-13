//
//  IdeaViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "IdeaViewController.h"
#import "Header.h"
#import "LoadNetData.h"
#import "IdeaModel.h"
#import "CtategoryIdea.h"
#import "RightCollectionView.h"
#import "IdeaTabView.h"
#import "IdeaDetailViewController.h"
@interface IdeaViewController ()

@property (nonatomic, strong) NSMutableArray *leftSource;

@property (nonatomic, strong) NSMutableArray *rightSource;


@property (nonatomic) NSInteger page;

@property (nonatomic, strong) IdeaTabView *left;

@property (nonatomic, strong) RightCollectionView *right;

@property (nonatomic, copy) NSString *tempUrl;

@property (nonatomic, strong)  UIView *flag;

@end

@implementation IdeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _page = 1;
    _Id = 999999;
    _leftSource = [NSMutableArray array];
    _rightSource = [NSMutableArray array];
    [self lefTabView];
    [self loadLeftTabViewNetData];
    [self loadRightData];
    [self createMidleView];
    self.edgesForExtendedLayout = NO;
    // Do any additional setup after loading the view.
}



//请求左边的数据
- (void)loadLeftTabViewNetData {

    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:CateGrayIdea success:^(id response) {
        
        CtategoryIdea *ideaCategory = [[CtategoryIdea alloc]
                                       initWithDictionary:response error:nil];
        ideaCategory.data = [CategrayIdeaData arrayOfModelsFromDictionaries:response[@"data"] error:nil];
        [_leftSource addObjectsFromArray:ideaCategory.data];
        _left.sourceArray = _leftSource;
        [self.left reloadData];
    } filed:^(id error) {
        
    }];
}

//请求右边的数据

- (void)loadRightData {
    
    NSString *tempId = [NSString stringWithFormat:@"id=%ld",_Id];
    NSString *temp = [NSString stringWithFormat:@"page=%ld",_page];
    _tempUrl = [Idea stringByReplacingOccurrencesOfString:@"page=^^" withString:temp];
    _tempUrl = [_tempUrl stringByReplacingOccurrencesOfString:@"id=++" withString:tempId];
    [[LoadNetData sharedLoadNetData] loadNetDataWithUrl:_tempUrl success:^(id response) {
        IdeaModel *moel = [[IdeaModel alloc] initWithDictionary:response error:nil];
        
        moel.data = [IdeaData arrayOfModelsFromDictionaries:response[@"data"] error:nil];
        
        
        for (IdeaData *idea in moel.data) {
            
            idea.guides = [[IdeaGuides arrayOfModelsFromDictionaries:idea.guides error:nil] copy];
        }
        
        _right.model = moel;
        [self.right reloadData];
    } filed:^(id error) {
        
    }];

    _tempUrl = Idea;
}

//创建左边的视图
- (void)lefTabView {
    _left = [[IdeaTabView alloc] initWithFrame:
                         CGRectMake(0, 0, 120, self.view.frame.size.height - 100) style:UITableViewStylePlain];
    
    //点击的时候改变标记
    __block typeof(self) weakSelf = self;
    
    [_left setBlock:^(NSInteger id, NSIndexPath *indexPath,CGPoint contentOffSet) {
       
        
        _Id = id;
        if (contentOffSet.y == 0) {
            CGFloat Y = 80 * (indexPath.row + 1) - 40;
            [UIView animateWithDuration:1.0 animations:^{
                weakSelf.flag.frame = CGRectMake(118, Y, 8, 8);
            }];
           
        } else {
            NSInteger temp = contentOffSet.y/80;
            
            CGFloat Y = 80 * (indexPath.row + 1 - temp) - 40;
            [UIView animateWithDuration:1.0 animations:^{
                CGRect frame = CGRectMake(118, Y, 8, 8);
                weakSelf.flag.frame = frame;
            }];
        
        }
        [weakSelf loadRightData];
    }];
    
    
    //滚动的时候改变标记
    __block typeof(self) weakSelf1 = self;
    [_left setScrollerBlock:^(CGPoint contentOffSet) {
      
        NSInteger t = (NSInteger)self.view.frame.size.height/80;
        NSInteger f = (NSInteger)contentOffSet.y/80;
        
        NSInteger temp = f%t;
        
        NSInteger Y = temp * 80 + 40;
       
        CGRect frame = CGRectMake(118, Y, 8, 8);
        
        weakSelf1.flag.frame = frame;
        
    }];
    
    
    //停止滚动的时候刷新数据
    __block typeof(self) weakSelf3 = self;
    [_left setStop:^(NSInteger id) {
        _Id = id;
      dispatch_queue_t quen = dispatch_get_global_queue(0, 0);
        
        dispatch_queue_t main = dispatch_get_main_queue();
        
        dispatch_async(quen, ^{
            [weakSelf3 loadRightData];
            sleep(2);
           dispatch_async(main, ^{
               [weakSelf3.left reloadData];
           });
        });
        
    }];
    
    [self.view addSubview:_left];
    
    [self rightCollectionView];
    
    [self createMidleView];

}
//中间的线
- (void)createMidleView {
    UIView *view = [[UIView alloc] initWithFrame:
                    CGRectMake(121, 0, 1, self.view.frame.size.height)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    _flag = [[UIView alloc] initWithFrame:
                    CGRectMake(118, 40, 8, 8)];

    _flag.layer.masksToBounds = YES;
    _flag.layer.cornerRadius = 4;
    _flag.backgroundColor = [UIColor redColor];
    [self.view addSubview:_flag];
}

//创建右边的视图

- (void)rightCollectionView {
    UICollectionViewFlowLayout *fly = [[UICollectionViewFlowLayout alloc] init];
    fly.itemSize = CGSizeMake(130, 170);
    fly.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    fly.minimumLineSpacing = 20;
    fly.minimumInteritemSpacing = 10;
    
    _right = [[RightCollectionView alloc] initWithFrame:
              CGRectMake(125, 0, self.view.frame.size.width - 130, self.view.frame.size.height) collectionViewLayout:fly];
    
     __block typeof(self) weakSelf = self;
    [_right setNext:^(NSString *url) {
        
        IdeaDetailViewController *next = [[IdeaDetailViewController alloc] init];
        next.url = url;
        [weakSelf.navigationController pushViewController:next animated:YES];
        
    }];
    
    [self.view addSubview:_right];
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
