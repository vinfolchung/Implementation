//
//  NetWorkStateManaget.h
//  Implementation
//
//  Created by 钟文锋 on 16/3/28.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonTemplate.h"

@interface NetWorkStateManager : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(NetWorkStateManager)

- (void)getNetworkStateWithController:(UIViewController *)controller;

@end
