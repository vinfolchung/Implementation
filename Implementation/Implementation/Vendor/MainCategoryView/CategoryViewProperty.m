//
//  CategoryViewProperty.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CategoryViewProperty.h"

@implementation CategoryViewProperty

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleFont = [UIFont systemFontOfSize:15*kAdaptPixel];
        _titleColorChangeEnable = YES;
        _titleColor = [UIColor whiteColor];
        _titleSelectColor = [UIColor redColor];
        _itemSpacing = 10*kAdaptPixel;
        _edgeSpacing = 20*kAdaptPixel;
        _scaleRatio = 1.1;
    }
    return self;
}

- (CGFloat)scaleRatio{
    return _scaleEnable ? _scaleRatio : 1.0f;
}

@end
