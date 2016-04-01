//
//  CitiesModel.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/11.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CitiesModel.h"

@implementation CitiesModel

+ (NSArray *)getCitiesModelArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *citiesModelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in plistArray) {
        CitiesModel *citiesModel = [[CitiesModel alloc] init];
        citiesModel.name = [dict objectForKey:@"name"];
        citiesModel.pinYin = [dict objectForKey:@"pinYin"];
        citiesModel.pinYinHead = [dict objectForKey:@"pinYinHead"];
        citiesModel.regions = [dict objectForKey:@"regions"];
        [citiesModelArray addObject:citiesModel];
    }
    return citiesModelArray;
}

@end
