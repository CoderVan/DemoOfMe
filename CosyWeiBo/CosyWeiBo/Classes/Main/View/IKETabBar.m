//
//  IKETabBar.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-17.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKETabBar.h"

@interface IKETabBar() <IKETabBarDelegate>
@property (nonatomic,weak) UIButton *plusBtn;

@end

@implementation IKETabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        plusBtn.centerX = self.width * 0.5;
        plusBtn.centerY = self.height * 0.5;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        self.plusBtn = plusBtn;
        
        [self addSubview:plusBtn];
    }
    return self;
}

/**
 *  加号点击
 */
- (void)plusClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

/**
 *  重写layoutSubviews 方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    int count = 5;
    CGFloat tabBarButtonW = self.width / 5;
    CGFloat tabBarButtonIndex = 0;
    for (int i = 0; i < count; i++) {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width  = self.width / count;
            child.x = tabBarButtonIndex * tabBarButtonW;
            tabBarButtonIndex++;
            
            if (tabBarButtonIndex == 2) {
                tabBarButtonIndex++;
            }
        }
    }
    
}


@end
