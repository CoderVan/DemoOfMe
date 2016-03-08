//
//  IKEItemTool.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKEItemTool : NSObject
/** 自定义的UIBarButtonItem */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
