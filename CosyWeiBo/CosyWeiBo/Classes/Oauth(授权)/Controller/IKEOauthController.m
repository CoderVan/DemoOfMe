//
//  IKEOauthController.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-21.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEOauthController.h"
#import "AFNetworking.h"
#import "IKENewfeatureController.h"
#import "IKETabBarController.h"
#import "IKEAccount.h"
#import "MBProgressHUD+MJ.h"
#import "IKEAccountTool.h"
#import "IKEHttpTool.h"

@interface IKEOauthController () <UIWebViewDelegate>

@end

@implementation IKEOauthController


- (void)viewDidLoad
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2015327799&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    /*** 获取URL  ***/
    NSString *url = request.URL.absoluteString;
    /*** 判断是否为回调地址  ***/
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) {
        int index = range.location + range.length;
        NSString *code = [url substringFromIndex:index];
    /*** 利用code换取acessToken ***/
        [self accessTokenWithCode:code];
        
        return NO;
    }
    return YES;
}

#pragma mark - web代理方法
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载网络...^_^"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

/**
 *  利用code（授权成功后的request token）换取一个accessToken
 *
 *  @param code 授权成功后的request token
 */
- (void)accessTokenWithCode:(NSString *)code
{

    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"2015327799";
    params[@"client_secret"] = @"11bb6ac76e99a0fea1d6295d4afdd1b1";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"code"] = code;
    
    [IKEHttpTool post:@"https://api.weibo.com/oauth2/access_token" params:params success:^(id json) {
        
        [MBProgressHUD hideHUD];
        // 将返回的账号字典数据 --> 模型，存进沙盒
        IKEAccount *account = [IKEAccount accountWithDict:json];
        
        /*** 账号存储  ***/
        [IKEAccountTool saveAccount:account];
        
        // 切换窗口的根控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window switchRootViewConroller];
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        IKLog(@"请求失败-%@", error);
    }];
    
}

@end


/**
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 
 [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
 [MBProgressHUD hideHUD];
 
 // 将返回的账号字典数据 --> 模型，存进沙盒
 IKEAccount *account = [IKEAccount accountWithDict:responseObject];
 
 // 账号存储 [IKEAccountTool saveAccount:account];

// 切换窗口的根控制器
UIWindow *window = [UIApplication sharedApplication].keyWindow;
[window switchRootViewConroller];

} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    [MBProgressHUD hideHUD];
}];
 */
