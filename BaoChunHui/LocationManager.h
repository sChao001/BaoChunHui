//
//  LocationManager.h
//  BaoChunHui
//
//  Created by BCH on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// 简化block声明
typedef void(^locationManagerBlock)(CLLocation *location, NSError *error);

@interface LocationManager : NSObject

+ (instancetype)sharedLocationManager;

// 声明接口: 用户的位置信息CLLocation/错误信息NSError
- (void)updateUserLocationCompletionHandler:(locationManagerBlock)completion;

// .....
- (void)stopUpdatingUserLocation;

@end
