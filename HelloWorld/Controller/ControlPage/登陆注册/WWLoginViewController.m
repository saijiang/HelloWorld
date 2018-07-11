//
//  WWLoginViewController.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWLoginViewController.h"

@interface WWLoginViewController ()
@property(nonatomic,strong) UIButton *quitePageButton;
@end

@implementation WWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self quitLoginPage];
    // Do any additional setup after loading the view.
}

#pragma mark 退出按钮
-(void)quitLoginPage{
    self.quitePageButton = [UnityPBClass initButton:CGRectMake(0, 0, 30, 30) and:@"icon_close"];
    UIBarButtonItem *quiteItem = [[UIBarButtonItem alloc] initWithCustomView:self.quitePageButton];
    self.navigationItem.leftBarButtonItem = quiteItem;
    [self.quitePageButton addTarget:self action:@selector(quiteLoginPageControl) forControlEvents:UIControlEventTouchUpInside];
}
-(void)quiteLoginPageControl{
   [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
