//
//  NSString+SizeToFit.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SizeToFit)

/**
 *  根据字符串返回自适应的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大限制尺寸
 *
 *  @return 自适应后的尺寸
 */
- (CGSize)sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  根据字符串返回自适应的尺寸,用于计算属性字符串
 *
 *  @param attrs   属性
 *  @param maxSize 最大限制尺寸
 *
 *  @return 自适应后的尺寸
 */

- (CGSize)sizeWithAttrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize;



@end
