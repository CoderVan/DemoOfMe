//
//  IKEProfileViewController.h
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IKEInformationFrame, IKEStatus;
@interface IKEProfileViewController : UITableViewController
@property(nonatomic,strong) IKEInformationFrame *frame;
@property(nonatomic,strong) IKEStatus *status;
@end
