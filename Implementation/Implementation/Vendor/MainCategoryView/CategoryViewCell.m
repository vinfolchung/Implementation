//
//  CategoryViewCell.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/19.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "CategoryViewCell.h"
#import "CategoryViewProperty.h"
#import "CategoryViewCellModel.h"
#import "UIColor+Add.h"

@interface CategoryViewCell()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *colorLabel;
@property (nonatomic, weak) CAShapeLayer *titlemaskLayer;
@property (nonatomic, weak) CAShapeLayer *colormaskLayer;

@end

@implementation CategoryViewCell

#pragma mark - init methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.colorLabel.frame = self.bounds;
}

- (void)initUI
{
    self.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [UILabel new];
    _titleLabel = titleLabel;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    UILabel *colorLabel = [UILabel new];
    colorLabel.textColor = [UIColor orangeColor];
    _colorLabel = colorLabel;
    colorLabel.frame = self.bounds;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:colorLabel];
    CAShapeLayer *titlemaskLayer = [CAShapeLayer new];
    _titlemaskLayer = titlemaskLayer;
    titleLabel.layer.mask = titlemaskLayer;
    CAShapeLayer *colormaskLayer = [CAShapeLayer new];
    _colormaskLayer = colormaskLayer;
    colorLabel.layer.mask = colormaskLayer;
}

#pragma mark - public methods
- (void)updateCell
{
    [self interpolationColor];
    [self interpolationScale];
}

#pragma mark - private methods
/**插值titleColor 颜色的渐变*/
- (void)interpolationColor
{
    CGRect titleMaskRect = CGRectZero;
    CGRect colorMaskRect = CGRectZero;
    if (_property.titleColorChangeEnable) {
        if (_property.titleColorChangeGradually) {
            _colorLabel.hidden = NO;
            if (_model.ratio >= _model.index) {
                titleMaskRect = CGRectMake(0, 0, self.width * (1 - _model.valueRatio), self.height);
                colorMaskRect = CGRectMake(self.width * (1 - _model.valueRatio), 0, self.width * _model.valueRatio, self.height);
            }else{
                titleMaskRect = CGRectMake(self.width * _model.valueRatio, 0, self.width * (1 - _model.valueRatio), self.height);
                colorMaskRect = CGRectMake(0, 0, self.width * _model.valueRatio, self.height);
            }
            _titlemaskLayer.path = [UIBezierPath bezierPathWithRect:titleMaskRect].CGPath;
            _colormaskLayer.path = [UIBezierPath bezierPathWithRect:colorMaskRect].CGPath;
            
        }else{
            _colorLabel.hidden = YES;
            _titleLabel.layer.mask = nil;
            //颜色的插值改变  从两种颜色中得到中间颜色
            _titleLabel.textColor = [UIColor colorWithInterpolationFromValue:_property.titleColor toValue:_property.titleSelectColor ratio:_model.valueRatio];
        }
    }else{
        _colorLabel.hidden = YES;
        _titleLabel.layer.mask = nil;
    }

}

/**插值scale 字体的缩放*/
- (void)interpolationScale
{
    CGFloat scale = [self interpolationFromValue:1 toValue:_property.scaleRatio ratio:_model.valueRatio];
    //不能单单对titleLabel进行transform变换，因为有可能变化后超出cell大小文字显示不全；
    self.transform  = CGAffineTransformMakeScale(scale, scale);

}

/**插值公式*/
- (CGFloat)interpolationFromValue:(CGFloat)from toValue:(CGFloat)to ratio:(CGFloat)ratio{
    return from + (to - from) * ratio;
}


#pragma mark - getter and setter
- (void)setProperty:(CategoryViewProperty *)property
{
    _property = property;
    _colorLabel.font = _titleLabel.font = property.titleFont;
    _titleLabel.textColor = _property.titleColor;
    _colorLabel.textColor = _property.titleSelectColor;
}

- (void)setModel:(CategoryViewCellModel *)model
{
    _model = model;
    _colorLabel.text = _titleLabel.text = _model.title;
    [self updateCell];
}


@end
