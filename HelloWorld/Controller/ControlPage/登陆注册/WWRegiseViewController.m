//
//  WWRegiseViewController.m
//  HelloWorld
//
//  Created by sai jiang on 2018/7/13.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "WWRegiseViewController.h"

@interface WWRegiseViewController ()
@property(nonatomic,strong) WWAvplayerShadeView *avplayerShadeView;
@end

@implementation WWRegiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
#pragma mark 视频
-(void)initUI{
    self.avplayerShadeView = [WWUserAccessManager initWWAvplayerShadeViewMasonryAutolouty:CGRectZero];
    [self.view addSubview:self.avplayerShadeView];
    [self.avplayerShadeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(self.view);
    }];
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
