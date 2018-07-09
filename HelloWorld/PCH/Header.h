//
//  Header.h
//  HelloWorld
//
//  Created by user on 2018/4/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#ifndef Header_h
#define Header_h
#import <AFNetworking.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "global.h"
#import <AFNetworking.h>
#import "MMHttpDataManager.h"
#import "WWLocation.h"
#import <YYLabel.h>
#import <Masonry.h>
#import "MJExtension.h"

#define HeWeatherKey @"78bba176a43a4dd4a3fc5590b55542f3"
#define HeWeatherUserName @"HE1807031059001226"
//RGB
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//16进制颜色转换成UIColor
#define ColorWithHex(hex,alph)  [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:(alph)]
#endif /* Header_h */
