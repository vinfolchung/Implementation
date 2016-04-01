//
//  BaseListViewController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/25.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "BaseListViewController.h"
#import "MJRefresh.h"
#import "ODRefreshControl.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

#define NewPageSize 10
#define NewPageNO 1

@interface BaseListViewController()<UITableViewDataSource,UITableViewDelegate>

//刷新头视图
@property (nonatomic, strong) ODRefreshControl *headerRefreshControl;
//页面cell数量
@property (nonatomic, assign) NSInteger pageSize;

@end

@implementation BaseListViewController
#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pageSize = NewPageSize;
    
    self.headerRefreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    
    [self.headerRefreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.pageSize += NewPageSize;
        [self sendRequest:self.pageSize pageNo:NewPageNO];
    }];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self refresh];
}

#pragma override methods
/**发送请求*/
- (void)sendRequest:(NSInteger)pageSize pageNo:(NSInteger)pageNo
{
    
}

/**停止请求*/
- (void)endRequest
{
    [self.tableView.footer endRefreshing];
    [self.headerRefreshControl endRefreshing];
    [self.tableView reloadData];
}

/**清除列表*/
- (void)clean
{
    self.dataArray = nil;
    [self.tableView reloadData];
}

/**外部刷新*/
- (void)refresh
{
    [self.headerRefreshControl beginRefreshing];
    [self sendRequest:self.pageSize pageNo:NewPageNO];
}

#pragma mark - event respond

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)headerRefreshControl
{
    [self sendRequest:self.pageSize pageNo:NewPageNO];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - getters and setters
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:_tableViewFrame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


@end
