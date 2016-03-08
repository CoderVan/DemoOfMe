//
//  ZCTool.h
//  zhuce】
//
//  Created by CosyVan on 16/3/6.
//  Copyright © 2016年 com.Cosy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTool : NSObject
+ (UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder;

+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color;

+(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action;

@end
