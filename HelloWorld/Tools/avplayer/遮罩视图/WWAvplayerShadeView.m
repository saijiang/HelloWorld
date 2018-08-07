//
//  WWAvplayerShadeView.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/7.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWAvplayerShadeView.h"

@interface WWAvplayerShadeView()
{
    UIImageView *_userHeaderImage;
    UIButton * _likeButton;
    UILabel * _likeNumberLabel;
    UIButton * _commentButton;
    UIButton * _commentNumberLabel;
    UIButton * _shareButton;
}
@end

@implementation WWAvplayerShadeView

-(instancetype)init{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _shareButton = [UnityPBClass initButton:CGRectZero and:@"" ImageEdgeInsets:UIEdgeInsetsZero];
    [self addSubview:_shareButton];
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.width.height.mas_equalTo(30);
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
