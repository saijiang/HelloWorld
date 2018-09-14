//
//  CommentModel.h
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *image;
@property(nonatomic,copy) NSString *comment;
@property(nonatomic,strong) NSArray *replay;
+(instancetype)fillWithDic:(NSDictionary *)dic;
@end
