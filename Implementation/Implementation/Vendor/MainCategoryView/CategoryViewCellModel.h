//
//  CategoryViewCellModel.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryViewCellModel : NSObject

@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, assign) CGFloat valueRatio;
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, assign) CGPoint cellCenter;
@property (nonatomic, assign,readonly) CGRect cellFrame;
@property (nonatomic, assign, readonly) CGRect backEllipseFrame;

@end
