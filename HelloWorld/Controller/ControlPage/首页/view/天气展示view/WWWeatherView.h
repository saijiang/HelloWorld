//
//  WWWeatherView.h
//  HelloWorld
//
//  Created by sai jiang on 2018/7/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^locationSkip)(void);

@interface WWWeatherView : UIView
-(void)getWeatherStation;
// block 回调
@property(nonatomic,copy) locationSkip skipLocationPage;
@end
