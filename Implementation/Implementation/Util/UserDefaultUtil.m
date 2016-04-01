//
//  UserDefaultUtil.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/26.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "UserDefaultUtil.h"

#define Default_SelectedCityName @"default_selectedCityName"

@implementation UserDefaultUtil

/**
 * 获取和保存选择的城市名
 */
+ (NSString *)getSelectedCityName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:Default_SelectedCityName];
}

+ (void)saveSelectedCityName:(NSString *)cityName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:cityName forKey:Default_SelectedCityName];
    [userDefaults synchronize];
}

@end
