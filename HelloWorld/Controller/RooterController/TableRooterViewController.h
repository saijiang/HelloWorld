//
//  TableRooterViewController.h
//  HelloWorld
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableRooterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,copy) NSMutableArray *arr;
@end
