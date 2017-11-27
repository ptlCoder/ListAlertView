//
//  Model.h
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
/** <#注释#> */
@property (nonatomic, copy) NSString *selectImage;
@property (nonatomic, copy) NSString *normalImage;
@property (nonatomic, assign) BOOL isSelect;

@end
