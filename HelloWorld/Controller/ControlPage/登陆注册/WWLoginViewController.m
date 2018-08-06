//
//  WWLoginViewController.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/10.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWLoginViewController.h"
#import "WWRegiseViewController.h"
@interface WWLoginViewController ()
@property(nonatomic,strong) UIButton *quitePageButton;
@property(nonatomic,strong) UITextField *nameTextField;
@property(nonatomic,strong) UITextField *passWorldTextField;
@property(nonatomic,strong) UIButton *loginButton;
@property(nonatomic,strong) UIButton *regiseButton;
@end

@implementation WWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self quitLoginPage];
    [self initUI];
    // Do any additional setup after loading the view.
}

#pragma mark 退出按钮
-(void)quitLoginPage{
    self.quitePageButton = [UnityPBClass initButton:CGRectMake(0, 0, 30, 30) and:@"icon_close" ImageEdgeInsets:UIEdgeInsetsZero];
    UIBarButtonItem *quiteItem = [[UIBarButtonItem alloc] initWithCustomView:self.quitePageButton];
    self.navigationItem.leftBarButtonItem = quiteItem;
    [self.quitePageButton addTarget:self action:@selector(quiteLoginPageControl) forControlEvents:UIControlEventTouchUpInside];
}
-(void)quiteLoginPageControl{
   [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ui
-(void)initUI{
    self.nameTextField = [UnityPBClass initLeftImageTextFiled:@"用户名" and:12 and:CGRectZero and:@"icon_name" and:NO];
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.height.mas_equalTo(44);
    }];
    
    self.passWorldTextField = [UnityPBClass initLeftImageTextFiled:@"密码" and:12 and:CGRectZero and:@"icon_lockclose" and:YES];
    [self.view addSubview:self.passWorldTextField];
    [self.passWorldTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.nameTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(44);
    }];
    
    self.loginButton = [UnityPBClass initCharacterButton:CGRectZero and:@"登  陆" and:18 and:5 and:@"E6E6FA"];
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(35);
        make.right.mas_equalTo(self.view.mas_right).offset(-35); make.top.mas_equalTo(self.passWorldTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(44);
    }];
    [self.loginButton addTarget:self action:@selector(loginApp) forControlEvents:UIControlEventTouchUpInside];

    self.regiseButton = [UnityPBClass initCharacterButton:CGRectZero and:@"注  册" and:18 and:5 and:@"0000FF"];
    [self.view addSubview:self.regiseButton];
    [self.regiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(35);
        make.right.mas_equalTo(self.view.mas_right).offset(-35); make.top.mas_equalTo(self.loginButton.mas_bottom).offset(20);
        make.height.mas_equalTo(44);
    }];
//    self.regiseButton.alpha = 0; alpha = 0 ～ 0.01 时不会响应点击事件
    [self.regiseButton addTarget:self action:@selector(regiseControllerPage) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 注册页面
-(void)regiseControllerPage{
    WWRegiseViewController *regiseController = [[WWRegiseViewController alloc] init];
    [self.navigationController pushViewController:regiseController animated:YES];
}
#pragma mark 登陆
-(void)loginApp{
    [[WWSaveManageKey initaleManageKey] saveUserAccountID:@"用户accoundid"];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES]; //点击 退出编辑
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
