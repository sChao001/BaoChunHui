//
//  AppDelegate.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>//百度地图头文件

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager *_mapManager;
}
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic, strong) UIWindow * welcomeWindow;

@property(nonatomic, strong) UIWindow * adWindow;




- (void)saveContext;



@end

