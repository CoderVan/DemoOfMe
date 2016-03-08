//
//  OneCell.m
//  WJFPersonalController
//
//  Created by CosyVan on 16/3/4.
//  Copyright © 2016年 com.Cosy. All rights reserved.
//

#import "OneCell.h"

@implementation OneCell

+(UITableViewCell *)cellWithTableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
