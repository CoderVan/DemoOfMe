//
//  IKEDropdownMunu.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-17.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  代理
 */
@class IKEDropdownMenu;
@protocol IKEDropdownMenuDelegate <NSObject>

@optional
- (void)dropdownMenuDidDismiss:(IKEDropdownMenu *)menu;
@end



@interface IKEDropdownMenu : UIView

@property (nonatomic,weak) id<IKEDropdownMenuDelegate> delegate;


+ (instancetype)menu;
/**
 *  显示
 */
- (void)showFrom:(UIView *)from;

/**
 *  销毁
 */
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic,strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

@end
