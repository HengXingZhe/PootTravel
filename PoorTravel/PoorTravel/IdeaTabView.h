//
//  IdeaTabView.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CtategoryIdea.h"

typedef void (^blockEvent)(NSInteger id ,NSIndexPath *posion,CGPoint contentOffSet);

typedef void (^scrollerBlock)(CGPoint contentOffSet);

typedef void (^stopRefesh)(NSInteger id);

@interface IdeaTabView : UITableView

@property (nonatomic, strong) NSMutableArray *sourceArray;

@property (nonatomic, copy) blockEvent block;

@property (nonatomic, copy) scrollerBlock scrollerBlock;

@property (nonatomic, copy) stopRefesh stop;

- (void)setBlock:(blockEvent)block;

- (void)setScrollerBlock:(scrollerBlock)scrollerBlock;

- (void)setStop:(stopRefesh)stop;

@end
