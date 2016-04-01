//
//  CategoryViewCell.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryViewCellModel;
@class CategoryViewProperty;

@interface CategoryViewCell : UICollectionViewCell

@property (nonatomic, copy) CategoryViewCellModel *model;
@property (nonatomic, strong) CategoryViewProperty *property;

/**如果使用系统的reloadData会重新prepareLayout，在这里是没必要且耗性能的，所以我们自己提供一个刷新状态的方法*/
- (void)updateCell;

@end
