//
//  IKETextView.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-6-2.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKETextView : UITextView
/** 占位文字 */
@property (nonatomic,copy) NSString *placeholder;
/** 占位文字颜色 */
@property(nonatomic,strong) UIColor *placeholderColor;

@end
