//
//  NewsFourthTableCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NewsFourthTableCell.h"

@implementation NewsFourthTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}

-(void)setupLayout{
    // 滚动图片区
    self.cycleScrollView = [[SDCycleScrollView alloc] init];
    [self.contentView addSubview:self.cycleScrollView];
    
    //设置约束
    CGFloat margin = 0;
    self.cycleScrollView.sd_layout
    .topSpaceToView(self.contentView,margin)
    .leftSpaceToView(self.contentView,margin)
    .rightSpaceToView(self.contentView,margin)
    .heightIs(175);
    
    [self setupAutoHeightWithBottomView:self.cycleScrollView bottomMargin:0];
}

- (void)setNewsModel:(NewsModel *)newsModel{
    // 获取滚动图片区数据
    NSMutableArray *imagesURLStrings = [NSMutableArray array];
    NSMutableArray *titles = [NSMutableArray array];
    [newsModel.subTitleCellModel enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SubTitleCellModel *sub = (SubTitleCellModel*)obj;
        [imagesURLStrings addObject:sub.imgsrc];
        [titles addObject:sub.title];
    }];
    
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;// 分页控件位置
    self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;// 分页控件风格
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.titlesGroup = titles;
    self.cycleScrollView.localizationImageNamesGroup = @[@"news_head1.jpg",@"news_head2.jpg",@"news_head3.jpg",@"news_head4.jpg",@"news_head5.jpg"];
    self.cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    self.cycleScrollView.placeholderImage = [UIImage imageNamed:@"news_placehoder_image"];
}

@end
