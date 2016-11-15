//
//  AdViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "AdViewController.h"

@interface AdViewController ()


@property(nonatomic, strong) UIProgressView * progressV;
@property(nonatomic, strong) UIImage * AdImage;
@property(nonatomic, strong) UILabel * timeV;
@property(nonatomic, strong) UIImageView * imgV;

@end

@implementation AdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *adImage = [NSString stringWithFormat:@"%@/%@",documentPath, @"adImage"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:adImage] ) {
        //进入主界面
    }
    
    
    [self configImageView];
    [self timeV];
    self.AdImage = [[UIImage alloc] initWithContentsOfFile:adImage];
    
    
    
    
    
}

- (void)configImageView{
    
    _imgV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _imgV.image = self.AdImage;
    
}



-(UILabel *)timeV{
    if (!_timeV) {
        _timeV = [[UILabel alloc]init];
        [self.imgV addSubview:_timeV];
        [_timeV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.right.equalTo(50);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
    }
    
    _timeV.alpha = .5;
    _timeV.font = [UIFont systemFontOfSize:30];
    _timeV.textColor = [UIColor whiteColor];
    _timeV.layer.cornerRadius = 25;
    _timeV.clipsToBounds = YES;
    
    
    _timeV.text = @"3";
    __block NSInteger time = 2;
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        _timeV.text = [NSString stringWithFormat:@"%ld",(long)time];
        if (time == 0) {
#pragma mark - 广告页面消失，进入主界面
            //广告页面消失，进入主界面
        }
        time -= time;
    } repeats:YES];
    return _timeV;
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
