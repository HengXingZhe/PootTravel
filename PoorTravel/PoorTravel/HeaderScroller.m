//
//  HeaderScroller.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HeaderScroller.h"
#import "UIImageView+WebCache.h"
#import "HomePageScrollerModel.h"
@interface HeaderScroller ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HeaderScroller

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
}
    self.delegate = self;
    [self createTimer];
    return self;
}

//定时器
- (void)createTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timeChagne:) userInfo:nil repeats:YES];
}


- (void)timeChagne:(NSTimer*)time {
    
    CGPoint point = self.contentOffset;
    point.x = _page.currentPage * self.frame.size.width;
    self.contentOffset = point;
    _page.currentPage++;
    NSLog(@"%ld",_page.currentPage);
    if (point.x >= (self.frame.size.width)*(self.imageArray.count-1)) {
        _page.currentPage = 0;
        self.contentOffset = CGPointMake(0, 0);
        
    }else {
        NSInteger Page = (self.contentOffset.x + 5)/self.frame.size.width;
        self.page.currentPage = Page;
    }
    
}
//创建滚动视图
- (void)createImageView {
    
    for (int num = 0; num < _imageArray.count; num++) {
        
        Slide *slider = self.imageArray[num];
        
        CGRect frame1 = CGRectMake((self.frame.size.width) * num , 0, self.frame.size.width, self.frame.size.height);
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        UIImageView *imageView = [[UIImageView alloc]
                                        initWithFrame:frame1];
        
        [imageView sd_setImageWithURL:
                         [NSURL URLWithString:slider.photo]];
        imageView.tag = 100 + num;
        
        imageView.userInteractionEnabled = YES;
               
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:  @selector(tapPress:)];
        tap.numberOfTouchesRequired = 1;
        tap.numberOfTapsRequired = 1;
        [imageView addGestureRecognizer:tap];
       
        [self addSubview:imageView];
    }

 self.contentSize = CGSizeMake(self.frame.size.width * (_imageArray.count),
                               self.frame.size.height);

}

//页面跳转
- (void)tapPress:(UITapGestureRecognizer*)tap {
    
    NSInteger num = tap.view.tag - 100;
    
    Slide *sl  = _imageArray[num];
    NSURL *url = [NSURL URLWithString:sl.url];
    
    self.block(url);

}

//懒加载
- (UIPageControl*)page {
    if (!_page) {
        CGFloat Y = CGRectGetMaxY(self.frame);
        _page = [[UIPageControl alloc] init];
        _page.frame = CGRectMake(10,Y - 60,self.frame.size.width - 20, 100);
        [_page addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
        _page.numberOfPages = _imageArray.count;
        _page.pageIndicatorTintColor = [UIColor whiteColor];
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        _page.backgroundColor = [UIColor clearColor];
        _page.currentPage = 0;
    }

    return _page;
}

- (void)pageChange:(UIPageControl*)page {
    CGPoint point = self.contentOffset;
    NSInteger pa = point.x/self.frame.size.width;
    page.currentPage = pa;
}

#pragma mark - 代理方法

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_timer invalidate];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint temp = scrollView.contentOffset;
    
    if (temp.x > self.frame.size.width* (_imageArray.count - 1)  + (self.frame.size.width/5) ) {
        
        _page.currentPage = 0;
        scrollView.contentOffset = CGPointMake(0, 0);
    
    }else {
        NSInteger curentPage1 =
            (scrollView.contentOffset.x + 5)/self.frame.size.width;
        _page.currentPage = curentPage1;
        NSLog(@"%ld",curentPage1);
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self createTimer];

}

- (void)dealloc {
    if (_timer.isValid) {
        [_timer invalidate];
        _timer = nil;
    }

}
@end
