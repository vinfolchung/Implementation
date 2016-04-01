//
//  NewsBaseTableCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NewsBaseTableCell.h"


@implementation NewsBaseTableCell

// 获取数据类型对应的cell
+ (NSString *)cellIdentifierForRow:(NewsModel *)newsModel{
    
    if (newsModel.hasHead){
        return @"NewsFourthTableCell";
    }else if (newsModel.imgType){
        return @"NewsThirdTabelCell";
    }else if (newsModel.imageExtraModel){
        return @"NewsSecondTableCell";
    }else{
        return @"NewsFirstTableCell";
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgIcon = [UIImageView new];
        [self.contentView addSubview:self.imgIcon];
        
        self.lblTitle = [UILabel new];
        self.lblTitle.font = [UIFont systemFontOfSize:15*kAdaptPixel];
        [self.contentView addSubview:self.lblTitle];
        
        self.lblSubtitle = [UILabel new];
        self.lblSubtitle.textColor = [UIColor grayColor];
        self.lblSubtitle.font = [UIFont systemFontOfSize:13*kAdaptPixel];
        self.lblSubtitle.numberOfLines = 0;
        [self.contentView addSubview:self.lblSubtitle];
        
        self.lineView = [UIView new];
        self.lineView.backgroundColor = CustomColor(238, 238, 238, 1.0);
        [self.contentView addSubview:self.lineView];
        
        self.imgOther1 = [UIImageView new];
        [self.contentView addSubview:self.imgOther1];
        
        self.imgOther2 = [UIImageView new];
        [self.contentView addSubview:self.imgOther2];
    }
    return self;
}

@end
