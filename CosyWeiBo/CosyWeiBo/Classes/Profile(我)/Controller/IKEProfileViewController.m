//
//  IKEProfileViewController.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEProfileViewController.h"
#import "IKEtestViewController.h"
#import "IKEInformationView.h"
#import "IKEInformationFrame.h"

const CGFloat IKETopViewH = 180;

@interface IKEProfileViewController ()

@property(nonatomic, weak) IKEInformationView *headView;
/**
 *  微博数组（里面放的都是Status模型，一个Status对象就代表一条微博）
 */
@property(nonatomic, strong) NSMutableArray *statusFrames;
@end

@implementation IKEProfileViewController

- (NSMutableArray *)statusFrames {
    if (!_statusFrames) {
        self.statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"我";
  self.navigationController.navigationBar.backgroundColor =
      [UIColor clearColor];
  //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.navigationItem.rightBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"设置"
                                       style:0
                                      target:self
                                      action:@selector(setting)];
  self.navigationItem.rightBarButtonItem.enabled = NO;

  // 设置内边距(让cell往下移动一段距离)
  self.tableView.contentInset = UIEdgeInsetsMake(IKETopViewH * 0.8, 0, 0, 0);
  CGFloat width = [UIScreen mainScreen].bounds.size.width;
  IKEInformationView *headView = [[IKEInformationView alloc] init];
  IKEInformationFrame *frame = [[IKEInformationFrame alloc] init];
  frame.status = self.status;
  headView.informationFrame = frame;
  headView.frame = CGRectMake(0, -IKETopViewH - 50, width, IKETopViewH);
  headView.contentMode = UIViewContentModeScaleAspectFill;
  [self.tableView insertSubview:headView atIndex:0];
  self.headView = headView;
}
- (void)setting {
  IKEtestViewController *testVc = [[IKEtestViewController alloc] init];
  testVc.title = @"dfafd";
  [self.navigationController pushViewController:testVc animated:YES];
}

#pragma mark - 下拉放大的
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  // 向下拽了多少距离
  CGFloat down = -(IKETopViewH * 0.5) - scrollView.contentOffset.y;
  if (down < 0)
    return;

  CGRect frame = self.headView.frame;
  // 2决定图片变大的速度,值越大,速度越快
  frame.size.height = IKETopViewH + down * 2;
  self.headView.frame = frame;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *ID = @"cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier:ID];
  }

  cell.textLabel.text =
      [NSString stringWithFormat:@"测试数据---%ld", indexPath.row];

  return cell;
}

@end
