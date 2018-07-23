//
//  UIView+touch.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/23.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (touch)<UIAppearance, UIAppearanceContainer>
@property(nonatomic, assign) BOOL ygExclusiveTouch UI_APPEARANCE_SELECTOR; // default is NO
@end
