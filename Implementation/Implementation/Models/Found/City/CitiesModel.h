//
//  CitiesModel.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/11.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CitiesModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pinYin;
@property (nonatomic, copy) NSString *pinYinHead;
@property (nonatomic, copy) NSArray *regions;

+ (NSArray *)getCitiesModelArray;

@end
