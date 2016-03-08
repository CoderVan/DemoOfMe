//
//  IKEAccountTool.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-23.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//
/*** 处理账号  ***/

#import "IKEAccountTool.h"

@implementation IKEAccountTool

+ (void)saveAccount:(IKEAccount *)account
{

    /*** 获得账号存储的时间  ***/
    NSDate *createdTime = [NSDate date];
    account.created_time = createdTime;
    
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"account.archive"];

    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:path];
}

+ (IKEAccount *)account
{
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"account.archive"];
    IKEAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    /*** 验证账号是否过期  ***/
    long long expires_in = [account.expires_in longLongValue];
    NSDate *expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    NSDate *now = [NSDate date];
    NSComparisonResult result = [expiresTime compare:now];
    if (result != NSOrderedDescending ) {//过期
        return nil;
    }
    return account;
}

@end
