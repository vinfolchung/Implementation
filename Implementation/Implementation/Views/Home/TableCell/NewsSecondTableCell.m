//
//  NewsSecondTableCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NewsSecondTableCell.h"

@implementation NewsSecondTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}

-(void)setupLayout{
    //设置约束
    CGFloat margin = 10;
    UIView * contentView = self.contentView;
    
    NSArray * equalSubViews = [NSArray arrayWithObjects:self.imgIcon,self.imgOther1,self.imgOther2,nil];
    self.contentView.sd_equalWidthSubviews = equalSubViews;
    
    self.lblTitle.sd_layout
    .topSpaceToView(contentView,margin)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(21);
    
    self.imgIcon.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);
    
    self.imgOther1.sd_layout
    .leftSpaceToView(self.imgIcon,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);
    
    self.imgOther2.sd_layout
    .leftSpaceToView(self.imgOther1,margin)
    .rightSpaceToView(contentView,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);
    
    self.lineView.sd_layout
    .topSpaceToView(self.imgOther2,margin)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(1);
    
    [self setupAutoHeightWithBottomView:self.lineView bottomMargin:0];
}

- (void)setNewsModel:(NewsModel *)newsModel{
    [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"news_placehoder_image"]];
    self.lblTitle.text = newsModel.title;
    
    // 多图
    ImageExtraModel *imgextra1 = newsModel.imageExtraModel[0];
    ImageExtraModel *imgextra2 = newsModel.imageExtraModel[1];
    [self.imgOther1 sd_setImageWithURL:[NSURL URLWithString:imgextra1.imgsrc] placeholderImage:[UIImage imageNamed:@"news_placehoder_image"]];
    [self.imgOther2 sd_setImageWithURL:[NSURL URLWithString:imgextra2.imgsrc] placeholderImage:[UIImage imageNamed:@"news_placehoder_image"]];
}

@end
