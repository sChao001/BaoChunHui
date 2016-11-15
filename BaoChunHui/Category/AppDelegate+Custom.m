//
//  AppDelegate+Custom.m
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate+Custom.h"
#import <MLTransition.h>
#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()<EMClientDelegate>

@end

@implementation AppDelegate (Custom)

- (void)configSystem:(NSDictionary *)options{
    //注册环信
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    //注意: 局部参数不要 跟 当前的方法 传参重名了!!
    EMOptions *options1 = [EMOptions optionsWithAppkey:@"1660626091#1604"];
    options1.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options1];
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:@"15e195ffd7eae"
             withSecret:@"aea4acf9daae4b67ce75595ce467a7d1"];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
    
    /*********  添加日志功能   **********/
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    /**********  修复自定义返回按钮后的手势滑动返回失效   ***********/
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
    
    /***********  所有通过AF发送的请求, 都会在电池条上出现菊花提示  ***********/
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    /***********  监听当前网络状态    *************/
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (BOOL)isOnline{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN || [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

/*!
 *  自动登录返回结果
 *
 *  @param aError 错误信息
 */
- (void)didAutoLoginWithError:(EMError *)aError{
    if (aError) {
        kLogout
    }else{
        kSavePwd(@"222"); //随便设置一个, 有值就行
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStateChangedNotification object:nil];
}
/*!
 *  SDK连接服务器的状态变化时会接收到该回调
 *
 *  有以下几种情况，会引起该方法的调用：
 *  1. 登录成功后，手机无法上网时，会调用该回调
 *  2. 登录成功后，网络状态变化时，会调用该回调
 *
 *  @param aConnectionState 当前状态
 */
- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
    switch (aConnectionState) {
        case EMConnectionConnected:
            kSavePwd(@"222"); //随便设置一个, 有值就行
            break;
        case EMConnectionDisconnected:
            kLogout
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStateChangedNotification object:nil];
}
/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)didLoginFromOtherDevice{
    kLogout
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStateChangedNotification object:nil];
}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)didRemovedFromServer{
    kLogout
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStateChangedNotification object:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
