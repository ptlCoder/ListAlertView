//
//  MenuAlertViewController.h
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConfirmSelectRowBlock)(NSInteger);

@class CenterView;
@interface MenuAlertViewController : UIViewController

/// 标题
@property (nonatomic, copy) NSString *titles;
/// 标题大小
@property (nonatomic, assign) NSInteger titleFont;
/// 标题颜色
@property (nonatomic, copy) UIColor *titleColor;

/// 按钮字体大小
@property (nonatomic, assign) NSInteger btnFont;

/// left按钮文字
@property (nonatomic, copy) NSString *leftBtnTitle;
/// left按钮文字颜色
@property (nonatomic, copy) UIColor *leftTitleColor;
/// left按钮bg颜色
@property (nonatomic, copy) UIColor *leftBtnBgColor;

/// right按钮文字
@property (nonatomic, copy) NSString *rightBtnTitle;
/// right按钮文字颜色
@property (nonatomic, copy) UIColor *rightTitleColor;
/// right按钮bg颜色
@property (nonatomic, copy) UIColor *rightBtnBgColor;


/// row 标题颜色
@property (nonatomic, copy) UIColor *rowTitleColor;
/// row 标题大小
@property (nonatomic, assign) NSInteger rowTitleFont;
/// row 详情颜色
@property (nonatomic, copy) UIColor *rowDetailColor;
/// row 详情大小
@property (nonatomic, assign) NSInteger rowDetailFont;

/** 回调 */
@property (nonatomic, copy) ConfirmSelectRowBlock confirmSelectRowBlock;



- (instancetype)initWithTitleItems:(NSArray *)titleItems detailsItems:(NSArray *)detailsItems selectImage:(NSString *)selectImage  normalImage:(NSString *)normalImage;

@end
