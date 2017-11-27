//
//  CenterView.h
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectRowBlock)(NSInteger, NSString*);

@interface CenterView : UIView

/// row 标题颜色
@property (nonatomic, copy) UIColor *rowTitleColor;
/// row 标题大小
@property (nonatomic, assign) NSInteger rowTitleFont;
/// row 详情颜色
@property (nonatomic, copy) UIColor *rowDetailColor;
/// row 详情大小
@property (nonatomic, assign) NSInteger rowDetailFont;

/** 回调 */
@property (nonatomic, copy) SelectRowBlock selectRowBlock;


- (instancetype)initWithTitleItems:(NSArray *)titleItems detailsItems:(NSArray *)detailsItems selectImage:(NSString *)selectImage  normalImage:(NSString *)normalImage;

@end
