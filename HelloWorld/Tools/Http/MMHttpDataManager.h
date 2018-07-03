//
//  MMHttpDataManager.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestUrl.h"
#import "MMNetWorking.h"
typedef void(^successBackBlock)(NSDictionary * dic);
typedef void(^failureBackBlock)(NSURLSessionDataTask * task, NSError * error);
@interface MMHttpDataManager : NSObject
//查询某个城市天气状况
+ (void)requestCityWeatherParame:(id)parame success:(successBackBlock) successBlock failure:(failureCallBack)failureBlock;
@end
