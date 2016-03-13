//
//  JinNangDetailViewController.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "BaseViewController.h"

@interface JinNangDetailViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (nonatomic, strong) NSMutableArray *sourceArray;

@property (nonatomic, copy) NSString *url;


@end
