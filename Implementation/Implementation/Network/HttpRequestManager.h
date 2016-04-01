//
//  HttpRequestManager.h
//  Implementation
//
//  Created by 钟文锋 on 16/3/28.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonTemplate.h"

typedef NS_ENUM(NSInteger, HttpRequestType) {
    
    //get请求
    HttpRequestTypeGet = 0,
    //post请求
    HttpRequestTypePost
};

@interface HttpRequestManager : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(HttpRequestManager)

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;


/**
 *  发送网络请求
 *
 *  @param URLString   请求的网址字符串
 *  @param parameters  请求的参数
 *  @param type        请求的类型
 *  @param resultBlock 请求的结果
 */
- (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/**
 *  上传图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的信息
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
//- (void)uploadWithURLString:(NSString *)URLString
//                 parameters:(id)parameters
//                uploadParam:(UploadParam *)uploadParam
//                    success:(void (^)())success
//                    failure:(void (^)(NSError *error))failure;





@end
