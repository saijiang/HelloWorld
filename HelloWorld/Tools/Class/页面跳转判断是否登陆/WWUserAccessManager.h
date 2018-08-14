//
//  WWUserAccessManager.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWAvplayerShadeView.h"
@interface WWUserAccessManager : NSObject

+(void) userNextStepJudgeAccessLonginHandle:(void(^)(void))loginHandle normalHandle:(void(^)(void))normalHandle;
+(WWAvplayerShadeView *) initWWAvplayerShadeViewMasonryAutolouty:(CGRect)rect;
@end
