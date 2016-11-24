//
//  const.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#ifndef const_h
#define const_h

typedef NS_ENUM(NSUInteger, MainModulePart) {
    PartOfOldPeople,
    PartOfFamily,
    PartOfCareStation,
    PartOfService,
    PartOf5,
    PsrtOf6
};

//    转JSON
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
//    [parameter setObject:[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding] forKey:@"letterFujian"];


#define addBackBtn \
UIBarButtonItem * leftitem= [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil) style:UIBarButtonItemStylePlain target:self action:@selector(backButton)];\
self.navigationItem.leftBarButtonItem = leftitem;


#define addHelpBtn\
UIButton *HelpBtn = [UIButton buttonWithType:UIButtonTypeCustom];\
HelpBtn.frame = CGRectMake(0, 0, 100, 70);\
HelpBtn.backgroundColor = [UIColor orangeColor];\
HelpBtn.titleLabel.text = @"一键呼救";\
[HelpBtn setTitle:@"一键呼救" forState:UIControlStateNormal];\
HelpBtn.titleLabel.font = [UIFont systemFontOfSize:30];\
HelpBtn.titleLabel.numberOfLines = 0;\
[HelpBtn addTarget:self action:@selector(helpButton) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithCustomView:HelpBtn];\
self.navigationItem.rightBarButtonItem = helpItem;

#define addHelp\
- (void)backButton{\
    [self popViewControllerAnimated:YES];\
}\
- (void)helpButton{\
        NSString *tele = [[NSUserDefaults standardUserDefaults] objectForKey:@"teleNum"];\
        NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];\
    NSURL *url = [NSURL URLWithString:@"tel://18513114121"];\
    UIWebView *webView = [[UIWebView alloc] init];\
    [webView loadRequest:[NSURLRequest requestWithURL:url]];\
    [self.view addSubview:webView];\
    [self sendHelpMsg];\
}\
//- (void)sendHelpMsg{\
    /*
     // 判断用户设备能否发送短信
//     if (![MFMessageComposeViewController canSendText]) {
//     return;
//     }
//     
//     // 1. 实例化一个控制器
//     MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
//     
//     // 2. 设置短信内容
//     // 1) 收件人
//     controller.recipients = @[@"10010", @"10086"];
//     
//     // 2) 短信内容
//     controller.body = @"给您拜个晚年，祝您晚年快乐！";
//     
//     // 3) 设置代理
//     controller.messageComposeDelegate = self;
//     
//     // 3. 显示短信控制器
//     [self presentViewController:controller animated:YES completion:nil];*/
//}\









#endif /* const_h */
