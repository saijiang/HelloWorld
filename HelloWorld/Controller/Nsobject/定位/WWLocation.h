//
//  WWLocation.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^locationBlock)(NSString *location,CGFloat latation,CGFloat longatation);

@interface WWLocation : NSObject
@property(nonatomic,copy) locationBlock locationCrrentStation;

+(instancetype)initLocation;
-(void)initalizeLocationStation;
@end
