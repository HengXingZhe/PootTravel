//
//  HeaderScroller.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^blockEvent)(NSURL *url);

@interface HeaderScroller : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *page;

@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, copy) blockEvent block;

- (void)setBlock:(blockEvent)block;

- (void)createImageView;



@end
