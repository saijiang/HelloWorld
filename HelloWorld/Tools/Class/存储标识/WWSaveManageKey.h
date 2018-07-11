//
//  WWSaveManageKey.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWSaveManageKey : NSObject
+(instancetype)initaleManageKey;
//用户ID相关
-(void)saveUserAccountID:(NSString *)AccountID;
-(NSString *)readUserAccountID;
-(BOOL)judgeUserLogin;
@end
