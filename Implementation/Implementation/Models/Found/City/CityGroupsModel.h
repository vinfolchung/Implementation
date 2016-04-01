//
//  CityGroupsModel.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/10.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityGroupsModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cities;

+ (NSArray *)getCityGroupModelArray;

@end
