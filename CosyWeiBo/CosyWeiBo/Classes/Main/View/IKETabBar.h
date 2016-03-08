//
//  IKETabBar.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-17.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IKETabBar;
@protocol IKETabBarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(IKETabBar *)tabBar;

@end


@interface IKETabBar : UITabBar

@property (nonatomic,weak) id<IKETabBarDelegate> delegate;

@end
