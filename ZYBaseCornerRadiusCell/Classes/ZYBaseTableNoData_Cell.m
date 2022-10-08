//
//  ZYBaseTableNoData_Cell.m
//  JSGL
//
//  Created by xuzeyu on 2021/9/4.
//

#import "ZYBaseTableNoData_Cell.h"

@implementation ZYBaseTableNoData_Cell

- (void)initUI {
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"暂无数据";
    self.titleLabel.font = [UIFont systemFontOfSize:ZYCRWIDTH_SCALE(14.5)];
    self.titleLabel.textColor = [UIColor colorWithRed:(150)/255.0f green:(150)/255.0f blue:(150)/255.0f alpha:1];
    [self.zy_contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(1);
    }];
}

@end
