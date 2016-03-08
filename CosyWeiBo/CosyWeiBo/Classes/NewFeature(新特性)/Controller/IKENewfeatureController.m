//
//  IKENewfeatureController.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-17.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKENewfeatureController.h"
#import "IKETabBarController.h"

@interface IKENewfeatureController () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;
@end

@implementation IKENewfeatureController

- (void)viewDidLoad {
  [super viewDidLoad];

  /***创建scrollerView控件***/
  UIScrollView *scrollerView = [[UIScrollView alloc] init];
  scrollerView.frame = self.view.bounds;
  self.scrollView = scrollerView;
  [self.view addSubview:scrollerView];

  CGFloat scrollW = scrollerView.width;
  CGFloat scrollH = scrollerView.height;
  for (int i = 0; i < IKENewfeatureCount; i++) {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.width = scrollW;
    imageView.height = scrollH;
    imageView.y = 0;
    imageView.x = i * scrollW;
    NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
    imageView.image = [UIImage imageNamed:name];
    [scrollerView addSubview:imageView];

    /*** 如果是最后一个imageView，就往里面添加其他内容***/
    if (i == IKENewfeatureCount - 1) {
      [self setupLastImageView:imageView];
    }
  }

  /**设置scrollerView的属性**/
  scrollerView.contentSize =
      CGSizeMake(IKENewfeatureCount * scrollerView.width, 0);
  scrollerView.bounces = NO;                        //去除弹簧效果
  scrollerView.pagingEnabled = YES;                 //分页效果
  scrollerView.showsHorizontalScrollIndicator = NO; //取消水平滚动条
  scrollerView.delegate = self;

  /***添加pageController：分页(不设置宽度，高度，也能显示)***/
  UIPageControl *pageControl = [[UIPageControl alloc] init];
  pageControl.numberOfPages = IKENewfeatureCount;
  pageControl.centerX = scrollW * 0.5;
  pageControl.centerY = scrollH - 30;
  pageControl.currentPageIndicatorTintColor = IKEColor(253, 98, 42);
  pageControl.pageIndicatorTintColor = IKEColor(189, 189, 189);
  pageControl.userInteractionEnabled = NO;
  self.pageControl = pageControl;
  [self.view addSubview:pageControl];
}

/**
 *  scrollView代理方法
 *
 *  @param scrollView 设置pageControl为当前页面
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  double page = scrollView.contentOffset.x / scrollView.width;
  self.pageControl.currentPage = (int)(page + 0.5);
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView {
  // 开启交互功能
  imageView.userInteractionEnabled = YES;

  // 1.分享给大家
  UIButton *shareBtn = [[UIButton alloc] init];
  [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"]
            forState:UIControlStateNormal];
  [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"]
            forState:UIControlStateSelected];
  [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
  [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
  shareBtn.width = 200;
  shareBtn.height = 30;
  shareBtn.centerX = imageView.width * 0.5;
  shareBtn.centerY = imageView.height * 0.65;
  [shareBtn addTarget:self
                action:@selector(shareClick:)
      forControlEvents:UIControlEventTouchUpInside];
  [imageView addSubview:shareBtn];
  shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

  // 2.开始微博
  UIButton *startBtn = [[UIButton alloc] init];
  [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"]
                      forState:UIControlStateNormal];
  [startBtn setBackgroundImage:
                [UIImage imageNamed:@"new_feature_finish_button_highlighted"]
                      forState:UIControlStateHighlighted];
  startBtn.size = startBtn.currentBackgroundImage.size;
  startBtn.centerX = shareBtn.centerX;
  startBtn.centerY = imageView.height * 0.75;
  [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
  [startBtn addTarget:self
                action:@selector(startClick)
      forControlEvents:UIControlEventTouchUpInside];
  [imageView addSubview:startBtn];
}

- (void)shareClick:(UIButton *)shareBtn {
  // 状态取反
  shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick {
  UIWindow *window = [UIApplication sharedApplication].keyWindow;
  window.rootViewController = [[IKETabBarController alloc] init];
}

@end
