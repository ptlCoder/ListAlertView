//
//  MenuAlertViewController.m
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "MenuAlertViewController.h"
#import "CenterView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define buttonMarge  20

@interface MenuAlertViewController ()

/// 标题数组
@property (nonatomic, strong) NSArray *titleItems;
/// 详情数组
@property (nonatomic, strong) NSArray *detailsItems;
/// 选中图片
@property (nonatomic, copy) NSString *selectImage;
/// 默认图片
@property (nonatomic, copy) NSString *normalImage;
/// 背景View
@property (nonatomic, strong) UIView *bgView;
/// bgView
@property (nonatomic, strong) UIView *showView;
/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 低部按钮View
@property (nonatomic, strong) UIView *bottomView;
/// 取消按钮
@property (nonatomic, strong) UIButton *cacelBtn;
/// 确认按钮
@property (nonatomic, strong) UIButton *confirmBtn;
/// 中间view
@property (nonatomic, strong) CenterView *centerView;

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation MenuAlertViewController

- (instancetype)initWithTitleItems:(NSArray *)titleItems detailsItems:(NSArray *)detailsItems selectImage:(NSString *)selectImage  normalImage:(NSString *)normalImage {
    if (self = [super init]) {
        // 初始化
        _titleItems = titleItems;
        _detailsItems = detailsItems;
        _selectImage = selectImage;
        _normalImage = normalImage;
        // 默认选中第0个
        _selectIndex = 0;
        

        self.view.backgroundColor = [UIColor clearColor];
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        [self setupViews];
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    } completion:^(BOOL finished) {
        
    }];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupViews {
    
    // 添加背景View
    [self.view addSubview:self.bgView];
    // 弹框bgView
    [self.bgView addSubview:self.showView];
    // 标题View
    [self.showView addSubview:self.titleLabel];
    // 顶部按钮View
    [self.showView addSubview:self.bottomView];
    [self.bottomView addSubview:self.cacelBtn];
    [self.bottomView addSubview:self.confirmBtn];
    // 中间View
    [self.showView addSubview:self.centerView];

}

- (void)cacelBtnDidCilck {
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)confirmBtnDidCilck {
    
    if (self.confirmSelectRowBlock) {
        self.confirmSelectRowBlock(_selectIndex);
    }
    // dismiss
    [self cacelBtnDidCilck];
}

#pragma mark - setter.getter
-(void)setLeftBtnTitle:(NSString *)leftBtnTitle {
    _leftBtnTitle = leftBtnTitle;
    [self.cacelBtn setTitle:leftBtnTitle forState:UIControlStateNormal];
}

-(void)setRightBtnTitle:(NSString *)rightBtnTitle {
    _rightBtnTitle = rightBtnTitle;
    [self.confirmBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
}

-(void)setTitle:(NSString *)title {
    [self setTitles:title];
}

-(void)setTitles:(NSString *)titles {
    _titles = titles;
    self.titleLabel.text = titles;
}

-(void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

-(void)setTitleFont:(NSInteger)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
}

-(void)setLeftTitleColor:(UIColor *)leftTitleColor {
    _leftTitleColor = leftTitleColor;
    [self.cacelBtn setTitleColor:leftTitleColor forState:UIControlStateNormal];
}

-(void)setRightTitleColor:(UIColor *)rightTitleColor {
    _rightTitleColor = rightTitleColor;
    [self.confirmBtn setTitleColor:rightTitleColor forState:UIControlStateNormal];
}

-(void)setBtnFont:(NSInteger)btnFont {
    _btnFont = btnFont;
    self.cacelBtn.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    self.confirmBtn.titleLabel.font = [UIFont systemFontOfSize:btnFont];
}

-(void)setLeftBtnBgColor:(UIColor *)leftBtnBgColor {
    _leftBtnBgColor = leftBtnBgColor;
    self.cacelBtn.backgroundColor = leftBtnBgColor;
}

-(void)setRightBtnBgColor:(UIColor *)rightBtnBgColor {
    _rightBtnBgColor = rightBtnBgColor;
    self.confirmBtn.backgroundColor = rightBtnBgColor;
}

-(void)setRowTitleFont:(NSInteger)rowTitleFont {
    _rowTitleFont = rowTitleFont;
    
    self.centerView.rowTitleFont = rowTitleFont;
}

-(void)setRowTitleColor:(UIColor *)rowTitleColor {
    _rowTitleColor = rowTitleColor;
    self.centerView.rowTitleColor = rowTitleColor;
}

-(void)setRowDetailFont:(NSInteger)rowDetailFont {
    _rowDetailFont = rowDetailFont;
    self.centerView.rowDetailFont = rowDetailFont;
}

-(void)setRowDetailColor:(UIColor *)rowDetailColor {
    _rowDetailColor = rowDetailColor;
    self.centerView.rowDetailColor = rowDetailColor;
}

-(UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:self.view.bounds];
        _bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
    }
    return _bgView;
}

