//
//  weatherNewModel.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherNewModel : NSObject
@property(nonatomic,assign) NSInteger cloud;
@property(nonatomic,assign) NSInteger cond_code;
@property(nonatomic,copy) NSString *fl;
@property(nonatomic,copy) NSString *pcpn;
@property(nonatomic,copy) NSString *tmp;
@property(nonatomic,copy) NSString *vis;
@end
