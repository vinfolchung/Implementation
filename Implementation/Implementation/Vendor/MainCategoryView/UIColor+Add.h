//
//  UIColor+Add.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/20.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Add)

/**
 *  颜色转RGB
 */
+ (NSArray *)changeColorToRGB:(UIColor *)color;

/**
 *  16进制颜色字符串转UIColor
 *
 *  @param stringToConvert 16进制颜色字符串（如：#FFE326）
 *
 *  @return 对应的UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
/**
 *  插值两种颜色返回中间的颜色
 *
 *  @param from  起始颜色
 *  @param to    终止颜色
 *  @param ratio 插值比例
 *
 *  @return 插值色
 */
+ (UIColor *)colorWithInterpolationFromValue:(UIColor *)from toValue:(UIColor *)to ratio:(CGFloat)ratio;


@end
