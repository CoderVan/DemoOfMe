//
//  IKEMessageViewController.m
//  CosyWeiBo
//
//  Created by Mac－Van on 15-5-16.
//  Copyright (c) 2015年 MacVan. All rights reserved.
//

#import "IKEMessageViewController.h"
#import "IKESearchBar.h"

@interface IKEMessageViewController ()

@end

@implementation IKEMessageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"消息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(fasixing)];
    /**
     *  实现自定义 搜索框控件
     */
    IKESearchBar *searchBar = [IKESearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30;
    [self.view addSubview:searchBar];
}

- (void)fasixing
{
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    
    return cell;
}




@end
