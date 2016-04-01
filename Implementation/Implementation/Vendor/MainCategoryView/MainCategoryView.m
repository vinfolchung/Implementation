//
//  MainCategoryView.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "MainCategoryView.h"
#import "CategoryViewCellModel.h"
#import "CategoryViewProperty.h"
#import "CategoryViewLayout.h"
#import "CategoryViewCell.h"


@interface MainCategoryView()<UICollectionViewDataSource,UICollectionViewDelegate>
//标题栏collectionview
@property (nonatomic, weak) UICollectionView *mainView;
//下划线
@property (nonatomic, weak) UIView *bottomLine;
//椭圆背景
@property (nonatomic, weak) CAShapeLayer *backEllipse;
//最后选中的itemindex
@property (nonatomic, strong) NSIndexPath *lastIndexPath;
//属性
@property (nonatomic, strong) CategoryViewProperty *property;
//数据模型数组
@property (nonatomic, copy) NSArray *modelArray;
//起始item的数据模型
@property (nonatomic, weak) CategoryViewCellModel *fromModel;
//终止item的数据模型
@property (nonatomic, weak) CategoryViewCellModel *toModel;

@end

@implementation MainCategoryView

- (void)dealloc{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - init methods
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initProperty];
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initProperty];
    [self initUI];
}

- (void)initProperty
{
    //默认的属性
    _scrollWithAnimaitonWhenClicked = YES;
    _clickedAnimationDuration = 0.3;
    _bottomLineColor = [UIColor redColor];
    _bottomLineHeight = 2.0f;
    _bottomLineSpacingFromTitleBottom = 10.0f;
    _backEllipseColor = [UIColor yellowColor];
}

//当标题数组发生改变时
- (void)titlesChanged
{
    //重新初始化模型数组
    [self initModelArray];
    _property.titles = _titles;
    _property.modelArray = _modelArray;
}

/**将titles数据转为模型*/
- (void)initModelArray
{
    if(!_titles.count) {
        return;
    }
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    [_titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        CategoryViewCellModel *model = [[CategoryViewCellModel alloc] init];
        model.title = title;
        model.index = idx;
        [temp addObject:model];
    }];
    _modelArray = temp.copy;
}

- (void)initUI
{
    CategoryViewLayout *catergoryLayout = [CategoryViewLayout new];
    CategoryViewProperty *property = [CategoryViewProperty new];
    _property = property;
    catergoryLayout.property = property;
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:catergoryLayout];
    _mainView = mainView;
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.backgroundColor = self.backgroundColor;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.scrollsToTop = NO;
    [mainView registerClass:[CategoryViewCell class] forCellWithReuseIdentifier:@"CategoryViewCell"];
    [self addSubview:mainView];
    CAShapeLayer * backEllipse = [CAShapeLayer new];
    _backEllipse = backEllipse;
    backEllipse.fillColor = _backEllipseColor.CGColor;
    [mainView.layer addSublayer:_backEllipse];
    UIView *bottomLine = [UIView new];
    _bottomLine = bottomLine;
    bottomLine.backgroundColor = _bottomLineColor;
    [mainView addSubview:bottomLine];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _mainView.frame = self.bounds;
    //初始化各个空间
    NSInteger idx = _lastIndexPath.item;
    [self setNeedUpdateModelWithRatio:idx];
    [self interpolationForBottomLineWithRatio:idx];
    [self interpolationForBackEllipseWithRatio:idx];
    [self interpolationForItemsWithRatio:idx];
}

#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryViewCell" forIndexPath:indexPath];
    cell.property = _property;
    cell.model = _modelArray[indexPath.row];
    [_mainView.layer insertSublayer:_backEllipse atIndex:0];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //当点击相同的item没有反应
    if (_lastIndexPath.item == indexPath.item) {
        return;
    }
    //设置cell的相应属性
    [self interpolationForItemsWithRatio:indexPath.item];
    //动画bottomLine
    [self updateBottomLineWhenClickedWithIndexPath:indexPath];
    //动画backEllipse
    [self updateBackEllipseWhenClickedWithIndexPath:indexPath];
    //滚动到相应位置
    [self scrollToIndexPath:indexPath];
    //通知代理
    if (_delegate && [_delegate respondsToSelector:@selector(catergoryView:didSelectItemAtIndexPath:)]) {
        [_delegate catergoryView:self didSelectItemAtIndexPath:indexPath];
    }
    _lastIndexPath = indexPath;
}

