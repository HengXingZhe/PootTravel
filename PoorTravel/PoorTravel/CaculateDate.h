//
//  CaculateDate.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//此类为工具类


@interface CaculateDate : UIViewController

/**
 *  算时间
 */
+ (NSString*)caculateDataWithSecond:(NSInteger)second;

/**
 *  算高度
 */

+ (CGSize)caculateSizeWithString:(NSString*)text;

@end
