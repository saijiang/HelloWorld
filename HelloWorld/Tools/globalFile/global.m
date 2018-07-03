//
//  global.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "global.h"
#import "AppDelegate.h"
@implementation global
static dispatch_once_t onceToken;
static global *globalfile;

+(instancetype)shareGlobLocation{
    _dispatch_once(&onceToken, ^{
        if (globalfile == nil) {
            globalfile = [global new];
        }
    });
    return globalfile;
}
//存储
-(void)saveLocationName:(NSString *)name and:(CGFloat)latitude and:(CGFloat)longitude{
    if (name == nil) {
        return;
    }
    else{
        AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        appdelegate.locationName = name;
        appdelegate.locationLatitude = latitude;
        appdelegate.locationLongitude = longitude;
        NSLog(@"%lf \n %lf",latitude,longitude);
    }
}

@end
