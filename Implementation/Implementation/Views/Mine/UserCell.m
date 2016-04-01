//
//  UserCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/4/1.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell
{
    UIImageView *_headImageView;
    UILabel *_nameLabel;
    UILabel *_accountLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *headImageView = [[UIImageView alloc] init];
        headImageView.image = [UIImage imageNamed:@"mine_head"];
        headImageView.sd_cornerRadius = @(10);
        [self.contentView addSubview:headImageView];
        _headImageView = headImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"Vinfol";
        nameLabel.font = [UIFont systemFontOfSize:14*kAdaptPixel];
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        UILabel *accountLabel = [[UILabel alloc] init];
        accountLabel.text = @"账号：vinfolchung";
        accountLabel.font = [UIFont systemFontOfSize:13*kAdaptPixel];
        [self.contentView addSubview:accountLabel];
        _accountLabel = accountLabel;
        
        headImageView.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .centerYIs(self.contentView.height / 2 + 3)
        .widthIs(60)
        .heightIs(60);
        
        nameLabel.sd_layout
        .leftSpaceToView(headImageView, 10)
        .topEqualToView(headImageView)
        .widthIs(200)
        .heightIs(25);
        
        accountLabel.sd_layout
        .topSpaceToView(nameLabel, 2)
        .leftEqualToView(nameLabel)
        .widthIs(200)
        .heightIs(20);
    }
    return self;
}

@end