#pragma mark - private methods
/**设置当前需要操作的数据模型*/
- (void)setNeedUpdateModelWithRatio:(CGFloat)ratio
{
    if (!_modelArray.count) return;
    
    _fromModel = _modelArray[(int)ratio];
    
    if ((int)ratio == _modelArray.count - 1) {
        //最后一个item
        _toModel = _fromModel;
    }else {
        _toModel = _modelArray[(int)ratio + 1];
    }
}

/**插值bottomLine*/
- (void)interpolationForBottomLineWithRatio:(CGFloat)ratio
{
    if (!_bottomLineEnable || !_modelArray.count) return;
    
    CGFloat x = [self interpolationFromValue:_fromModel.cellFrame.origin.x toValue:_toModel.cellFrame.origin.x ratio:ratio - (int)ratio];
    CGFloat y = CGRectGetMaxY(_fromModel.cellFrame) + _bottomLineSpacingFromTitleBottom;
    CGFloat width = [self interpolationFromValue:_fromModel.cellFrame.size.width toValue:_toModel.cellFrame.size.width ratio:ratio - (int)ratio];
    CGFloat height = _bottomLineHeight;
    
    _bottomLine.frame = CGRectMake(x, y, width, height);
}

/**插值backEllipse*/
- (void)interpolationForBackEllipseWithRatio:(CGFloat)ratio
{
    if (!_backEllipseEnable || !_modelArray.count) return;
    
    CGFloat x = [self interpolationFromValue:_fromModel.backEllipseFrame.origin.x toValue:_toModel.backEllipseFrame.origin.x ratio:ratio - (int)ratio];
    CGFloat y = _fromModel.backEllipseFrame.origin.y;
    CGFloat width = [self interpolationFromValue:_fromModel.backEllipseFrame.size.width toValue:_toModel.backEllipseFrame.size.width ratio:ratio - (int)ratio];
    CGFloat height = _fromModel.backEllipseFrame.size.height;
    CGFloat cornerRadius = _fromModel.backEllipseFrame.size.height / 2.0f;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, width, height) cornerRadius:cornerRadius];
    _backEllipse.path = path.CGPath;
    [_mainView.layer insertSublayer:_backEllipse atIndex:0];
    
}

/**插值公式*/
- (CGFloat)interpolationFromValue:(CGFloat)from toValue:(CGFloat)to ratio:(CGFloat)ratio
{
    return from + (to - from) * ratio;
}

/**滚动时，刷新item，不使用reloadData，因为会触发prepareLayout，这里没必要，只有titles变了才需要prepareLayout，这里我采用了遍历所有模型修改模型属性，同时遍历可见item，调用自己的刷新方法达到目的且保证重用，并且不会触发prepareLayout，性能更好，大家可自行测试*/

/**处理前后两个item， 更改模型同时刷新item的状态*/
- (void)interpolationForItemsWithRatio:(CGFloat)ratio
{
    for (CategoryViewCellModel *model in _modelArray) {
        model.ratio = ratio;
    }
    for (CategoryViewCell *cell in _mainView.visibleCells) {
        [cell updateCell];
    }
}

