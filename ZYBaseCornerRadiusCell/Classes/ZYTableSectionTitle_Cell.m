//
//  ZYTableSectionTitle_Cell.m
//  JSGL
//
//  Created by XUZY on 2021/9/22.
//

#import "ZYTableSectionTitle_Cell.h"

@implementation ZYTableSectionTitle_Cell

- (void)initUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:ZYCRWIDTH_SCALE(15) weight:UIFontWeightMedium];
    self.titleLabel.textColor = [UIColor colorWithRed:(24)/255.0f green:(27)/255.0f blue:(36)/255.0f alpha:1];
    [self.zy_contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ZYCRWIDTH_SCALE(13));
        make.right.mas_equalTo(-ZYCRWIDTH_SCALE(13));
        make.top.mas_equalTo(ZYCRWIDTH_SCALE(13));
        make.bottom.mas_equalTo(-ZYCRWIDTH_SCALE(6));
    }];
}

- (void)setLabelEdge:(UIEdgeInsets)labelEdge {
    _labelEdge = labelEdge;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(labelEdge.left);
        make.right.mas_equalTo(-labelEdge.right);
        make.top.mas_equalTo(labelEdge.top);
        make.bottom.mas_equalTo(-labelEdge.bottom);
    }];
}

- (void)setLabelTop:(CGFloat)labelTop {
    _labelTop = labelTop;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labelTop);
    }];
}

- (void)setLabelBottom:(CGFloat)labelBottom {
    _labelBottom = labelBottom;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-labelBottom);
    }];
}

- (void)setLabelLeft:(CGFloat)labelLeft {
    _labelLeft = labelLeft;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(labelLeft);
    }];
}

- (void)setLabelRight:(CGFloat)labelRight {
    _labelRight = labelRight;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-labelRight);
    }];
}

@end
