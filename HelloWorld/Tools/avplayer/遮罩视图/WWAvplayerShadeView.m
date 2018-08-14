//
//  WWAvplayerShadeView.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/7.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWAvplayerShadeView.h"
#import "UIImage+image.h"
@interface WWAvplayerShadeView()
{
    UIImageView *_userHeaderImage;
    UIButton * _likeButton;
    UILabel * _likeNumberLabel;
    UIButton * _commentButton;
    UILabel * _commentNumberLabel;
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
    _shareButton = [UnityPBClass initCharacterButton:CGRectZero and:@"分享" and:13 and:5 and:@"bbbbbb"];
    [self addSubview:_shareButton];
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.width.height.mas_equalTo(30);
    }];
    _commentNumberLabel = [UnityPBClass initLabel:CGRectZero and:13 and:@"120" and:NSTextAlignmentCenter and:@"bbbbbb"];
    [self addSubview:_commentNumberLabel];
    [_commentNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareButton.mas_centerX);
        make.bottom.mas_equalTo(_shareButton.mas_top).offset(-20);
    }];
    _commentButton = [UnityPBClass initCharacterButton:CGRectZero and:@"评论" and:13 and:5 and:@"bbbbbb"];
    [self addSubview:_commentButton];
    [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareButton.mas_centerX);
        make.bottom.mas_equalTo(_commentNumberLabel.mas_top).offset(-5);
        make.width.height.mas_equalTo(30);
    }];
    
    _likeNumberLabel = [UnityPBClass initLabel:CGRectZero and:13 and:@"120" and:NSTextAlignmentCenter and:@"bbbbbb"];
    [self addSubview:_likeNumberLabel];
    [_likeNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareButton.mas_centerX);
        make.bottom.mas_equalTo(_commentButton.mas_top).offset(-20);
    }];
    _likeButton = [UnityPBClass initCharacterButton:CGRectZero and:@"点赞" and:13 and:5 and:@"bbbbbb"];
    [self addSubview:_likeButton];
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareButton.mas_centerX);
        make.bottom.mas_equalTo(_likeNumberLabel.mas_top).offset(-5);
        make.width.height.mas_equalTo(30);
    }];
    
    _userHeaderImage = [[UIImageView alloc] init];
    [self addSubview:_userHeaderImage];
    _userHeaderImage.image = [UIImage waterMarkWithImageName:@"100" andMarkImageName:@"加号" andZoomscale:1];
    [_userHeaderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareButton.mas_centerX);
        make.bottom.mas_equalTo(_likeButton.mas_top).offset(-20);
        make.width.height.mas_equalTo(40);
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
