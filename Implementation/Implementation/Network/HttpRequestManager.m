//
//  HttpRequestManager.m
//  Implementation
//
//  Created by 钟文锋 on 16/3/28.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "HttpRequestManager.h"
#import "AFNetworking.h"

@implementation HttpRequestManager
SYNTHESIZE_SINGLETON_FOR_CLASS(HttpRequestManager)

//- (void)getWithURLString:(NSString *)URLString
//              parameters:(id)parameters
//                 success:(void (^)(id))success
//                 failure:(void (^)(NSError *))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    /**
//     *  可以接受的类型
//     */
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    /**
//     *  请求队列的最大并发数
//     */
//    //    manager.operationQueue.maxConcurrentOperationCount = 5;
//    /**
//     *  请求超时的时间
//     */
//    //    manager.requestSerializer.timeoutInterval = 5;
//    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//- (void)postWithURLString:(NSString *)URLString
//               parameters:(id)parameters
//                  success:(void (^)(id))success
//                  failure:(void (^)(NSError *))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//- (void)requestWithURLString:(NSString *)URLString
//                  parameters:(id)parameters
//                        type:(HttpRequestType)type
//                     success:(void (^)(id))success
//                     failure:(void (^)(NSError *))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    switch (type) {
//        case HttpRequestTypeGet:
//        {
//            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (success) {
//                    success(responseObject);
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//        }
//            break;
//        case HttpRequestTypePost:
//        {
//            [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (success) {
//                    success(responseObject);
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//        }
//            break;
//    }
//}

//- (void)uploadWithURLString:(NSString *)URLString
//                 parameters:(id)parameters
//                uploadParam:(id)uploadParam
//                    success:(void (^)())success
//                    failure:(void (^)(NSError *))failure
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}



@end
