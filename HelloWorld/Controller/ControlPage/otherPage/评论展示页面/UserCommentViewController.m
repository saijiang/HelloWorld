//
//  UserCommentViewController.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "UserCommentViewController.h"
#import "commetCell.h"
#import "CommentModel.h"
@interface UserCommentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) NSArray *arr;
@property(nonatomic,strong) CommentModel *model;
@property(nonatomic,strong) NSMutableArray *modelArr;
@end

@implementation UserCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评论页面展示";
    self.arr = @[@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"起个名字吧",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久十分难受的父母是短发女生的难分难舍的方式对你说的不能告诉对方明明是多方面难受是多方面受到父母说的女生都能发生的发生",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥速度就会发觉说的话封建社会的副驾驶飞机上的黄金时代后果就是倒海翻江水淀粉都是粉色的发货速度回复事件回顾开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"}]},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久",@"replay":@[@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房扫黄打非是粉红色的发生的粉红色的功夫还是短发价快速的减肥开始丹江口市多久"},@{@"name":@"I💗U",@"image":@"http://kuaidao-dev2.oss-cn-beijing.aliyuncs.com/brand/cjwmwwMbCm.jpg",@"comment":@"上课的房是的发生都会发生的发生的粉红色的粉丝都顾不上你的价快速的减肥开始丹江口市多久"}]}];
    self.modelArr = [[NSMutableArray alloc] init];
    for (NSInteger i=0;i < self.arr.count;i++) {//self.arr.count
        NSDictionary *dic  = self.arr[i];
        self.model = [CommentModel fillWithDic:dic];
        [self.modelArr addObject:self.model];
    }
    
    self.table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    //注册cell
    [self.table registerClass:[commetCell class] forCellReuseIdentifier:@"commetCell"];
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
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
    commetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commetCell"];
    [cell fillCommentMessage:self.modelArr[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"commetCell" configuration:^(commetCell *cell) {
        [cell fillCommentMessage:self.modelArr[indexPath.row]];
    }];
//    return [tableView fd_heightForCellWithIdentifier:@"commetCell" cacheByKey:indexPath configuration:^(commetCell *cell) {
//         [cell fillCommentMessage:self.modelArr[indexPath.row]];
//    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
