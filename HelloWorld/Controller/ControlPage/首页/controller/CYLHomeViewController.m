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
#import "UserCommentViewController.h"
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
    
    __weak typeof(self) weakSelf = self;
    
    self.WWeatherView.skipLocationPage = ^{
//        NSLog(@"跳转");
        UserCommentViewController *commentPageController = [[UserCommentViewController alloc] init];
        [weakSelf.navigationController pushViewController:commentPageController animated:YES];
    };
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
    
    
   // 有a、b、c、d 4个异步请求，如何判断a、b、c、d都完成执行？如果需要a、b、c、d顺序执行，该如何实现？
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{ NSLog(@"任务a");});
    dispatch_group_async(group, queue, ^{ NSLog(@"任务b"); });
    dispatch_group_async(group, queue, ^{ NSLog(@"任务c"); });
    dispatch_group_async(group, queue, ^{ NSLog(@"任务d"); });
    dispatch_group_notify(group,dispatch_get_main_queue(), ^{
        // 在a、b、c、d异步执行完成后，会回调这里
        NSLog(@"任务完成后回调！");
    });
    
    // iOS 高效查询数组中是否包含某个特定的元素
    NSArray *gaoxiao = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    [gaoxiao enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"9"]) {
            NSLog(@"第%ld个元素",idx);
        }
    }];
    
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
