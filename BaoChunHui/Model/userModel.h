//
//  userModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userModel : NSObject

@property(nonatomic, strong) NSString *name;    // 姓名
@property(nonatomic) NSInteger idNum;           // 身份证号码
@property(nonatomic) BOOL gender;               // 1 male, 0 female
@property(nonatomic) BOOL isCertified;          // 是否实名
@property(nonatomic, strong) NSMutableArray *families;// 家属 们
@property(nonatomic, strong) NSString *address; // 住址
@property(nonatomic, strong) NSString *teleNum; // 亲属急救手机号
@property(nonatomic, strong) NSString *teleNum_CareStation; // 站点电话
@property(nonatomic, strong) NSString *teleNUm_System; // 系统电话







+ (instancetype)defaultsUserModel;




@end
