//
//  MMHttpDataManager.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "MMHttpDataManager.h"

@implementation MMHttpDataManager
#pragma mark 查询某个城市实况天气状况
+ (void)requestCityWeatherParame:(id)parame success:(successBackBlock) successBlock failure:(failureCallBack)failureBlock{
    [MMNetWorking getWithUrl:CityEarSearchUrl Parameters:parame progress:nil success:successBlock failure:^(NSURLSessionDataTask *task, NSError *error) {
        failureBlock(task,error);
    }];
}
@end
