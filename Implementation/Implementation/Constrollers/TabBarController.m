//
//  TabBarController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "TabBarController.h"
#import "HomeRootController.h"
#import "VideoRootController.h"
#import "FoundRootController.h"
#import "MineRootController.h"

@implementation TabBarController
{
    UILabel *_titleLabel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120*kAdaptPixeliPhone6, 40*kAdaptPixeliPhone6)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17.0f*kAdaptPixeliPhone6];
    _titleLabel.text = @"新闻";
    _titleLabel.textColor = [UIColor darkTextColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = _titleLabel;
    
    [self setTabBarItemTitleColor];
    
    HomeRootController *homeRootController = [[HomeRootController alloc] init];
    VideoRootController *videoRootController = [[VideoRootController alloc] init];
    FoundRootController *foundRootController = [[FoundRootController alloc] init];
    MineRootController *mineRootController = [[MineRootController alloc] init];
    
    NSArray *controllerArray = @[homeRootController, videoRootController, foundRootController, mineRootController];
    NSArray *titleArray = @[@"新闻",@"视频",@"发现",@"我的"];
    NSArray *normalIconArray = @[@"tab_news_normal", @"tab_video_normal", @"tab_found_normal", @"tab_me_normal"];
    NSArray *pressedIconArray = @[@"tab_news_highlight", @"tab_video_highlight", @"tab_found_highlight", @"tab_me_highlight"];
    
    [self addChildViewControllers:controllerArray
                           titles:titleArray
                      normalIcons:normalIconArray
                     pressedIcons:pressedIconArray];
}

- (void)setTabBarItemTitleColor {
    //设置Tabbar字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}

- (void)addChildViewControllers:(NSArray*)controllerArray
                         titles:(NSArray*)titleArray
                    normalIcons:(NSArray*)normalIconArray
                   pressedIcons:(NSArray*)pressedIconArray
{
    
    for (int i = 0; i < [controllerArray count]; i++) {
        
        if(i >= [titleArray count] || i >= [normalIconArray count] || i>=[pressedIconArray count]){
            break;
        }
        [self creatChildwithController:controllerArray[i] title:titleArray[i] image:normalIconArray[i] selectedImg:pressedIconArray[i]];
    }
}

- (void)creatChildwithController:(UIViewController *)childvc
                           title:(NSString *)title
                           image:(NSString *)img
                     selectedImg:(NSString *)selectedImg
{
    childvc.tabBarItem.title=title;  // 设置下面的item的文字
    childvc.navigationItem.title=title;  //  设置上面的导航栏的文字
    childvc.tabBarItem.image=[[UIImage imageNamed:img]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childvc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImg]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childvc];
}

#pragma mark UITabBarDelegate
//更换title
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    _titleLabel.text = item.title;
}


@end
