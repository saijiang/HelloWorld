//
//  UIImage+image.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/23.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
+ (instancetype)waterMarkWithImageName:(NSString *)backgroundImage andMarkImageName:(NSString *)markName andZoomscale:(CGFloat)scaleZoom;
@end
