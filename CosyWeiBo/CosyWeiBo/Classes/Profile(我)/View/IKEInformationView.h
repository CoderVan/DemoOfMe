//
//  IKEInformationView.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-6.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IKEIconView.h"
@class IKEInformationFrame, IKEToolbarView;
@interface IKEInformationView : UIView
@property (nonatomic, strong) IKEInformationFrame *informationFrame;
/** 原创微博整体 */
@property (nonatomic, weak) UIView *originalView;
/** 背景图片 */
@property (nonatomic,weak) UIImageView *bgImageView;
/** 头像 */
@property (nonatomic, weak) IKEIconView *iconView;
/** 会员图标 */
@property (nonatomic, weak) UIImageView *vipView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 工具条 */
@property (nonatomic, weak) IKEToolbarView *toolbar;
@end
