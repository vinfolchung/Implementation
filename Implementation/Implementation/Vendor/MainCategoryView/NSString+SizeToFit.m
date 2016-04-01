//
//  NSString+SizeToFit.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NSString+SizeToFit.h"

@implementation NSString (SizeToFit)

- (CGSize)sizeWithfont:(UIFont *)font maxSize:(CGSize)maxSize{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithAttrs:(NSDictionary *)attrs maxSize:(CGSize)maxSize{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
