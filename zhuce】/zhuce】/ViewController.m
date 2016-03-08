//
//  ViewController.m
//  zhuce】
//
//  Created by CosyVan on 16/3/6.
//  Copyright © 2016年 com.Cosy. All rights reserved.
//

#import "ViewController.h"
#import "FTZCOneController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"aaa" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
}

- (void)clickaddBtn {
    [self.navigationController pushViewController:[[FTZCOneController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
