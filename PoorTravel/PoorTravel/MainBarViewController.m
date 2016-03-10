//
//  MainBarViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/9.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "MainBarViewController.h"
#import "RecommendViewController.h"
#import "MyViewController.h"
#import "DestationViewController.h"
#import "CommunityViewController.h"
#import "VideoViewController.h"
#import "BaseViewController.h"
@interface MainBarViewController ()

@end

@implementation MainBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
    // Do any additional setup after loading the view.
}

- (void)createTabBar {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TabBat" ofType:@"plist"];
    NSArray *tabBar = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *info in tabBar) {
        Class cls = NSClassFromString(info[@"className"]);
        BaseViewController *vc = [[cls alloc] init];
        
        UIImage *normal = [UIImage imageNamed:
                           info[@"normalImageName"]];
       
        UIImage *selectImage = [UIImage imageNamed:
                                info[@"selectImageName" ]];
        
        vc.tabBarItem.title = info[@"tabBarTilte"];
        vc.tabBarItem.image = normal;
        vc.tabBarItem.selectedImage = selectImage;
        vc.title = info[@"tabBarTilte"];
        
        UINavigationController *na = [[UINavigationController alloc]
                                      initWithRootViewController:vc];
        
        
        [self addChildViewController:na];
    }

    [[UINavigationBar appearance] setBackgroundImage:
                                [UIImage imageNamed:@"NavBack"]
                                     forBarMetrics:UIBarMetricsDefault];
    NSDictionary *title = @{[UIColor whiteColor]:
                             NSForegroundColorAttributeName};
    [[UINavigationBar appearance]
          setTitleTextAttributes:title];
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
