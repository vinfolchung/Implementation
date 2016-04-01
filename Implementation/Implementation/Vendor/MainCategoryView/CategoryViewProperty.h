//
//  CategoryViewProperty.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryViewProperty : NSObject

#pragma mark - Data
@property (nonatomic, copy) NSArray *titles;
/**cell模型数据数组*/
@property (nonatomic, copy) NSArray *modelArray;

#pragma mark - item
/**item间距，默认10*/
@property (nonatomic, assign) CGFloat itemSpacing;
/**左右边缘间距，默认20*/
@property (nonatomic, assign) CGFloat edgeSpacing;
/**item字体，默认15*/
@property (nonatomic, strong) UIFont *titleFont;

#pragma mark - titleColor
/**是否开启文字颜色变化效果，默认YES*/
@property (nonatomic, assign) BOOL titleColorChangeEnable;
/**是否开启文字颜色变化渐变，默认NO，如果设置该效果YES需要先保证titleColorChangeEable为YES*/
@property (nonatomic, assign) BOOL titleColorChangeGradually;
/**未选中标题颜色， 默认 白色*/
@property (nonatomic, strong) UIColor *titleColor;
/**被选中标题颜色， 默认 红色*/
@property (nonatomic, strong) UIColor *titleSelectColor;

#pragma mark - scale
/**是否开启缩放， 默认NO*/
@property (nonatomic, assign) BOOL scaleEnable;
/**缩放比例， 默认1.1*/
@property (nonatomic, assign) CGFloat scaleRatio;

@end
