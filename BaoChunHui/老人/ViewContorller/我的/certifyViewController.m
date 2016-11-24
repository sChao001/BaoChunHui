//
//  certifyViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "certifyViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>




@interface certifyViewController ()<UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameL;

@property (weak, nonatomic) IBOutlet UITextField *idL;

@property (weak, nonatomic) IBOutlet UITextField *genderL;

@property (weak, nonatomic) IBOutlet UITextField *addressL;

@property (weak, nonatomic) IBOutlet UITextField *teleNumL;

@property (weak, nonatomic) IBOutlet UIButton *picktureA;
@property (weak, nonatomic) IBOutlet UIButton *pictureB;




@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property(nonatomic) NSInteger tag;


@end

@implementation certifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pictureA:(UIControl *)sender {
    self.tag = sender.tag;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
    sheet.tag = 100;
    [sheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        __block NSInteger sourceType = 0;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){// 是否支持相机
            switch (buttonIndex) {
                case 0:
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 1:
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    return;
                    break;
            }
            
        }else {
            NSLog(@"不支持相机功能");
            if (buttonIndex == 0) {
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        
        UIImagePickerController *imgPickerC = [[UIImagePickerController alloc] init];
        imgPickerC.delegate = self;
        imgPickerC.allowsEditing = YES;
        imgPickerC.sourceType = sourceType;
        [self presentViewController:imgPickerC animated:YES completion:^{
            NSLog(@"open imgPickerController");
        }];
        
        
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIButton *picBtn = [self.view viewWithTag:self.tag];
    [picBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}








- (IBAction)submitBtn:(id)sender {
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
