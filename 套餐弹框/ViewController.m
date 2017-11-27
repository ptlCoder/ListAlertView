//
//  ViewController.m
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "ViewController.h"

#import "MenuAlertViewController.h"
#import "CenterView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)show:(id)sender {
    
    MenuAlertViewController *vc = [[MenuAlertViewController alloc]initWithTitleItems:@[@"家庭套餐", @"社区套餐",@"套餐3"] detailsItems:@[@"2017-10-10", @"2019-10-10"] selectImage:@"select_normal" normalImage:@"select_not"];
    vc.leftBtnTitle = @"取消";
    vc.title = @"我是标题";
    vc.leftTitleColor = [UIColor redColor];
    vc.btnFont = 20;
    vc.leftBtnBgColor = [UIColor grayColor];
    vc.titleFont = 17;
    vc.titleColor = [UIColor redColor];
//    vc.rowTitleFont = 17;
//    vc.rowDetailFont = 12;
//    vc.rowTitleColor = [UIColor redColor];
//    vc.rowDetailColor = [UIColor redColor];
    
    vc.confirmSelectRowBlock = ^(NSInteger index) {
      
        NSLog(@"index: %zd", index);
    };
    
    [self presentViewController:vc animated:false completion:nil];
    
}



@end
