//
//  weatherNewModel.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherNewModel : NSObject
@property(nonatomic,assign) NSInteger cloud;
@property(nonatomic,assign) NSInteger cond_code;
@property(nonatomic,copy) NSString *cond_txt;
@property(nonatomic,copy) NSString *fl;
@property(nonatomic,copy) NSString *pcpn;
@property(nonatomic,copy) NSString *pres;
@property(nonatomic,copy) NSString *tmp;
@property(nonatomic,copy) NSString *vis;
@property(nonatomic,copy) NSString *wind_deg;
@property(nonatomic,copy) NSString *wind_dir;
@property(nonatomic,copy) NSString *wind_sc;
@property(nonatomic,copy) NSString *wind_spd;
/*
 cloud = 25;
 "cond_code" = 103;
 "cond_txt" = "Partly Cloudy";
 fl = "68.0";
 hum = 70;
 pcpn = "0.0";
 pres = 1010;
 tmp = "68.0";
 vis = "25.7";
 "wind_deg" = 300;
 "wind_dir" = NW;
 "wind_sc" = 4;
 "wind_spd" = "45.1";
 */
@end
