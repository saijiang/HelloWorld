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
    UILabel *_sayLabel;//今日天气
    UILabel *_currentWeatherLabel;//当前天气状态
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
    
    _streeName = [UnityPBClass initLabel:CGRectZero and:12 and:@"" and:NSTextAlignmentCenter and:@"DA70D6"];
    [self addSubview:_streeName];
    [_streeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_loctationImage.mas_right).offset(5);
        make.centerY.mas_equalTo(_loctationImage.mas_centerY);
    }];
    
    _sayLabel = [UnityPBClass initLabel:CGRectZero and:12 and:@"今日天气" and:NSTextAlignmentCenter and:@"0000FF"];
    [self addSubview:_sayLabel];
    [_sayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_loctationImage.mas_left);
        make.top.mas_equalTo(_loctationImage.mas_bottom).offset(15);
    }];
    
    _currentWeatherLabel = [UnityPBClass initLabel:CGRectZero and:15 and:@"" and:NSTextAlignmentCenter and:@"2E8B57"];
    [self addSubview:_currentWeatherLabel];
    [_currentWeatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_sayLabel.mas_centerY);
        make.left.mas_equalTo(_sayLabel.mas_right).offset(5);
    }];
    
    _weatherSayLabel = [UnityPBClass initLabel:CGRectZero and:13 and:@"" and:NSTextAlignmentCenter and:@"2E8B57"];
    [self addSubview:_weatherSayLabel];
    [_weatherSayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_currentWeatherLabel.mas_centerY);
        make.left.mas_equalTo(_currentWeatherLabel.mas_right).offset(5);
    }];
    
    
}

#pragma mark 天气情况
-(void)getWeatherStation{
    [WWLocation initLocation].locationCrrentStation = ^(NSString *location, CGFloat latation, CGFloat longatation) {
        NSString *locationStation = [NSString stringWithFormat:@"%lf,%lf",latation,longatation];
        [MMHttpDataManager requestCityWeatherParame:@{@"location":locationStation,@"key":HeWeatherKey,@"lang":@"en",@"unit":@"i"} success:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
            _streeName.text = location;
            _currentWeatherLabel.text = dic[@"HeWeather6"][0][@"now"][@"tmp"];
            _weatherSayLabel.text = [NSString stringWithFormat:@"%@ %@风",dic[@"HeWeather6"][0][@"now"][@"cond_txt"],dic[@"HeWeather6"][0][@"now"][@"wind_dir"]];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"失败");
        }];
    };
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
