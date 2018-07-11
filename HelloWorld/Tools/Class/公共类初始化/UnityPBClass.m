//
//  UnityPBClass.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "UnityPBClass.h"

@implementation UnityPBClass
static UnityPBClass *unityObject = nil;
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
+(UnityPBClass *)shareUnityClassObject{
    if (unityObject == nil) {
        unityObject = [[UnityPBClass alloc] init];
        
    }
    return unityObject;
}
#pragma mark button
+(UIButton *)initButton:(CGRect)rect and:(NSString *)image{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setFrame:rect];
    return button;
}
@end
