//
//  OlePeopleTabBarViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "OlePeopleTabBarViewController.h"
#import "healthViewController.h"
#import "LiveViewController.h"
#import "MineTableViewController.h"
#import "CareViewController.h"
#import "BCHnaviViewController.h"



@interface OlePeopleTabBarViewController ()

@property(nonatomic, strong) LiveViewController *liveVC;
@property(nonatomic, strong) healthViewController *healVC;
@property(nonatomic, strong) MineTableViewController *mineVC;
@property(nonatomic, strong) CareViewController *careVC;






@end

@implementation OlePeopleTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //修改某个控件的某个属性的默认值
    [UITabBar appearance].translucent = NO;
    [UINavigationBar appearance].translucent = NO;
    //设置导航栏颜色
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:252/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
    //调整导航栏中的元素颜色为白色
    [UINavigationBar appearance].barStyle = UIBarStyleBlackOpaque;
    //tintColor:会影响到所有子视图的高亮颜色
    [UITabBar appearance].tintColor = [UIColor colorWithRed:252/255.0 green:50/255.0 blue:41/255.0 alpha:1.0];
    
    
    UINavigationController *navi0 = [[BCHnaviViewController alloc] initWithRootViewController:self.liveVC];
    UINavigationController *navi1 = [[BCHnaviViewController alloc] initWithRootViewController:self.careVC];
    UINavigationController *navi2 = [[BCHnaviViewController alloc] initWithRootViewController:self.healVC];
    UINavigationController *navi3 = [[BCHnaviViewController alloc] initWithRootViewController:self.mineVC];
    self.viewControllers = @[navi0, navi1, navi2, navi3];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:PartOfOldPeople] forKey:@"obviousModule"];
    
}


- (healthViewController *)healVC {
    if(_healVC == nil) {
        _healVC = [[healthViewController alloc] init];
        _healVC.title = @"健康";
        _healVC.tabBarItem.image = [UIImage imageNamed:@""];
        _healVC.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    }
    return _healVC;
}

- (LiveViewController *)liveVC {
    if(_liveVC == nil) {
        _liveVC = [[LiveViewController alloc] init];
        _liveVC.title = @"生活";
        _liveVC.tabBarItem.image = [UIImage imageNamed:@""];
        _liveVC.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    }
    return _liveVC;
}
- (MineTableViewController *)mineVC {
    if(_mineVC == nil) {
        _mineVC = [[UIStoryboard storyboardWithName:@"MineStoryboard" bundle:nil] instantiateInitialViewController];
        _mineVC.title = @"我的";
        _mineVC.tabBarItem.image = [UIImage imageNamed:@""];
        _mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    }
    return _mineVC;
}
- (CareViewController *)careVC {
    if(_careVC == nil) {
        _careVC = [[CareViewController alloc] init];
        _careVC.title = @"照护";
        _careVC.tabBarItem.image = [UIImage imageNamed:@""];
        _careVC.tabBarItem.selectedImage = [UIImage imageNamed:@""];
    }
    return _careVC;
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
