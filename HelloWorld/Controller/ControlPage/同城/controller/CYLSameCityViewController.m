//
//  CYLSameCityViewController.m
//  HelloWorld
//
//  Created by user on 2018/4/11.
//  Copyright © 2018年 KDSJ. All rights reserved.
//

#import "CYLSameCityViewController.h"

@interface CYLSameCityViewController ()<GCDAsyncSocketDelegate>
@property(nonatomic,strong) UITextField *partFiled;
@property(nonatomic,strong) UITextField *messageFiled;
@property(nonatomic,strong) UIButton *sendMessageButton;
@property(nonatomic,strong) UITextView *reachMessageText;
@property(nonatomic,strong) GCDAsyncSocket *clientSocket;
@end

@implementation CYLSameCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self socketAsyon];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    UILabel *partLabel = [UnityPBClass initLabel:CGRectZero and:15 and:@"端口" and:NSTextAlignmentCenter and:@"191970"];
    [self.view addSubview:partLabel];
    [partLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    self.partFiled = [UnityPBClass initLeftImageTextFiled:@"端口号" and:15 and:CGRectZero and:@"" and:NO];
    [self.view addSubview:self.partFiled];
    [self.partFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(partLabel.mas_right).offset(10);
        make.centerY.mas_equalTo(partLabel.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    
    self.messageFiled = [UnityPBClass initNoImageTextFiled:@"输入信息" andTextFount:15 and:CGRectZero and:NO];
    [self.view addSubview:self.messageFiled];
    [self.messageFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.partFiled.mas_bottom).offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    
    self.sendMessageButton = [UnityPBClass initCharacterButton:CGRectZero and:@"发送" and:15 and:2 and:@"191970"];
    [self.view addSubview:self.sendMessageButton];
    [self.sendMessageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.messageFiled.mas_right).offset(20);
        make.centerY.mas_equalTo(self.messageFiled.mas_centerY);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    [self.sendMessageButton addTarget:self action:@selector(stocekSendMessage) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.reachMessageText = [[UITextView alloc] initWithFrame:CGRectZero];
    self.reachMessageText.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.4];
    [self.view addSubview:self.reachMessageText];
    [self.reachMessageText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.top.mas_equalTo(self.messageFiled.mas_bottom).offset(20);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
    }];
    
}
#pragma mark socket 链接问题
-(void)socketAsyon{
    self.clientSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *error = nil;
    [self.clientSocket connectToHost:@"192.168.90.250" onPort:12345 error:&error];
    if (error) {
        NSLog(@"error == %@",error);
    }
}
#pragma mark socket 代理
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"服务器IP: %@ ---- 端口： %d",host,port);
    NSLog(@"链接成功");
    self.reachMessageText.text = @"链接成功";
}

-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"发送数据 tag = %zi",tag);
    [sock readDataWithTimeout:-1 tag:tag];
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"读取数据 data = %@ tag = %zi",str,tag);
    // 读取到服务端数据值后,能再次读取
    [sock readDataWithTimeout:- 1 tag:tag];
}
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    NSLog(@"断开连接");
    self.clientSocket.delegate = nil;
    self.clientSocket = nil;
}

#pragma mark 发送消息
-(void)stocekSendMessage{
    NSString *msg = [NSString stringWithFormat:@"%@\r\n",self.messageFiled.text];
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    // withTimeout -1 : 无穷大,一直等
    // tag : 消息标记
    [self.clientSocket writeData:data withTimeout:-1 tag:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
