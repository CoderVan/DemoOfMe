//
//  FTZCTwoController.m
//  zhuce】
//
//  Created by CosyVan on 16/3/6.
//  Copyright © 2016年 com.Cosy. All rights reserved.
//

#import "FTZCTwoController.h"
#import "SVProgressHUD.h"
#import "ZCTool.h"

@interface FTZCTwoController ()
{
    UIView *bgView;
    UITextField *passward;
}


@end

@implementation FTZCTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"注册2/3";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    [self createTextFields];
}

-(void)createTextFields
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text = @"请设置密码";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 50)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    passward = [ZCTool createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"6-20位字母或数字"];
    passward.clearButtonMode = UITextFieldViewModeWhileEditing;
    passward.secureTextEntry=YES;
    
    UILabel *phonelabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    phonelabel.text=@"密码";
    phonelabel.textColor=[UIColor blackColor];
    phonelabel.textAlignment=NSTextAlignmentLeft;
    phonelabel.font=[UIFont systemFontOfSize:14];
    
    
    UIButton *landBtn = [ZCTool createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"完成" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:passward];
    
    [bgView addSubview:phonelabel];
    [self.view addSubview:landBtn];
}

-(void)landClick
{
        if([passward.text isEqualToString:@""])
        {
            [SVProgressHUD showInfoWithStatus:@"您还未设置密码"];
            return;
        }
        else if (passward.text.length <6)
        {
            [SVProgressHUD showInfoWithStatus:@"亲,密码长度至少六位"];
            return;
        }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
