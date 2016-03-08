//
//  IKEAppDelegate.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEAppDelegate.h"
#import "IKEHomeViewController.h"
#import "IKEMessageViewController.h"
#import "IKEDiscoverViewController.h"
#import "IKEProfileViewController.h"
#import "IKETabBarController.h"
#import "IKENewfeatureController.h"
#import "IKEOauthController.h"
#import "IKEAccount.h"
#import "MBProgressHUD+MJ.h"
#import "IKEAccountTool.h"
#import "IKEAccount.h"
#import "UIWindow+Extension.h"
#import "SDWebImageManager.h"

@implementation IKEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

//    self.window.rootViewController = [[IKETabBarController alloc] init];
    
    IKEAccount *account = [IKEAccountTool account];

   if (account) { //登陆过
        [self.window switchRootViewConroller];
    
   } else {
       self.window.rootViewController = [[IKEOauthController alloc] init];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
        __block UIBackgroundTaskIdentifier task = [application beginBackgroundTaskWithExpirationHandler:^{
            // 当申请的后台运行时间已经结束（过期），就会调用这个block
            
            // 赶紧结束任务
            [application endBackgroundTask:task];
        }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    /*** 取消下载  ***/
    [mgr cancelAll];
    
    /*** 清除内存中的图片  ***/
    [mgr.imageCache clearMemory];
}


@end
