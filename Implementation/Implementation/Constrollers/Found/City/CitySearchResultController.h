//
//  CitySearchResultController.h
//  Wegou
//
//  Created by 钟文锋 on 16/3/10.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CitySearchResultControllerDelegate;

@interface CitySearchResultController : UIViewController

@property (nonatomic, copy) NSString *searchText;
@property (nonatomic, weak) id<CitySearchResultControllerDelegate> delegate;

@end

@protocol CitySearchResultControllerDelegate <NSObject>
@optional
- (void)didSelectedCell;

@end
