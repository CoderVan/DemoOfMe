//
//  IKEToolbarView.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-6.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IKEUser;
@interface IKEToolbarView : UIView
+ (instancetype)toolbar;
@property (nonatomic, strong) IKEUser *user;
/** 里面存放所有的按钮 */
@property (nonatomic, strong) NSMutableArray *btns;
/** 里面存放所有的分割线 */
@property (nonatomic, strong) NSMutableArray *dividers;

@property (nonatomic, weak) UIButton *repostBtn;
@property (nonatomic, weak) UIButton *commentBtn;
@property (nonatomic, weak) UIButton *attitudeBtn;

@end
