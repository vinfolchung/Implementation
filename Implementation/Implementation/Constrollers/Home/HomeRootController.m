//
//  HomeRootController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "HomeRootController.h"
#import "MainCategoryView.h"
#import "ContentCollectionViewCell.h"

@interface HomeRootController()<UICollectionViewDelegate,UICollectionViewDataSource,MainCategoryViewDelegate>

@property (nonatomic, strong) MainCategoryView *categoryView;
@property (nonatomic, strong) UICollectionView *mainView;

@end

@implementation HomeRootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView
{
    //主要内容滚动视图
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.fullItem = YES;
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.pagingEnabled = YES;
    mainView.scrollsToTop = NO;
    mainView.showsHorizontalScrollIndicator = NO;
    [mainView registerClass:[ContentCollectionViewCell class] forCellWithReuseIdentifier:@"ContentCollectionViewCell"];
    [self.view addSubview:mainView];
    _mainView = mainView;
    
    //类别选择视图
    MainCategoryView *catergoryView = [[MainCategoryView alloc] init];
    catergoryView.titles = @[@"热门",@"推荐",@"科技",@"创投",@"数码",@"技术",@"设计",@"营销"];
    catergoryView.scrollView = mainView;
    catergoryView.delegate = self;
    catergoryView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
    catergoryView.itemSpacing = 20.0f;
    //开启缩放
    catergoryView.scaleEnable = YES;
    catergoryView.titleColorChangeEnable = YES;
    //设置缩放等级
    catergoryView.scaleRatio = 1.2f;
    catergoryView.titleColor = [UIColor darkGrayColor];
    catergoryView.titleSelectColor = HighlightedColor;
    //开启点击item滑动scrollView的动画
    catergoryView.scrollWithAnimaitonWhenClicked = YES;
    [self.view addSubview:catergoryView];
    _mainView = mainView;
    
    mainView.sd_layout
    .leftEqualToView(self.view)
    .topSpaceToView(catergoryView, 0)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
    catergoryView.sd_layout
    .heightIs(30)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view, 64)
    .bottomSpaceToView(self.mainView, 0);

}


#pragma mark - delegate
/**监听item点击*/
- (void)catergoryView:(MainCategoryView *)catergoryView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%zd个item", indexPath.item);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContentCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random() % 255) / 255.0f green:(arc4random() % 255) / 255.0f blue:(arc4random() % 255) / 255.0f alpha:1.0];
    
    return cell;
}


#pragma mark - getters and setters

//- (UICollectionView *)mainView
//{
//    //主collectionView
//    if (!_mainView) {
//        
//    }
//    return _mainView;
//}

//- (MainCategoryView *)categoryView
//{
//    if (!_categoryView) {
//        //catergoryView
//        MainCategoryView *catergoryView = [[MainCategoryView alloc] init];
//        catergoryView.titles = @[@"热门",@"推荐",@"科技",@"创投",@"数码",@"技术",@"设计",@"营销"];
//        catergoryView.scrollView = _mainView;
//        catergoryView.delegate = self;
//        catergoryView.backgroundColor = [UIColor whiteColor];
//        catergoryView.itemSpacing = 20.0f;
//        //开启缩放
//        catergoryView.scaleEnable = YES;
//        catergoryView.titleColorChangeEnable = YES;
//        //设置缩放等级
//        catergoryView.scaleRatio = 1.3f;
//        catergoryView.titleColor = [UIColor darkGrayColor];
//        catergoryView.titleSelectColor = [UIColor redColor];
//        //开启点击item滑动scrollView的动画
//        catergoryView.scrollWithAnimaitonWhenClicked = YES;
//        _categoryView = catergoryView;
//        
//        catergoryView.sd_layout
//        .heightIs(30)
//        .leftEqualToView(self.view)
//        .rightEqualToView(self.view)
//        .topSpaceToView(self.view, 64)
//        .bottomSpaceToView(self.mainView, 1);
//        
//        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
//        layout.minimumInteritemSpacing = layout.minimumLineSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        layout.fullItem = YES;
//        UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//        mainView.backgroundColor = [UIColor whiteColor];
//        mainView.dataSource = self;
//        mainView.delegate = self;
//        mainView.pagingEnabled = YES;
//        mainView.scrollsToTop = NO;
//        mainView.showsHorizontalScrollIndicator = NO;
//        [mainView registerClass:[ContentCollectionViewCell class] forCellWithReuseIdentifier:@"ContentCollectionViewCell"];
//        _mainView = mainView;
//        
//        mainView.sd_layout
//        .leftEqualToView(self.view)
//        .topSpaceToView(catergoryView, 1)
//        .rightEqualToView(self.view)
//        .bottomSpaceToView(self.view, 64);
//
//    }
//    return _categoryView;
//}
//
@end
