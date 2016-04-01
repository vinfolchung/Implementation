//
//  ContentCollectionViewCell.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "ContentCollectionViewCell.h"
#import "NewsTabelViewController.h"

@interface ContentCollectionViewCell()

@property (nonatomic, strong) NewsTabelViewController *newsTableViewController;

@end

@implementation ContentCollectionViewCell

#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.newsTableViewController.tableView];
    }
    return self;
}

#pragma mark - getters and setters
- (NewsTabelViewController *)newsTableViewController
{
    if (!_newsTableViewController) {
        _newsTableViewController = [[NewsTabelViewController alloc] init];
        _newsTableViewController.tableView.frame = self.bounds;
    }
    return _newsTableViewController;
}


@end
