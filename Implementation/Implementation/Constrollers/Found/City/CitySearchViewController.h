//
//  CitySideViewController.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/9.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "BaseViewController.h"

@protocol CitySearchVCDelegate;

@interface CitySearchViewController : BaseViewController

@property (nonatomic, weak) id<CitySearchVCDelegate> delegate;

@end

@protocol CitySearchVCDelegate <NSObject>
@optional
- (void)selectedCityName;

@end