//
//  commetCell.h
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
@interface commetCell : UITableViewCell
-(void)fillCommentMessage:(CommentModel *)model;
@end
