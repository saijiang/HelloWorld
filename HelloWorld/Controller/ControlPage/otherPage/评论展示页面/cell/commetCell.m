//
//  commetCell.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "commetCell.h"
#import "replayCell.h"
@interface commetCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIImageView *image;
@property(nonatomic,strong) YYLabel *name;
@property(nonatomic,strong) UILabel *commentLabel;

@property(nonatomic,strong) UITableView *comTable;
@property(nonatomic,strong) NSArray *comArr;
@end
@implementation commetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

#pragma mark 初始化ui布局
-(void)initUI{
    self.image = [[UIImageView alloc] init];
    self.image.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.image];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.width.height.mas_equalTo(30);
    }];
    self.name = [[YYLabel alloc] init];
    self.name.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
    self.name.preferredMaxLayoutWidth = (WWWIDTH -50);
    [self.contentView addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.image.mas_right).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
       
    }];
    
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.numberOfLines = 0;
    self.commentLabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    self.commentLabel.preferredMaxLayoutWidth = (WWWIDTH -50 - 12);
    [self.contentView addSubview:self.commentLabel];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.name.mas_bottom).offset(5);
        make.left.mas_equalTo(self.name.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
//         make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
    self.comTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.comTable.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
    self.comTable.delegate = self;
    self.comTable.dataSource = self;
    
    //注册cell
    [self.comTable registerClass:[replayCell class] forCellReuseIdentifier:@"replayCell"];
    [self.contentView addSubview:self.comTable];
    [self.comTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.commentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(self.commentLabel.mas_left);
        make.right.mas_equalTo(self.commentLabel.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    self.comTable.scrollEnabled = NO;
}
#pragma mark table delegate
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    replayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"replayCell"];
    [cell fillReplayMessage:self.comArr[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [tableView fd_heightForCellWithIdentifier:@"replayCell" configuration:^(id cell) {
        [cell fillReplayMessage:self.comArr[indexPath.row]];
    }];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.comArr.count;
}
#pragma mark 填充数据
-(void)fillCommentMessage:(CommentModel *)model{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.name.text = model.name;
    self.commentLabel.text = model.comment;
    
    self.comArr = [NSArray arrayWithArray:model.replay];
    
//    CGFloat tableViewHeight = 0;
//    for (NSInteger i = 0; i < self.comArr.count;i++) {
//        tableViewHeight = tableViewHeight + [self.comTable fd_heightForCellWithIdentifier:@"replayCell" configuration:^(replayCell *cell) {
//            [cell fillReplayMessage:self.comArr[i]];
//        }];
//      
//    }
//    
//    [self.comTable mas_updateConstraints:^(MASConstraintMaker *make) {
//
//        make.height.mas_equalTo(tableViewHeight);
//
//    }];
//
//    self.comTable.dataSource = self;
//    self.comTable.delegate = self;
    [self.comTable reloadData];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
