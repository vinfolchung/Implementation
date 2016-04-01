//
//  FunctionCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/4/1.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "FunctionCell.h"

@implementation FunctionCell
{
    UILabel *_titleLabel;
    UIImageView *_iconImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:17*kAdaptPixel];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        _iconImageView = iconImageView;
        
        iconImageView.sd_layout
        .widthIs(30)
        .heightIs(20)
        .leftSpaceToView(self.contentView, 15)
        .centerYIs(self.contentView.height / 2);
        
        titleLabel.sd_layout
        .widthIs(100)
        .heightIs(30)
        .leftSpaceToView(iconImageView, 20)
        .centerYEqualToView(iconImageView);
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName
{
    _iconImageView.image = [UIImage imageNamed:imageName];
}

@end
