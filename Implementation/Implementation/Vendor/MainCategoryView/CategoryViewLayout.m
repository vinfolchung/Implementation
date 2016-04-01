//
//  CategoryViewLayout.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CategoryViewLayout.h"
#import "CategoryViewCellModel.h"
#import "CategoryViewProperty.h"
#import "NSString+SizeToFit.h"

@interface CategoryViewLayout()

@property (nonatomic, copy) NSMutableArray *attrs;
@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic, assign) CGFloat totalTitleWidth;
@property (nonatomic, assign) CGFloat totalCenterX;
@property (nonatomic, assign) BOOL needScroll;
@property (nonatomic, assign) CGFloat realItemSpacing;

@end

@implementation CategoryViewLayout

- (void)prepareLayout
{
    [super prepareLayout];
    _contentWidth = 0;
    _realItemSpacing = _property.itemSpacing;
    //把所有title组合成一个字符串计算所有的文字的宽度
    NSString * allTitles = [_property.titles componentsJoinedByString:@""];
    _totalTitleWidth = [allTitles sizeWithfont:_property.titleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    //计算contentWidth
    _contentWidth = _totalTitleWidth + _property.edgeSpacing * 2 + _realItemSpacing * (_property.modelArray.count - 1);
    //判断是否需要滚动
    _needScroll = _contentWidth > self.collectionView.width;
    //如果不需要滚动，说明如果按用户设置的属性可能无法正确布局，我们自行改变itemSpacing进行均
    if(!_needScroll) {
        _realItemSpacing = (self.collectionView.width - _totalTitleWidth - _property.edgeSpacing*2) / (float)(_property.modelArray.count - 1);
        _contentWidth = self.collectionView.width;
    }
    _totalCenterX = _property.edgeSpacing - _realItemSpacing;
    _attrs = [[NSMutableArray alloc] init];
    //开始计算每个item的属性确定其size和center
    for (int i = 0; i < _property.modelArray.count; i++) {
        [_attrs addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
}

/**根据prepareLayout计算结果返回正确的contentsize*/
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(_contentWidth, self.collectionView.height);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < _attrs.count; i ++) {
        UICollectionViewLayoutAttributes *attr = _attrs[i];
        //判断该item是否和屏幕相交或者包含，满足相交和包含才需要返回，不应该一次返回所有的attrs，虽然可行但是性能不好
        if (CGRectContainsRect(rect, attr.frame) || CGRectIntersectsRect(rect, attr.frame)) {
            [temp addObject:attr];
        }
    }
    return temp.copy;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CategoryViewCellModel *model = _property.modelArray[indexPath.item];
    //计算每个item的size
    CGSize size = [model.title sizeWithfont:_property.titleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    attr.size = size;
    model.cellSize = size;
    //计算每个item的center
    CGFloat centerX = _totalCenterX + _realItemSpacing + size.width / 2.0f;
    _totalCenterX = centerX + size.width / 2.0f;
    CGPoint center = CGPointMake(centerX, self.collectionView.height / 2.0f);
    if (_property.modelArray.count < 2) {
        center = CGPointMake(self.collectionView.width / 2.0f, self.collectionView.height / 2.0f);
    }
    model.cellCenter = center;
    attr.center = center;
    return attr;
}


@end