- (void)scrollToIndexPath:(NSIndexPath *)indexPath
{
    [_scrollView setContentOffset:CGPointMake(_scrollView.width * indexPath.item, 0) animated:_scrollWithAnimaitonWhenClicked];
    [_mainView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

/**当管理的scrollview滚动时更新*/
- (void)updateWhenScrollViewDidScroll
{
    //拖拽和减速的时候才需要进行update，如果是点击触发的滚动不需要,同时该scrollView需要与初始化传入的scrollView相同
    if (!_scrollView.isDragging && !_scrollView.isDecelerating) {
        return;
    }
    //拖拽比例，根据其进行插值计算
    CGFloat ratio = _scrollView.contentOffset.x / _scrollView.width;
    //到达一个item正位置的时候需要滚动和修正当前的indexPath，这里有个好处，滑动太快，不会调用这个方法，免得滑动太快滚动太频繁
    if ((int)ratio == ratio) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:ratio inSection:0];
        _lastIndexPath = indexPath;
        [_mainView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    //处理边缘情况,因为用户可能开启bounces, 如果越界直接将bottomLine动画到正确位置
    if (ratio <= 0 || ratio >= _modelArray.count - 1) {
        ratio = (int)ratio;
    }
    //先设置需要操作的模型
    [self setNeedUpdateModelWithRatio:ratio];
    //处理bottomLine，对其位置进行插值
    [self interpolationForBottomLineWithRatio:ratio];
    //处理backEllipse，插值
    [self interpolationForBackEllipseWithRatio:ratio];
    //处理前后两个item， 更改模型同时刷新item的状态
    [self interpolationForItemsWithRatio:ratio];
}

/**当点击item时更新下划线*/
- (void)updateBottomLineWhenClickedWithIndexPath:(NSIndexPath *)indexPath
{
    if (!_bottomLineEnable || !_modelArray.count) return;
    
    CategoryViewCellModel *model = _modelArray[indexPath.item];
    [UIView animateWithDuration:_clickedAnimationDuration animations:^{
        _bottomLine.frame = CGRectMake(model.cellFrame.origin.x, _bottomLine.y, model.cellSize.width, _bottomLine.height);
    }];
}

/**当点击item时更新椭圆背景颜色*/
- (void)updateBackEllipseWhenClickedWithIndexPath:(NSIndexPath *)indexPath
{
    if (!_backEllipseEnable || !_modelArray.count) return;
    CategoryViewCellModel *model = _modelArray[indexPath.item];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:model.backEllipseFrame cornerRadius:model.backEllipseFrame.size.width / 2.0f];
    if (_clickedAnimationDuration) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
        anim.duration = 0;
        anim.fromValue = (__bridge id)_backEllipse.path;
        anim.toValue = (__bridge id)path.CGPath;
        [_backEllipse addAnimation:anim forKey:@"pathAnim"];
    }
    _backEllipse.path = path.CGPath;
    [_mainView.layer insertSublayer:_backEllipse atIndex:0];
}

#pragma mark - public methods
- (void)reloadDataForCategoryView
{
    [_scrollView setContentOffset:CGPointZero];
    _lastIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [_mainView reloadData];
}

#pragma mark - KVO
/**监听ScrollView的ContentOffset，一旦滚动就进行插值刷新*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self updateWhenScrollViewDidScroll];
}

#pragma mark - getters and setters

- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    /**设置scrollView后监听其contentOffset*/
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    [self titlesChanged];
}

- (void)setItemSpacing:(CGFloat)itemSpacing
{
    _itemSpacing = itemSpacing;
    _property.itemSpacing = itemSpacing;
}

- (void)setEdgeSpacing:(CGFloat)edgeSpacing{
    _edgeSpacing = edgeSpacing;
    _property.edgeSpacing = edgeSpacing;
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    _property.titleFont = titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    _property.titleColor = titleColor;
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor{
    _titleSelectColor = titleSelectColor;
    _property.titleSelectColor = titleSelectColor;
}

- (void)setTitleColorChangeEnable:(BOOL)titleColorChangeEnable{
    _titleColorChangeEnable = titleColorChangeEnable;
    _property.titleColorChangeEnable = titleColorChangeEnable;
}

- (void)setTitleColorChangeGradually:(BOOL)titleColorChangeGradually{
    _titleColorChangeGradually = titleColorChangeGradually;
    _property.titleColorChangeGradually = titleColorChangeGradually;
}

- (void)setScaleEnable:(BOOL)scaleEnable{
    _scaleEnable = scaleEnable;
    _property.scaleEnable = scaleEnable;
}

- (void)setScaleRatio:(CGFloat)scaleRatio{
    _scaleRatio = scaleRatio;
    _property.scaleRatio = scaleRatio;
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor{
    _bottomLineColor = bottomLineColor;
    _bottomLine.backgroundColor = bottomLineColor;
}

- (void)setBackEllipseColor:(UIColor *)backEllipseColor{
    _backEllipseColor = backEllipseColor;
    _backEllipse.fillColor = backEllipseColor.CGColor;
}


@end
