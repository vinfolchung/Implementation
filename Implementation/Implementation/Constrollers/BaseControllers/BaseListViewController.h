//
//  BaseListViewController.h
//  Implementation
//
//  Created by 钟文锋 on 16/3/25.
//  Copyright © 2016年 vinfol. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BaseListViewController : UIViewController

//数组源
@property (nonatomic, copy) NSArray *dataArray;
//列表视图
@property (nonatomic, strong) UITableView *tableView;
//tableview的frame
@property (nonatomic, assign) CGRect tableViewFrame;


//tableview数据填充
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


//发送请求
- (void)sendRequest:(NSInteger)pageSize pageNo:(NSInteger)pageNo;
//结束请求
- (void)endRequest;

//清除列表
- (void)clean;
//外部刷新
- (void)refresh;

@end
