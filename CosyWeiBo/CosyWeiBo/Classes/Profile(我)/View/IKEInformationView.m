//
//  IKEInformationView.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-6.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEInformationView.h"
#import "IKEStatus.h"
#import "IKEUser.h"
#import "IKEInformationFrame.h"
#import "IKEToolbarView.h"

@implementation IKEInformationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化个人信息内容
        [self setupView];
    }
    return self;
}


- (void)setupView
{
    /** 个人信息详情整体 */
    UIView *originalView = [[UIView alloc] init];
    originalView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:originalView];
    self.originalView = originalView;
    
    /** 背景图片 */
    UIImageView *bgImageView = [[UIImageView alloc] init];
//    bgImageView.contentMode = UIViewContentModeCenter;
//    bgImageView.backgroundColor = IKERandomColor;
    [originalView addSubview:bgImageView];
    bgImageView.image = [UIImage imageNamed:@"bgImage1.jpg"];
    self.bgImageView = bgImageView;
    
    /** 头像 */
    IKEIconView *iconView = [[IKEIconView alloc] init];
    [originalView addSubview:iconView];
    self.iconView = iconView;
    
    /** 会员图标 */
    UIImageView *vipView = [[UIImageView alloc] init];
    vipView.contentMode = UIViewContentModeCenter;
    [originalView addSubview:vipView];
    self.vipView = vipView;
    
    /** 昵称 */
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.backgroundColor = IKERandomColor;
    nameLabel.text = @"我的微博个人信息";
    nameLabel.font = IKEStatusCellNameFont;
    [bgImageView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /** 工具条 */
    IKEToolbarView *toolbar = [[IKEToolbarView alloc] init];
//    toolbar.backgroundColor = IKERandomColor;
    [originalView addSubview:toolbar];
    self.toolbar = toolbar;

}

- (void)setInformationFrame:(IKEInformationFrame *)informationFrame
{
    _informationFrame = informationFrame;
    
    IKEStatus *status = informationFrame.status;
    IKEUser *user = status.user;
    
    
    /** 原创微博整体 */
    self.originalView.frame = informationFrame.informationViewFrame;
    
    /** 头像 */
    self.iconView.frame = informationFrame.iconViewFrame;
    self.iconView.user = user;
    
    /** 背景图片 */
    self.bgImageView.frame = informationFrame.bgViewFrame;
    
    /** 会员图标 */
    if (user.isVip) {
        self.vipView.hidden = NO;
        
        self.vipView.frame = informationFrame.vipViewFrame;
        NSString *vipName = [NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank];
        self.vipView.image = [UIImage imageNamed:vipName];
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    /** 昵称 */
    self.nameLabel.text = user.name;
    self.nameLabel.frame = informationFrame.nameLabelFrame;
    
    /** 工具条 */
    self.toolbar.frame = informationFrame.toolbarFrame;
    self.toolbar.user = user;

}

@end
