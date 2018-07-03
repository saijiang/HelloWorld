//
//  AppDelegate.h
//  HelloWorld
//
//  Created by user on 2018/4/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,copy) NSString *locationName;
@property(nonatomic,assign) CGFloat locationLatitude;//纬度
@property(nonatomic,assign) CGFloat locationLongitude;//经度
@end

