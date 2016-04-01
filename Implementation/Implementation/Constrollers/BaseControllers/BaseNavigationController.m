//
//  BaseNavigationController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/25.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    [self.navigationBar setBarTintColor:HighlightedColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


@end
