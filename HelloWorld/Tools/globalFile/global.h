//
//  global.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/3.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface global : NSObject
+(instancetype)shareGlobLocation;
-(void)saveLocationName:(NSString *)name and:(CGFloat)latitude and:(CGFloat)longitude;
@end
