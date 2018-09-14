//
//  otherBaseViewController.m
//  HelloWorld
//
//  Created by sai jiang on 2018/8/22.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "otherBaseViewController.h"

@interface otherBaseViewController ()

@end

@implementation otherBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self nanvitionTitleName];
    // Do any additional setup after loading the view.
}
#pragma mark 设置页面标题
-(void)nanvitionTitleName{
    self.navigationItem.title = self.title;
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
