//
//  weatherBaseModel.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherBaseModel : NSObject
@property(nonatomic,strong) NSString *cid;
@property(nonatomic,strong) NSString *cnty;
@property(nonatomic,strong) NSString *lat;
@property(nonatomic,strong) NSString *location;
@property(nonatomic,strong) NSString *lon;
@property(nonatomic,strong) NSString *tz;
/*
 cid = US5327684;
 cnty = "United States";
 lat = "37.87158966";
 location = Berkeley;
 lon = "-122.27275085";
 tz = "-7.00";
 */
@end
