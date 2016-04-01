//
//  NetWorkStateManaget.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/28.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "NetWorkStateManager.h"
#import "AFNetworking.h"

@implementation NetWorkStateManager
SYNTHESIZE_SINGLETON_FOR_CLASS(NetWorkStateManager)

- (void)getNetworkStateWithController:(UIViewController *)controller
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"不可达的网络(未连接)");
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络不正常" message:@"当前无网络" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:action];
                [controller presentViewController:alert animated:YES completion:nil];
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                break;
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

@end
