//
//  WWLocation.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWLocation.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface WWLocation()
{
     AMapLocationManager *_locationManager;
}
@end

@implementation WWLocation
static dispatch_once_t onceToken;
static WWLocation *managerLocation;
+(instancetype)initLocation{
    _dispatch_once(&onceToken, ^{
        if(managerLocation == nil){
            managerLocation = [WWLocation new];
        }
    });
    return managerLocation;
}
-(void)initalizeLocationStation{
    _locationManager = [[AMapLocationManager alloc] init];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    _locationManager.locationTimeout = 2;
    _locationManager.reGeocodeTimeout = 2;
    [_locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error) {
//            NSLog(@"定位失败");
            self.locationCrrentStation(@"定位失败！", 0, 0);
        }
        else{

            self.locationCrrentStation([NSString stringWithFormat:@"%@ %@",regeocode.district,regeocode.street], location.coordinate.latitude, location.coordinate.longitude);
//            [[global shareGlobLocation] saveLocationName:[NSString stringWithFormat:@"%@ %@",regeocode.district,regeocode.street] and:location.coordinate.latitude and:location.coordinate.longitude];
        }
    }];
}

@end
