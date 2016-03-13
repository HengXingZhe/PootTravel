//
//  LoadNetData.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "LoadNetData.h"
@interface  LoadNetData ()

@property (nonatomic, strong) AFHTTPSessionManager *manage;

@end
@implementation LoadNetData

+ (instancetype)sharedLoadNetData {
    
    static LoadNetData *load = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        load = [[LoadNetData alloc] init];
    
    });
    return load;
}
- (instancetype)init {
    if (self = [super init]) {
        _manage = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)loadNetDataWithUrl:(NSString*)url success:(successed)successed filed:(field)field {
    
    [_manage GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        successed(responseObject);
   
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        field(error);
    }];

}

- (void)laodNetDataByPostUrl:(NSString *)url para:(NSDictionary*)para success:(successed)successed filed:(field)field {
    
    [_manage POST:url parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
        
        successed(responseObject);
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        field(error);
        
    }];

}

@end
