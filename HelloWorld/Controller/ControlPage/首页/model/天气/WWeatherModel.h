//
//  WWeatherModel.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "weatherNewModel.h"
#import "weatherBaseModel.h"
#import "weatherUpDataModel.h"
@interface WWeatherModel : NSObject
@property(nonatomic,strong) weatherNewModel *now;
@property(nonatomic,strong) weatherBaseModel *basic;
@property(nonatomic,strong) weatherUpDataModel *update;
@property(nonatomic,copy) NSString *status;

@end
