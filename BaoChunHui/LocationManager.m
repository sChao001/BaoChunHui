//
//  LocationManager.m
//  BaoChunHui
//
//  Created by BCH on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "LocationManager.h"


@interface LocationManager()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationMgr;
// block声明
@property (copy) locationManagerBlock completionBlock;

@end

@implementation LocationManager

+ (instancetype)sharedLocationManager {
    // GCD
    static LocationManager *locationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [[LocationManager alloc] init];
        // 初始化属性.....
    });
    
    return locationManager;
}

- (id)init {
    if (self = [super init]) {
        // 初始化属性.....
    }
    return self;
}

// 懒加载初始化locationMgr
- (CLLocationManager *)locationMgr {
    if (_locationMgr == nil) {
        _locationMgr = [CLLocationManager new];
        _locationMgr.delegate = self;
        // Info.plist添加key
        [_locationMgr requestWhenInUseAuthorization];
    }
    
    return _locationMgr;
}

// 实现方法
- (void)updateUserLocationCompletionHandler:(locationManagerBlock)completion {
    // 赋值: completionBlock属性包含和completion的定义一样
    self.completionBlock = completion;
    
    // 判定定位服务是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        // 没有开启, 返回错误
        NSError *error = [NSError errorWithDomain:@"BaoChunHui.app" code:100 userInfo:@{NSLocalizedDescriptionKey: @"Location Service is disabled!"}];
        _completionBlock(nil, error);
        return;
    }
    // 开始定位(更新用户的位置): 每秒发送一次请求
    [self.locationMgr startUpdatingLocation];
}
// 定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // 获取用户的位置
    CLLocation *userLocation = [locations lastObject];
    // 如果两次的位置太近, 或者时间太近; .....
    // 返回用户的位置(调用block)
    if(_completionBlock) {
        _completionBlock(userLocation, nil);
    }
}
// 定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // 停止定位
    [self.locationMgr stopUpdatingLocation];
    
    // 返回错误消息(error)
    if(_completionBlock) {
        _completionBlock(nil, error);
    }
}


- (void)stopUpdatingUserLocation {
    [self.locationMgr stopUpdatingLocation];
}
@end
