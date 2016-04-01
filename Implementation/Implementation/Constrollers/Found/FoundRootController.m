//
//  FoundRootController.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/31.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "FoundRootController.h"
#import "UserDefaultUtil.h"
#import "BaseNavigationController.h"
#import "CitySearchViewController.h"

@interface FoundRootController()<CitySearchVCDelegate>

@property (nonatomic, strong) UIButton *cityBtn;
@property (nonatomic, strong) BaseNavigationController *citySearchNVC;
@property (nonatomic, strong) CitySearchViewController *citySearchVC;

@end

@implementation FoundRootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.cityBtn];
}

#pragma mark - CitySearchVCDelegate
- (void)selectedCityName
{
    [self.cityBtn setTitle:[UserDefaultUtil getSelectedCityName] forState:UIControlStateNormal];
    [self.cityBtn reloadInputViews];
}

#pragma mark - event respond
- (void)onCityBtn:(id)sender
{
    [self presentViewController:self.citySearchNVC animated:YES completion:nil];
}

#pragma mark - getter and setters
- (UIButton *)cityBtn
{
    if (!_cityBtn) {
        _cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if ([UserDefaultUtil getSelectedCityName] == nil) {
            [self.cityBtn setTitle:@"佛山" forState:UIControlStateNormal];
        }else {
            [self.cityBtn setTitle:[UserDefaultUtil getSelectedCityName] forState:UIControlStateNormal];
        }
        _cityBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        _cityBtn.titleLabel.font = [UIFont systemFontOfSize:16*kAdaptPixel];
        [_cityBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _cityBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_cityBtn setImage:[UIImage imageNamed:@"btn_changeCity"] forState:UIControlStateNormal];
        [_cityBtn addTarget:self action:@selector(onCityBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        _cityBtn.sd_layout
        .xIs(kScreen_Width - 100)
        .topSpaceToView(self.view, 0)
        .heightIs(30)
        .widthIs(100);
    }
    return _cityBtn;
}

- (CitySearchViewController *)citySearchVC
{
    if (!_citySearchVC) {
        _citySearchVC = [[CitySearchViewController alloc] init];
        _citySearchVC.delegate = self;
    }
    return _citySearchVC;
}

- (BaseNavigationController *)citySearchNVC
{
    if (!_citySearchNVC) {
        _citySearchNVC = [[BaseNavigationController alloc] initWithRootViewController:self.citySearchVC];
    }
    return _citySearchNVC;
}


@end
