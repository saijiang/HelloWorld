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
//设置图片按钮
+(UIButton *)initButton:(CGRect)rect and:(NSString *)image ImageEdgeInsets:(UIEdgeInsets)rectEdge{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [button setImageEdgeInsets:rectEdge];
    [button setFrame:rect];
    
    return button;
}
//设置文字按钮
+(UIButton *)initCharacterButton:(CGRect)rect and:(NSString *)name and:(CGFloat)fount and:(CGFloat)rount and:(NSString *)color{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:rect];
    [button setTitle:name forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fount];
     unsigned long textColor = strtoul([color UTF8String], 0, 16);
    button.backgroundColor = ColorWithHex(textColor, 1);
    button.clipsToBounds = YES;
    button.layer.cornerRadius = rount;
    
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
  
    label.attributedText = attributeString;
    
    
    return label;
}
#pragma mark textfiled
+(UITextField *)initLeftImageTextFiled:(NSString *)plachorStr and:(CGFloat)fount and:(CGRect)rect and:(NSString *)imageUrl and:(BOOL)issecureText{
    UITextField *field = [[UITextField alloc] init];
    field.placeholder = plachorStr;
    field.frame = rect;
    field.textAlignment = NSTextAlignmentLeft;
    field.borderStyle = UITextBorderStyleRoundedRect;
    //
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, 60, rect.size.height);
//    leftView.backgroundColor = [UIColor redColor];
    UIImage *image = [UIImage imageNamed:imageUrl];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.center = CGPointMake(leftView.frame.size.width / 2, rect.size.height / 2);
    imageView.image = image;
    [leftView addSubview:imageView];
    field.leftView = leftView;
    field.leftViewMode = UITextFieldViewModeAlways;
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.secureTextEntry = issecureText;
    return field;
}
#pragma mark  textfiled no image
+(UITextField *)initNoImageTextFiled:(NSString *)plachorStr andTextFount:(CGFloat)fount and:(CGRect)rect and:(BOOL)issecureText{
    UITextField *field = [[UITextField alloc] init];
    field.placeholder = plachorStr;
    field.frame = rect;
    field.textAlignment = NSTextAlignmentLeft;
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.secureTextEntry = issecureText;
    return field;
}

@end
