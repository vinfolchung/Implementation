//
//  CityGroupsModel.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/10.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CityGroupsModel.h"

@implementation CityGroupsModel

#pragma mark - override method
+ (NSArray *)getCityGroupModelArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in plistArray) {
        CityGroupsModel *cityGroupsModel = [[CityGroupsModel alloc] init];
        cityGroupsModel.title = [dict objectForKey:@"title"];
        cityGroupsModel.cities = [dict objectForKey:@"cities"];
        [modelArray addObject:cityGroupsModel];
    }
    return modelArray;
}

@end
