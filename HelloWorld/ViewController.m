//
//  ViewController.m
//  HelloWorld
//
//  Created by user on 2018/4/9.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "ViewController.h"
#import "NSRunLoopViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if TARGET_VERSION == 1
    NSLog(@"1");
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];//获取主线程对应的 runloop对象
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];//获取当前线程对应的runloop对象
    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
    CFRunLoopRef currentRunLoopRef = CFRunLoopGetCurrent();
    NSLog(@"NSRunLoop <--> CFRunloop == %p--%p",CFRunLoopGetMain() , [NSRunLoop mainRunLoop].getCFRunLoop);
#elif TARGET_VERSION == 2
    NSLog(@"2");
#endif
    NSLog(@"%@",Test);

    UIButton *pageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pageButton setTitle:@"page" forState:UIControlStateNormal];
    pageButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:pageButton];
    pageButton.frame = CGRectMake(0, 10, 100, 30);
    [pageButton addTarget:self action:@selector(page) forControlEvents:UIControlEventTouchUpInside];
}
-(void)page{
    NSRunLoopViewController *controller = [[NSRunLoopViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
