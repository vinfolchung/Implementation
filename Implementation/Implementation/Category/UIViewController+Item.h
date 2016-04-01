//
//  UIViewController+Item.h
//  Implementation
//
//  Created by 钟文锋 on 16/4/1.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Item)

@property (nonatomic, assign) BOOL isBackBarButtonItem;//是否添加返回按钮
- (void)onBackBarButtonItem:(id)sender;//返回

- (NSString *)setNavigationItemTitle;//设置导航条标题
- (UIBarButtonItem *)setLeftBarButtonItem;//设置导航条左边按钮
- (UIBarButtonItem *)setRightBarButtonItem;//设置导航条右边按钮

@end
