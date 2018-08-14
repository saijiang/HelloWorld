//
//  playView.h
//  HelloWorld
//
//  Created by sai jiang on 2018/8/8.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface playView : UIView
@property(nonatomic,strong) AVPlayer *player;
@property(nonatomic,strong) AVPlayerItem *playerItem;
@property(nonatomic,strong) AVPlayerLayer *playerLayer;
@end
