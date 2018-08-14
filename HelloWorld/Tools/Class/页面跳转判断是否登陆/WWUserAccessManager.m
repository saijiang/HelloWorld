//
//  WWUserAccessManager.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWUserAccessManager.h"
#import "WWLoginViewController.h"
#import "CYLTabBarControllerConfig.h"
#import "AppDelegate.h"

@implementation WWUserAccessManager
+(void) userNextStepJudgeAccessLonginHandle:(void(^)(void))loginHandle normalHandle:(void(^)(void))normalHandle{
    if ([[WWSaveManageKey initaleManageKey] judgeUserLogin]) {
        if (normalHandle) {
            normalHandle();
        }
    }
    else{
        if (loginHandle) {
            loginHandle();
        }
        else{
            WWLoginViewController *loginController = [[WWLoginViewController alloc] init];
            UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:loginController];
            AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appdelegate.window.rootViewController presentViewController:controller animated:YES completion:nil];
            
        }
    }
}

#pragma mark 遮罩层
+(WWAvplayerShadeView *) initWWAvplayerShadeViewMasonryAutolouty:(CGRect)rect{
    WWAvplayerShadeView *view = [[WWAvplayerShadeView alloc] init];
    view.frame = rect;
    return view;
}


@end
