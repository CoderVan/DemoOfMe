//
//  ViewController.m
//  WJFPersonalController
//
//  Created by CosyVan on 16/3/3.
//  Copyright © 2016年 com.Cosy. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"
#import "OneCell.h"

#define HeadViewH 200
#define HeadViewMinH 64

#define kIconW 50
#define kIconH 50

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) CGFloat lastOffsetY;

@property (nonatomic, weak)  NSLayoutConstraint *headHCons;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UIImageView *headImage;

@property (nonatomic, weak) UIImageView *iconImage;

@property (nonatomic, assign) CGFloat kHeadImageH;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"===%s",__func__);
    
    
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, 320, 568);
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    // 设置顶部额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(HeadViewH , 0, 0, 0);
    
    self.tableView.contentMode = UIViewContentModeScaleToFill;
    
    [self.view addSubview:tableView];
    
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,-HeadViewH, kScreenWidth, HeadViewH)];
    headImage.image = [UIImage imageNamed:@"lol"];
    self.headImage = headImage;
    [self.tableView addSubview:headImage];
   
    UIImageView *iconImage = [[UIImageView alloc] init];
//    CGSize iconSize =  CGSizeMake(kIconW, kIconH);
    iconImage.frame = CGRectMake(0, 0, kIconW, kIconH);
//    iconImage.center=CGPointMake(_headImage.center.x, _headImage.center.y);
    iconImage.layer.cornerRadius = 25;
    iconImage.image = [UIImage imageNamed:@"timo"];
    self.iconImage = iconImage;
    [self.headImage addSubview:iconImage];
    
   
    
  
}

- (void)loadView
{
    [super loadView];
    
    NSLog(@"===%s",__func__);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setupConfig];
    });
}
- (void)setupConfig
{
    // 不自动添加额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 导航条背景透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _lastOffsetY = -HeadViewH;
    
    
    // 设置导航条中间view
    UILabel *label = [[UILabel alloc] init];
    
    label.font = [UIFont  boldSystemFontOfSize:18];
    
    label.text = @"000000";
    
    [label setTextColor:[UIColor colorWithWhite:1 alpha:0]];
    
    [label sizeToFit];
    
    _titleLabel = label;
    
    
    self.navigationItem.titleView = label;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     NSLog(@"===%s",__func__);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    if (scrollView.contentOffset.y<-HeadViewH) {
        CGFloat offset = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        CGRect frame = _headImage.frame;
        frame.origin.x= - offset /2;
        frame.origin.y= -offset - HeadViewH;
        frame.size.width= _tableView.frame.size.width + offset;
        frame.size.height= HeadViewH +  offset;
        _headImage.frame = frame;
      
    }
    
    // 获取当前偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 获取偏移量差值
    CGFloat delta = offsetY - _lastOffsetY;
    
//    CGFloat headH = HeadViewH - delta;
//    
//    if (headH < HeadViewMinH) {
//        headH = HeadViewMinH;
//    }
//    
//    _headHCons.constant = headH;
    
    // 计算透明度，刚好拖动200 - 64 136，透明度为1
    
    CGFloat alpha = delta / (HeadViewH - HeadViewMinH);
    
    
    // 获取透明颜色
    UIColor *alphaColor = [UIColor colorWithWhite:0 alpha:alpha];
    [_titleLabel setTextColor:alphaColor];
    
    // 设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        if (indexPath.row == 1) {
           cell = [OneCell cellWithTableView:tableView];
        } else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID
                    ];
            cell.backgroundColor = [UIColor orangeColor];
            
            cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        }
       
    }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return 50;
    } else {
        return 44;
    }
    
}

@end
