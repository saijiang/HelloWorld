//
//  UIImage+image.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/23.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
#pragma mark  图片添加水印
+ (instancetype)waterMarkWithImageName:(NSString *)backgroundImage andMarkImageName:(NSString *)markName andZoomscale:(CGFloat)scaleZoom{
    
    UIImage *bgImage = [UIImage imageNamed:backgroundImage];
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *waterImage = [UIImage imageNamed:markName];
    CGFloat scale = scaleZoom;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
//    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterX = (bgImage.size.width - waterW) / 2;//居中设置
    CGFloat waterY = bgImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
