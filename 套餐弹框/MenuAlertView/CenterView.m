//
//  CenterView.m
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "CenterView.h"
#import "TableViewCell.h"
#import "Model.h"
@interface CenterView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
/// 标题数组
@property (nonatomic, strong) NSArray *titleItems;
/// 详情数组
@property (nonatomic, strong) NSMutableArray *detailsItems;
/// 选中图片
@property (nonatomic, copy) NSString *selectImage;
/// 默认图片
@property (nonatomic, copy) NSString *normalImage;

@property (nonatomic, strong) Model *lastModel;

/** <#注释#>*/
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CenterView

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (instancetype)initWithTitleItems:(NSArray *)titleItems detailsItems:(NSArray *)detailsItems selectImage:(NSString *)selectImage  normalImage:(NSString *)normalImage {
    if (self = [super init]) {
        _titleItems = titleItems;
        _detailsItems = [detailsItems mutableCopy];
        _selectImage = selectImage;
        _normalImage = normalImage;
        
        [self setupView];
        
        if (titleItems.count > detailsItems.count) {
            for (NSInteger i = detailsItems.count; i < titleItems.count; i ++) {
                _detailsItems[i] = @"";
            }
        }
        for (NSInteger i = 0; i < _titleItems.count; i ++) {

            Model *model = [[Model alloc]init];
            model.title = _titleItems[i];
            model.detail = _detailsItems[i];
            model.selectImage = _selectImage;
            model.normalImage = _normalImage;
            if (i == 0) {
                model.isSelect = YES;
                self.lastModel = model;
            }
            [self.dataSource addObject:model];
        }
        

        [self.tableView reloadData];
        
    }
    return self;
}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44.0;
    }
    return _tableView;
}

- (void)setupView {
  
    [self addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}


#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataSource[indexPath.row];
    cell.titleLabel.font = [UIFont systemFontOfSize:self.rowTitleFont ?: 15];
    cell.titleLabel.textColor = self.rowTitleColor ?: [UIColor blackColor];
    cell.detailsLabel.font = [UIFont systemFontOfSize:self.rowDetailFont ?: 12];
    cell.detailsLabel.textColor = self.rowDetailColor ?: [UIColor grayColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.lastModel.isSelect = NO;
    Model *model = self.dataSource[indexPath.row];
    self.lastModel = model;
    self.lastModel.isSelect = YES;
    [self.tableView reloadData];
    
    if (self.selectRowBlock) {
        self.selectRowBlock(indexPath.row, model.title);
    }
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}

@end
