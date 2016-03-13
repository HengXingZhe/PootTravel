//
//  CaculateDate.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/13.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CaculateDate.h"
#import "Header.h"
@implementation CaculateDate


+ (NSString*)caculateDataWithSecond:(NSInteger)second {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];

    NSString *dataString = [formatter stringFromDate:date];
    return dataString;
}


+ (CGSize)caculateSizeWithString:(NSString*)text {
   
    
    CGFloat with = [UIScreen mainScreen].bounds.size.width;
    
    
   CGSize size = [text boundingRectWithSize:CGSizeMake(with - 20, MAXFLOAT)
                                    options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine
                                 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    return size;
}

@end
