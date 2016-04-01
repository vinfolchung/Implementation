//
//  CategoryViewCellModel.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CategoryViewCellModel.h"

@implementation CategoryViewCellModel

- (CGRect)cellFrame{
    return CGRectMake(_cellCenter.x - _cellSize.width / 2.0f, _cellCenter.y - _cellSize.height / 2.0f, _cellSize.width, _cellSize.height);
}

- (CGRect)backEllipseFrame{
    return CGRectMake(_cellCenter.x - _cellSize.width / 2.0f - 5, _cellCenter.y - _cellSize.height / 2.0f - 2, _cellSize.width + 10, _cellSize.height + 4);
}

- (CGFloat)valueRatio{
    return (1 - fabs(_ratio - _index)) <= 0 ? 0 : (1 - fabs(_ratio - _index));
}

@end
