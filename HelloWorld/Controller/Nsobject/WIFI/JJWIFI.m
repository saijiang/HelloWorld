//
//  JJWIFI.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "JJWIFI.h"
#import <arpa/inet.h>
#import <netdb.h>
#import <net/if.h>
#import <ifaddrs.h>
#import <dlfcn.h>
@interface JJWIFI()

@end

@implementation JJWIFI

static dispatch_once_t onceToken;
static JJWIFI *wifi;

+(instancetype)shareWIFI{
    _dispatch_once(&onceToken, ^{
        if (wifi == nil) {
            wifi = [JJWIFI new];
        }
    });
    return wifi;
}
#pragma mark 获取当前链接Wi-Fi名称
-(NSString *)currentWifiSSID{
#if TARGET_OS_SIMULATOR
        return @"模拟器";
#else
    NSArray *wifis = (__bridge id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in wifis) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    NSString *ssid = [dctySSID objectForKey:@"SSID"] ;
    
    return ssid;
#endif
}
#pragma mark 获取本机ip 地址
-(NSString *)localWIFIIPAddress{
    BOOL success;
    struct ifaddrs * address;
    const struct ifaddrs *cursor;
    success = getifaddrs(&address) == 0;
    if (success) {
        cursor = address;
        while (cursor != NULL) {
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
         freeifaddrs(address);
    }
    return nil;
}
@end
