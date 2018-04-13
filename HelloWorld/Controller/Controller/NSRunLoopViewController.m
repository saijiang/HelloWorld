//
//  NSRunLoopViewController.m
//  HelloWorld
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "NSRunLoopViewController.h"

@interface NSRunLoopViewController ()

@end

@implementation NSRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i =0; i < 20; i++) {
        [self.arr addObject:@"测试"];
    }
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(time) userInfo:nil repeats:YES];
   
    //添加定时器到RunLoop中,指定RunLoop运行模式
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//    [self.table reloadData];
    // Do any additional setup after loading the view.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"NSRunLoop";
    return cell;
}
-(void)time{
    NSLog(@"定时器");
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
