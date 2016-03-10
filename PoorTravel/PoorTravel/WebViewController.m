//
//  WebViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
}
- (void)createWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:
                          
                       self.view.frame];
    
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    [webView loadRequest:request];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    NSLog(@"%@",error);
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始请求");
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
