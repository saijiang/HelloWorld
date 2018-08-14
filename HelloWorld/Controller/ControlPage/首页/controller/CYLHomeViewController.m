//
//  CYLHomeViewController.m
//  HelloWorld
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "CYLHomeViewController.h"
#import "JJWIFI.h"
#import "global.h"
#import "WWWeatherView.h"
#import "WWeatherModel.h"
#import "WWRegiseViewController.h"
#import "WWAvplayerShadeView.h"
@interface CYLHomeViewController ()
@property(nonatomic,strong) WWWeatherView *WWeatherView;
@property(nonatomic,strong) WWeatherModel *weatherModel;
@property(nonatomic,strong) WWAvplayerShadeView *shadeView;
@end

@implementation CYLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.WWeatherView];
    [self.WWeatherView getWeatherStation];
     [self.WWeatherView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(self.view.mas_left).offset(10);
         make.right.mas_equalTo(self.view.mas_right).offset(-10);
         make.top.mas_equalTo(self.view.mas_top).offset(64);
         make.height.mas_equalTo(150);
     }];
    __block int a = 0;
    [WWUserAccessManager userNextStepJudgeAccessLonginHandle:nil normalHandle:^{
        NSLog(@"页面跳转");
        a = a + 1;
        NSLog(@"回调%d",a);
    }];
       NSLog(@"后年%d",a);
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"唉!";
    return cell;
}




#pragma mark  wifi
-(void)currentWIFIName{
    [WWLocation initLocation].locationCrrentStation = ^(NSString *location, CGFloat latation, CGFloat longatation) {
        NSString *locationStation = [NSString stringWithFormat:@"%lf,%lf",latation,longatation];
     [MMHttpDataManager requestCityWeatherParame:@{@"location":locationStation,@"key":HeWeatherKey,@"lang":@"en",@"unit":@"i"} success:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
         self.weatherModel = [[WWeatherModel alloc] init];
         [self.weatherModel mj_keyValuesWithKeys:dic[@"HeWeather6"][0]];
 
        
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"失败");
        }];
    };
}

-(WWWeatherView *)WWeatherView{
    if(!_WWeatherView){
        _WWeatherView = [[WWWeatherView alloc] init];
        _WWeatherView.backgroundColor = ColorWithHex(0xfff3dc, 1);
    }
    return _WWeatherView;
}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self navaigationTransparent];//导航栏透明
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [self navaigationOld];//复原导航栏
//    [self.WWeatherView getWeatherStation];
 
}
#pragma mark 设置导航栏透明
-(void)navaigationTransparent{
    UIImage *image = [[UIImage alloc] init];
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    
    [self.navigationController.navigationBar setShadowImage:image];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.translucent = YES;
}
//设置导航栏还原
-(void)navaigationOld{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:nil];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    self.navigationController.navigationBar.translucent = NO;
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
