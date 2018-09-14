//
//  replayCell.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "replayCell.h"

@interface replayCell()
@property(nonatomic,strong) YYLabel *message;
@end
@implementation replayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

#pragma mark 初始化ui布局
-(void)initUI{
    self.message = [[YYLabel alloc] init];
    self.message.backgroundColor = [UIColor orangeColor];
    self.message.numberOfLines = 0;
    self.message.preferredMaxLayoutWidth = WWWIDTH - 50 - 12 - 24;
    [self.contentView addSubview:self.message];
    [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(1);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-1);
        make.left.mas_equalTo(self.contentView.mas_left).offset(12);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
    }];
}
#pragma mark 数据填充
-(void)fillReplayMessage:(NSDictionary *)dic{
    self.message.text = dic[@"comment"];
}

//-(CGSize)sizeThatFits:(CGSize)size{
//    return CGSizeMake(size.width, [self.message sizeThatFits:size].height + 20);
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
