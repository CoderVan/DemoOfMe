//
//  IKEtestViewController.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEtestViewController.h"

@interface IKEtestViewController ()

@end

@implementation IKEtestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(80, 150, 60, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
