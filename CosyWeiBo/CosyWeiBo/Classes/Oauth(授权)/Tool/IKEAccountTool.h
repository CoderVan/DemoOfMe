//
//  IKEAccountTool.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-23.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IKEAccount.h"

@interface IKEAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(IKEAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (IKEAccount *)account;
@end
