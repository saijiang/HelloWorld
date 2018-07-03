//
//  JJWIFI.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJWIFI : NSObject
+(instancetype)shareWIFI;
-(NSString *)currentWifiSSID;
-(NSString *)localWIFIIPAddress;
@end
