//
//  CommentModel.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

+(instancetype)fillWithDic:(NSDictionary *)dic{
    CommentModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


@end
