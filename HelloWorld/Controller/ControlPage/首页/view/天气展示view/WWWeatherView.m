//
//  WWWeatherView.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWWeatherView.h"

@interface WWWeatherView()
{
    UIImageView *_loctationImage;//定位图标
    UILabel *_streeName;//当前位置
    YYLabel *_sayLabel;//今日天气
    YYLabel *_currentWeatherLabel;//当前天气状态
    UILabel *_weatherSayLabel;//天气状况说明
}
@end

@implementation WWWeatherView

-(instancetype)init{
    if(self = [super init]){
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _loctationImage = [[UIImageView alloc] init];
    _loctationImage.image = [UIImage imageNamed:@"dizhi"];
    [self addSubview:_loctationImage];
    [_loctationImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self.mas_left).offset(10);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
