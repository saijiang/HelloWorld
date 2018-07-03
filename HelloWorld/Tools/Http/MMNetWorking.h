//
//  MMNetWorking.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFHTTPSessionManager+Synchronous.h"
typedef void(^profressCallBack)(NSProgress * uploadProgres);
typedef void(^successCallBack)(NSDictionary * dic);
typedef void(^failureCallBack)(NSURLSessionDataTask * task, NSError * error);
@interface MMNetWorking : AFHTTPSessionManager
+ (instancetype)shareNetWorkingTool;

+ (void)postWithUrl:(NSString *) urlString
         Parameters:(id)parameters
           progress:(profressCallBack)progress
            success:(successCallBack)success
            failure:(failureCallBack)failure;

+ (void)getWithUrl:(NSString *) urlString
        Parameters:(id)parameters
          progress:(profressCallBack)progress
           success:(successCallBack)success
           failure:(failureCallBack)failure;
#pragma mark - get & post & 无提示

+ (void)postWithNoRemindUrl:(NSString *) urlString
                 Parameters:(id)parameters
                   progress:(profressCallBack)progress
                    success:(successCallBack)success
                    failure:(failureCallBack)failure;

+ (void)getWithNoRemindUrl:(NSString *)urlString
                Parameters:(id)parameters
                  progress:(profressCallBack)progress
                   success:(successCallBack)success
                   failure:(failureCallBack)failure;

#pragma mark - get & post & 加载动画
+ (void)postLoadAnimationWithUrl:(NSString *) urlString
                      Parameters:(id)parameters
                        progress:(profressCallBack)progress
                         success:(successCallBack)success
                         failure:(failureCallBack)failure;

+ (void)getLoadAnimationWithUrl:(NSString *)urlString
                     Parameters:(id)parameters
                       progress:(profressCallBack)progress
                        success:(successCallBack)success
                        failure:(failureCallBack)failure;

- (void)postWithUrl:(NSString *) urlString
         Parameters:(id)parameters
           progress:(profressCallBack)progress
            success:(successCallBack)success
            failure:(failureCallBack)failure;

- (void)getWithUrl:(NSString *)urlString
        Parameters:(id)parameters
          progress:(profressCallBack)progress
           success:(successCallBack)success
           failure:(failureCallBack)failure;
//网络是否可用
+ (BOOL)netWorkingCanBeUse;

//检查网络状态
+ (void)checkNetworking;
@end
