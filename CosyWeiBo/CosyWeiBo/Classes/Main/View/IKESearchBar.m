//
//  IKESearchBar.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-17.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKESearchBar.h"

@implementation IKESearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.placeholder = @"大家都在搜:奔跑吧兄弟";
        self.font = [UIFont systemFontOfSize:14.0];
        
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;

        
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
