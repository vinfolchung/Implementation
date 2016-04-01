//
//  Implement-prefix.h
//  Implementation
//
//  Created by 钟文锋 on 16/3/25.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#ifndef Implement_prefix_h
#define Implement_prefix_h

#import "UIView+PlaceSize.h"
//自动布局
#import "UIView+SDAutoLayout.h"
#include "UserDefaultUtil.h"


//ios7上移适配，放在controller
#define iOS7Adaptaion() if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0) self.edgesForExtendedLayout = UIRectEdgeNone;

//获得iOS版本
#define kIOSVersions [[[UIDevice currentDevice] systemVersion] floatValue]

// 屏幕的宽、高
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

//  适配屏幕的大小(每一像素所用的宽度）基于i6
#define kAdaptPixeliPhone6 (kScreen_Width / 375.0f)
#define kAdaptPixel (kScreen_Width / 375.0f)

#define HighlightedColor [UIColor colorWithRed:255/255.0 green:137/255.0 blue:117/255.0 alpha:1.0]

//导航条颜色、高度
#define kNavgationColor [UIColor colorWithRed:72/255.0 green:162/255.0 blue:136/255.0 alpha:1.0f]
#define kNavgationHeight 64*kAdaptPixeliPhone6

//比较字符串是否相等（忽略大小写），相等的话返回YES，否则返回NO
#define AnydoorCompareString(thing1, thing2) (thing1 && [thing1 isKindOfClass:[NSString class]] && thing2 && [thing2 isKindOfClass:[NSString class]] && [thing1 compare:thing2 options:NSCaseInsensitiveSearch] == NSOrderedSame)

//自定义颜色
#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* Implement_prefix_h */
