//
//  IKEInformationFrame.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-6.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEInformationFrame.h"
#import "IKEStatus.h"
#import "IKEUser.h"

@implementation IKEInformationFrame

- (void)setStatus:(IKEStatus *)status
{
    _status = status;
    
    IKEUser *user = status.user;
    /** 整体 */
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.informationViewFrame = CGRectMake(0, 0, width, 220);
    
    /** 背景图片*/
    self.bgViewFrame = CGRectMake(0, 0, width, 180);
    
    
    /** 头像 */
    CGFloat iconWH = 50;
    CGFloat iconX = IKEStatusCellBorderW;
    CGFloat iconY = 180-25;
    self.iconViewFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewFrame) + IKEStatusCellBorderW;
    CGFloat nameY = iconY;
//    CGSize nameSize = [user.name sizeWithFont:IKEStatusCellNameFont];
    CGSize nameSize = CGSizeMake(100, 20);
    self.nameLabelFrame = (CGRect){{nameX, nameY}, nameSize};
//    IKLog(@"--%@",self.nameLabelFrame);
    
    /** 会员图标 */
    if (user.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLabelFrame) + IKEStatusCellBorderW;
        CGFloat vipY = nameY;
        CGFloat vipH = nameSize.height;
        CGFloat vipW = 14;
        self.vipViewFrame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 工具条 */
    CGFloat toolX = nameX;
    CGFloat toolY = CGRectGetMaxY(self.nameLabelFrame) + 5;
    CGFloat toolW = width - toolX - IKEStatusCellBorderW;
    CGFloat toolH = 35;
    self.toolbarFrame = CGRectMake(toolX, toolY, toolW, toolH);

}

@end
