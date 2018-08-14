//
//  UnityPBClass.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnityPBClass : NSObject
+(UIButton *)initButton:(CGRect)rect and:(NSString *)image ImageEdgeInsets:(UIEdgeInsets)rectEdge;
+(UIButton *)initCharacterButton:(CGRect)rect and:(NSString *)name and:(CGFloat)fount and:(CGFloat)rount and:(NSString *)color;
+(UILabel *)initLabel:(CGRect)rect and:(CGFloat)fount and:(NSString *)str and:(NSTextAlignment)nstxtAli and:(NSString *)color;
+(UITextField *)initLeftImageTextFiled:(NSString *)plachorStr and:(CGFloat)fount and:(CGRect)rect and:(NSString *)imageUrl and:(BOOL)issecureText;
+(UITextField *)initNoImageTextFiled:(NSString *)plachorStr andTextFount:(CGFloat)fount and:(CGRect)rect and:(BOOL)issecureText;
@end
