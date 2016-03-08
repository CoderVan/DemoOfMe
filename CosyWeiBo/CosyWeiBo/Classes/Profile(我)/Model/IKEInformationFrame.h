//
//  IKEInformationFrame.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-6.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IKEStatus;
@interface IKEInformationFrame : NSObject
@property (nonatomic, strong) IKEStatus *status;

/** 个人信息整体 */
@property (nonatomic, assign) CGRect informationViewFrame;
/** 背景图片 */
@property (nonatomic, assign) CGRect bgViewFrame;
/** 头像 */
@property (nonatomic, assign) CGRect iconViewFrame;
/** 会员图标 */
@property (nonatomic, assign) CGRect vipViewFrame;
/** 昵称 */
@property (nonatomic, assign) CGRect nameLabelFrame;
/** 工具条 */
@property (nonatomic, assign) CGRect toolbarFrame;
@end
