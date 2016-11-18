//
//  ViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *oldPeopleButton;








@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)chooseOldPeopleModule:(UIButton *)sender {
    
    [[speach sharedSpeechModel] speechStartWithText:sender.titleLabel.text];
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
