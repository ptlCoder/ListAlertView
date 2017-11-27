//
//  TableViewCell.m
//  套餐弹框
//
//  Created by soliloquy on 2017/10/23.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setModel:(Model *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.detailsLabel.text = [NSString stringWithFormat:@"最近到期日: %@",model.detail];
    
    if (model.isSelect) {
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:model.selectImage] forState:UIControlStateNormal];
    }else {
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:model.normalImage] forState:UIControlStateNormal];
    }
}


@end
