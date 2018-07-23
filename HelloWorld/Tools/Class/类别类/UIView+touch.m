//
//  UIView+touch.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/23.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "UIView+touch.h"
#import <objc/runtime.h>
@implementation UIView (touch)
@dynamic ygExclusiveTouch;

static const void *ygETKeyName = "ygExclusiveTouch";

#pragma mark - BOOL类型的动态绑定
/*
 1、当一个页面中存在两个以上可点击的响应区域时，基本都存在“同时”点击，分别“同时”响应的问题，尤其是响应事件分别为弹出窗口或跳转到另一个页面时，窗口存在重叠效果，最为突出。
 
 2、当主线程被阻塞时，单个响应区域的重复点，会造成重复响应，如一个页面被Push了多次。
 */
- (BOOL)ygExclusiveTouch
{
    return [objc_getAssociatedObject(self, ygETKeyName) boolValue];
}

- (void)setYgExclusiveTouch:(BOOL)ygExclusiveTouch
{
    self.exclusiveTouch = ygExclusiveTouch;
    objc_setAssociatedObject(self, ygETKeyName, [NSNumber numberWithBool:ygExclusiveTouch], OBJC_ASSOCIATION_ASSIGN);
}
@end
