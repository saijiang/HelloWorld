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
@interface CYLHomeViewController ()

@end

@implementation CYLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i =0; i < 100; i++) {
        [self.arr addObject:@""];
    }
    [self currentWIFIName];
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
   NSString *wifi_Name = [[JJWIFI shareWIFI] currentWifiSSID];
    NSString *wifi_ip = [[JJWIFI shareWIFI] localWIFIIPAddress];
    NSLog(@"%@ \n %@",wifi_Name,wifi_ip);
    [MMHttpDataManager requestCityWeatherParame:@{@"location":@"116.469902,40.019879",@"key":HeWeatherKey,@"lang":@"en",@"unit":@"i"} success:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
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
