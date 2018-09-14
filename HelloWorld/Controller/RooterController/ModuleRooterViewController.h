//
//  ModuleRooterViewController.h
//  HelloWorld
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModuleRooterViewController : UIViewController
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,copy) NSMutableArray *arr;
-(void)navaigationTransparent;
-(void)navaigationOld;
@end
