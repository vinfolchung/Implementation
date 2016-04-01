//
//  UIViewController+Item.m
//  Implementation
//
//  Created by 钟文锋 on 16/4/1.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "UIViewController+Item.h"

@implementation UIViewController (Item)

- (void)setupNavagationBar
{
    UINavigationItem * navigationItem = [[UINavigationItem alloc] init];
    //标题
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120*kAdaptPixel, 30*kAdaptPixel)];
    label.text = [self setNavigationItemTitle];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:19.0f*kAdaptPixel];
    label.textColor = [UIColor whiteColor];
    
    if (!self.navigationController) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, (44+20)*kAdaptPixel)];
        navigationBar.translucent = NO;
        [navigationBar setBarTintColor:kNavgationColor];
        [navigationBar pushNavigationItem:navigationItem animated:YES];
        navigationItem.titleView = label;
        navigationBar.layer.masksToBounds = YES;
        [self.view addSubview:navigationBar];
    }else {
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setBarTintColor:kNavgationColor];
        self.navigationItem.titleView = label;
    }
    
    //有返回按钮
    if (_isBackBarButtonItem) {
        
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBackBarButtonItem:)];
        backBarButtonItem.tintColor = [UIColor cyanColor];
        
        if (!self.navigationController) {
            navigationItem.leftBarButtonItem = backBarButtonItem;
        } else {
            self.navigationItem.leftBarButtonItem = backBarButtonItem;
        }
        
    } else {
        if (self.navigationController) {
            self.navigationItem.leftBarButtonItem = [self setLeftBarButtonItem];
            self.navigationItem.rightBarButtonItem = [self setRightBarButtonItem];
        }else {
            navigationItem.leftBarButtonItem = [self setLeftBarButtonItem];
            navigationItem.rightBarButtonItem = [self setRightBarButtonItem];
        }
    }
}

- (NSString*)setNavigationItemTitle
{
    return @"";
}
- (UIBarButtonItem *)setLeftBarButtonItem
{
    return nil;
}
- (UIBarButtonItem *)setRightBarButtonItem
{
    return nil;
}

@end
