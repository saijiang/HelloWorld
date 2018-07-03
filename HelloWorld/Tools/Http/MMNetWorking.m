//
//  MMNetWorking.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "MMNetWorking.h"

@implementation MMNetWorking
+ (instancetype)shareNetWorkingTool{
    static MMNetWorking * netWorkingTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorkingTool = [[MMNetWorking alloc] init];
        netWorkingTool.requestSerializer = [AFJSONRequestSerializer serializer];
        netWorkingTool.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return netWorkingTool;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
      
    }
    return self;
}
#pragma mark - 设置请求头

- (void)setUpRequestHeader{
    
    // 设置超时时间，afn默认是60s
    self.requestSerializer.timeoutInterval = 30;
    // 响应格式添加text/plain
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    //设置请求头
  
}
#pragma mark - get & post

+ (void)postWithUrl:(NSString *) urlString
         Parameters:(id)parameters
           progress:(profressCallBack)progress
            success:(successCallBack)success
            failure:(failureCallBack)failure{
    
    NSString * networkStatus = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    if ( [networkStatus isEqualToString:@"Not Reachable"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
          
        });
        //        [KDFreshAnimation hideAnimationShow];
     
        /* 1.3.17 版本屏蔽 为了体现加载出错原因
         failure([NSURLSessionDataTask new], [NSError new]);
         return;
         */
    }
    
    [[MMNetWorking shareNetWorkingTool] postWithUrl:urlString Parameters:parameters progress:progress success:success failure:failure];
    
}
+ (void)getWithUrl:(NSString *)urlString
        Parameters:(id)parameters
          progress:(profressCallBack)progress
           success:(successCallBack)success
           failure:(failureCallBack)failure{
    
    NSString * networkStatus = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    if ( [networkStatus isEqualToString:@"Not Reachable"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
         
        });
        //        [KDFreshAnimation hideAnimationShow];
        
        failure([NSURLSessionDataTask new], [NSError new]);
        return;
    }
    
    [[MMNetWorking shareNetWorkingTool] getWithUrl:urlString Parameters:parameters progress:progress success:success failure:failure];
}
#pragma mark - get & post & 无提示

+ (void)postWithNoRemindUrl:(NSString *) urlString
                 Parameters:(id)parameters
                   progress:(profressCallBack)progress
                    success:(successCallBack)success
                    failure:(failureCallBack)failure{
    
    NSString * networkStatus = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    if ( [networkStatus isEqualToString:@"Not Reachable"]) {
        failure([NSURLSessionDataTask new], [NSError new]);
        return;
    }
    
    [[MMNetWorking shareNetWorkingTool] postWithUrl:urlString Parameters:parameters progress:progress success:success failure:failure];
    
}
+ (void)getWithNoRemindUrl:(NSString *)urlString
                Parameters:(id)parameters
                  progress:(profressCallBack)progress
                   success:(successCallBack)success
                   failure:(failureCallBack)failure{
    
    NSString * networkStatus = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    if ( [networkStatus isEqualToString:@"Not Reachable"]) {
        failure([NSURLSessionDataTask new], [NSError new]);
        return;
    }
    
    [[MMNetWorking shareNetWorkingTool] getWithUrl:urlString Parameters:parameters progress:progress success:success failure:failure];
}

#pragma mark - get & post
- (void)postWithUrl:(NSString *) urlString
         Parameters:(id)parameters
           progress:(profressCallBack)progress
            success:(successCallBack)success
            failure:(failureCallBack)failure{
    
    //设置请求头
    [self setUpRequestHeader];
    
    [self POST:urlString parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        success(responseObject);

    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        //通讯协议状态码  response.statusCode
        if (response.statusCode == 401) {
            //服务器返回的业务逻辑报文信息
            NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:nil];
            if (dataDic && [dataDic[@"code"] isEqualToString:@"21802"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alterToLogin" object:@{
                                                                                                    @"remindTitle":dataDic[@"msg"]
                                                                                                    }];
            }
        }
        failure(task, error);
    }];
    
}
- (void)getWithUrl:(NSString *)urlString
        Parameters:(id)parameters
          progress:(profressCallBack)progress
           success:(successCallBack)success
           failure:(failureCallBack)failure{
  
    //设置请求头
    [self setUpRequestHeader];
    [self GET:urlString parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
 
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        //通讯协议状态码  response.statusCode
        if (response.statusCode == 401) {
            //服务器返回的业务逻辑报文信息
            NSDictionary * dataDic = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:nil];
            if (dataDic && [dataDic[@"code"] isEqualToString:@"21802"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alterToLogin" object:@{
                                                                                                    @"remindTitle":dataDic[@"msg"]
                                                                                                    }];
            }
        }
        failure(task, error);
        
    }];
}
#pragma mark - checkNetWork
- (void)isNetWorkingChange{
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"WWAN");
          
            
        }
        else if (status == AFNetworkReachabilityStatusNotReachable){
            //留出无网络状态 这里没有网络也默认成和WIFI 状态下一样
          
        }
        else{
          
            NSLog(@"WIFI");
        }

    }];
    // 开始监听
    [self.reachabilityManager startMonitoring];
}
+ (BOOL)netWorkingCanBeUse{
    //    return [[AFNetworkReachabilityManager  manager] isReachable];
    NSString * networkStatus = [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString];
    if ( [networkStatus isEqualToString:@"Not Reachable"]) {
        return NO;
    }
    return YES;
}

+ (void)checkNetworking{
    [[MMNetWorking shareNetWorkingTool] checkNetworking];
}
- (void)checkNetworking{
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便,在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                NSLog(@"未知网络状态");
                break;
            }
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"无网络");
            
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"蜂窝数据网");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"WiFi网络");
                break;
            }
            default:
                break;
        }
        
    }];
}

@end
