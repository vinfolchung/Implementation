//
//  NewsModel.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NewsModel.h"
#import "MJExtension.h"

@implementation NewsModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"imageExtra":@"ImageExtra",
             @"editor":@"Editor",
             @"subTitleCellModel":@"SubTitleCellModel"};
}

@end
