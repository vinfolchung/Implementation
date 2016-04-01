//
//  NewsTabelViewController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NewsTabelViewController.h"

#import "NewsBaseTableCell.h"
#import "NewsFirstTableCell.h"
#import "NewsSecondTableCell.h"
#import "NewsThirdTabelCell.h"
#import "NewsFourthTableCell.h"

#import "XYString.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface NewsTabelViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MJRefreshComponent *myRefreshView;
@property (nonatomic, assign) NSInteger page;

@end

@implementation NewsTabelViewController
{
    NSMutableArray *_listArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _listArray = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    //[self getNetWorkstate];
}

#pragma mark - 请求数据
-(void)loadData{
    NSString * urlString = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/%ld-20.html",@"headline/T1348647853363",_page];
    //NSLog(@"______%@",urlString);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
        //keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
        NSString *key = [dict.keyEnumerator nextObject];//取键值
        NSArray *temArray = dict[key];
        // 数组>>model数组
        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[NewsModel mj_objectArrayWithKeyValuesArray:temArray]];
        //下拉刷新
        if (_myRefreshView == _tableView.header) {
            _listArray = arrayM;
            _tableView.footer.hidden = _listArray.count == 0 ? YES : NO;
        } else if (_myRefreshView == _tableView.footer) {
            [_listArray addObjectsFromArray:arrayM];
        }
        [self doneWithView:_myRefreshView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
        [_myRefreshView endRefreshing];
    }];
}

#pragma mark - 回调刷新
-(void)doneWithView:(MJRefreshComponent*)refreshView{
    [_tableView reloadData];
    [_myRefreshView  endRefreshing];
}

#pragma mark - 获得网络状态
//- (void)getNetWorkstate{
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"未识别的网络");
//                break;
//                
//            case AFNetworkReachabilityStatusNotReachable:
//            {
//                NSLog(@"不可达的网络(未连接)");
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络不正常" message:@"当前无网络" preferredStyle:UIAlertControllerStyleAlert];
//                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//                [alert addAction:action];
//                [self presentViewController:alert animated:YES completion:nil];
//                break;
//            }
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"2G,3G,4G...的网络");
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"wifi的网络");
//                break;
//            default:
//                break;
//        }
//    }];
//    [manager startMonitoring];
//}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio
{
    return _listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsBaseTableCell *cell = nil;
    NewsModel *newsModel = _listArray[indexPath.row];
    NSString *identifier = [NewsBaseTableCell cellIdentifierForRow:newsModel];
    Class mClass =  NSClassFromString(identifier);
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.newsModel = newsModel;
    //此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅
    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell自适应设置
    NewsModel *newsModel = _listArray[indexPath.row];
    NSString *identifier = [NewsBaseTableCell cellIdentifierForRow:newsModel];
    Class mClass = NSClassFromString(identifier);
    //返回计算出的cell高度
    return [self.tableView cellHeightForIndexPath:indexPath model:newsModel keyPath:@"newsModel" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        __weak typeof(self) weakSelf = self;
        //下拉刷新
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.myRefreshView = weakSelf.tableView.header;
            weakSelf.page = 0;
            [weakSelf loadData];
        }];
        //马上进入刷新状态
        [_tableView.header beginRefreshing];
        //上拉刷新
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            weakSelf.myRefreshView = weakSelf.tableView.footer;
            weakSelf.page = weakSelf.page + 10;
            [weakSelf loadData];
        }];
        _tableView.footer.hidden = YES;
    }
    return _tableView;
}

@end
