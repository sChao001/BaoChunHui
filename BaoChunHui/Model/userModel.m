//
//  userModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "userModel.h"

@implementation userModel






static userModel *users = nil;
+ (instancetype)defaultsUserModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (users == nil) {
            users = [[userModel alloc] init];
        }
    });
    return users;
}




@end
