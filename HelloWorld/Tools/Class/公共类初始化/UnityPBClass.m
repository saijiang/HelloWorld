//
//  UnityPBClass.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "UnityPBClass.h"
#import "NSString+string.h"
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

#pragma mark uilabel
+(UILabel *)initLabel:(CGRect)rect and:(CGFloat)fount and:(NSString *)str and:(NSTextAlignment)nstxtAli and:(NSString *)color{
    UILabel *label = [[UILabel alloc] init];
    label.frame = rect;
    label.textAlignment = nstxtAli;
    label.font = [UIFont systemFontOfSize:fount];
     unsigned long textColor = strtoul([color UTF8String], 0, 16);
    label.textColor = ColorWithHex(textColor, 1);
    label.text = str;
    return label;
}

#pragma mark yylabel
+(YYLabel *)initYYLabel:(CGFloat)width and:(NSString *)str and:(NSString *)color and:(CGFloat)fount and:(NSTextAlignment)nsTextAlignment{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    YYLabel *label = [[YYLabel alloc] init];
    
    
    return label;
}


@end
