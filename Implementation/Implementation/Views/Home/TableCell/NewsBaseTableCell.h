//
//  NewsBaseTableCell.h
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "UIImageView+WebCache.h"
#import "NewsModel.h"

@interface NewsBaseTableCell : UITableViewCell<SDCycleScrollViewDelegate>

/**
 *  图片
 */
@property (strong, nonatomic) UIImageView *imgIcon;

/**
 *  标题
 */
@property (strong, nonatomic) UILabel *lblTitle;

/**
 *  描述
 */
@property (strong, nonatomic) UILabel *lblSubtitle;

/**
 *  第二张图片（如果有的话）
 */
@property (strong, nonatomic) UIImageView *imgOther1;

/**
 *  第三张图片（如果有的话）
 */
@property (strong, nonatomic) UIImageView *imgOther2;

/**
 *  底部分界线
 */
@property (strong, nonatomic) UIView *lineView;

/**
 *  滚动图片区
 */
@property(nonatomic ,strong) SDCycleScrollView *cycleScrollView;

// 数据模型
@property(nonatomic ,strong) NewsModel * newsModel;

/**
 *  返回cell的类型
 */
+ (NSString *)cellIdentifierForRow:(NewsModel *)newsModel;

@end
