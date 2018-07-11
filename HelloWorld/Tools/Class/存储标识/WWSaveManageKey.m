//
//  WWSaveManageKey.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWSaveManageKey.h"

@implementation WWSaveManageKey
static dispatch_once_t onceTocken;
static WWSaveManageKey *manageKey;

+(instancetype)initaleManageKey{
    _dispatch_once(&onceTocken, ^{
        if (manageKey == nil) {
            manageKey = [[WWSaveManageKey alloc] init];
        }
    });
    return manageKey;
}

#pragma mark 存储用户appid
-(void)saveUserAccountID:(NSString *)AccountID{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:AccountID forKey:@"AccountID"];
    [defaults synchronize];
}
-(NSString *)readUserAccountID{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *appid = [defaults objectForKey:@"AccountID"];
    return appid;
}
//判断用户是否登陆
-(BOOL)judgeUserLogin{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *appid = [defaults objectForKey:@"AccountID"];
    if ([appid length] > 0) {
        return YES;
    }
    return NO;
}
@end
