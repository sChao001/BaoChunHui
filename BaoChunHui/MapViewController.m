//
//  MapViewController.m
//  BaoChunHui
//
//  Created by BCH on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "MapViewController.h"
#import "LocationManager.h"
#import "AppDelegate.h"


@interface MapViewController ()<BMKMapViewDelegate>
@property (nonatomic) BMKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.title = @"百度地图";
    _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    //    _mapView.mapType = BMKMapTypeSatellite;
    //打开实时路况图层
    [_mapView setTrafficEnabled:YES];
    [self.view addSubview:_mapView];
    
    
    
    LocationManager *sharedMgr = [LocationManager sharedLocationManager];
    [sharedMgr updateUserLocationCompletionHandler:^(CLLocation *location, NSError *error) {
        if (error == nil) {
            NSLog(@"经纬度是：%f, %f", location.coordinate.latitude,location.coordinate.longitude);
        } else {
            NSLog(@"error: %@", error.localizedDescription);
        }
        // 添加一个PointAnnotation
        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = location.coordinate.latitude;
        coor.longitude = location.coordinate.longitude;
        annotation.coordinate = coor;
        annotation.title = @"翠湖路养老庄园";
        [_mapView addAnnotation:annotation];
    }];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
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
