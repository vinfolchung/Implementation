//
//  CitySearchResultController.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/10.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CitySearchResultController.h"
#import "CitiesModel.h"

@interface CitySearchResultController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *searchResultView;
@property (nonatomic, strong) NSMutableArray *searchResultArray;

@end

@implementation CitySearchResultController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view addSubview:self.searchResultView];
    }
    return self;
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    CitiesModel *cityModel = [self.searchResultArray objectAtIndex:indexPath.row];
    cell.textLabel.text = cityModel.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSelectedCell)]) {
        [self.delegate didSelectedCell];
    }
    CitiesModel *cityModel = [self.searchResultArray objectAtIndex:indexPath.row];
    [UserDefaultUtil saveSelectedCityName:cityModel.name];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - getters and setters
- (UITableView *)searchResultView
{
    if (!_searchResultView) {
        _searchResultView = [[UITableView alloc] initWithFrame:CGRectMake(0, 33*kAdaptPixel, kScreen_Width, kScreen_Height - 33*kAdaptPixel)];
        _searchResultView.delegate = self;
        _searchResultView.dataSource = self;
        _searchResultView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _searchResultView;
}

- (void)setSearchText:(NSString *)searchText
{
    _searchText = [searchText lowercaseString];
    _searchResultArray = [[NSMutableArray alloc] init];
    NSArray *citiesModelArray = [CitiesModel getCitiesModelArray];
    for (CitiesModel *citieModel in citiesModelArray) {
        if ([citieModel.pinYin containsString:self.searchText] || [citieModel.pinYinHead containsString:self.searchText]) {
            [_searchResultArray addObject:citieModel];
        }
    }
    [self.searchResultView reloadData];
}

@end
