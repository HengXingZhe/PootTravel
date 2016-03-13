//
//  RightCollectionView.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdeaModel.h"


typedef void (^nextPage)(NSString *url);

@interface RightCollectionView : UICollectionView

@property (nonatomic, strong) IdeaModel *model;

@property (nonatomic, copy) nextPage next;




- (void)setNext:(nextPage)next;


@end