-(UIView *)showView {
    if (!_showView) {
        _showView = [[UIView alloc]initWithFrame:self.view.bounds];
        CGFloat w = kScreenWidth *0.8;
        CGFloat h = w * 0.7;
        CGFloat x = (kScreenWidth - w) / 2;
        CGFloat y = (kScreenHeight - h) / 2;
        _showView.frame = CGRectMake(x, y, w, h);
        _showView.backgroundColor = [UIColor redColor];
    }
    return _showView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        CGFloat w = CGRectGetWidth(self.showView.frame);
        CGFloat h = 40;
        CGFloat x = 0;
        CGFloat y = 0;
        _titleLabel.frame = CGRectMake(x, y, w, h);
        _titleLabel.text = @"请选择使用套餐";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor greenColor];
    }
    return _titleLabel;
}

-(UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        CGFloat w = CGRectGetWidth(self.showView.frame);
        CGFloat h = 50;
        CGFloat x = 0;
        CGFloat y = self.showView.frame.size.height - h;
        _bottomView.frame = CGRectMake(x, y, w, h);
        _bottomView.backgroundColor = [UIColor greenColor];
    }
    return _bottomView;
}

-(CenterView *)centerView {
    if (!_centerView) {
        _centerView = [[CenterView alloc]initWithTitleItems:_titleItems detailsItems:_detailsItems selectImage:_selectImage normalImage:_normalImage];
        CGFloat w = CGRectGetWidth(self.showView.frame);
        CGFloat h = CGRectGetHeight(self.showView.frame)-CGRectGetHeight(self.titleLabel.frame)-CGRectGetHeight(self.bottomView.frame);
        CGFloat x = 0;
        CGFloat y = CGRectGetMaxY(self.titleLabel.frame);
        _centerView.frame = CGRectMake(x, y, w, h);
        _centerView.backgroundColor = [UIColor whiteColor];
        _centerView.selectRowBlock = ^(NSInteger index, NSString *title) {
            _selectIndex = index;
        };
    }
    return _centerView;
}

#pragma mark - 取消
-(UIButton *)cacelBtn {
    if (!_cacelBtn) {
        _cacelBtn = [[UIButton alloc]init];
        CGFloat w = (CGRectGetWidth(self.showView.frame)-buttonMarge*3)/2;
        CGFloat h = 40;
        CGFloat x = buttonMarge;
        CGFloat y = (self.bottomView.frame.size.height-h)/2;
        _cacelBtn.frame = CGRectMake(x, y, w, h);
        [_cacelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cacelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cacelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _cacelBtn.backgroundColor = [UIColor grayColor];
        [_cacelBtn addTarget:self action:@selector(cacelBtnDidCilck) forControlEvents:(UIControlEventTouchUpInside)];
        _cacelBtn.backgroundColor = [UIColor yellowColor];
    }
    return _cacelBtn;
}


-(UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc]init];
        CGFloat w = CGRectGetWidth(self.cacelBtn.frame);
        CGFloat h = CGRectGetHeight(self.cacelBtn.frame);
        CGFloat x = CGRectGetMaxX(self.cacelBtn.frame) + buttonMarge;
        CGFloat y = CGRectGetMinY(self.cacelBtn.frame);
        _confirmBtn.frame = CGRectMake(x, y, w, h);
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cacelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _cacelBtn.backgroundColor = [UIColor purpleColor];
        [_confirmBtn addTarget:self action:@selector(confirmBtnDidCilck) forControlEvents:(UIControlEventTouchUpInside)];
        _confirmBtn.backgroundColor = [UIColor purpleColor];
    }
    return _confirmBtn;
}


@end
