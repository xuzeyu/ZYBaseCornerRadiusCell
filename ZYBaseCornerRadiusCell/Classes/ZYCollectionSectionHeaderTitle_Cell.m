//
//  ZYCollectionSectionHeaderTitle_Cell.m
//  JSGL
//
//  Created by XUZY on 2021/10/13.
//

#import "ZYCollectionSectionHeaderTitle_Cell.h"
@interface ZYCollectionSectionHeaderTitle_Cell ()
@property (nonatomic, assign) BOOL isSetLabelEdge;
@property (nonatomic, assign) BOOL isSetLabelLeft;
@property (nonatomic, assign) BOOL isSetLabelRight;
@property (nonatomic, assign) BOOL isSetLabelTop;
@property (nonatomic, assign) BOOL isSetLabelBottom;
@end

@implementation ZYCollectionSectionHeaderTitle_Cell

- (void)initUI:(CGRect)frame {
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:ZYCRWIDTH_SCALE(15) weight:UIFontWeightMedium];
    self.titleLabel.textColor = [UIColor colorWithRed:(24)/255.0f green:(27)/255.0f blue:(36)/255.0f alpha:1];
    [self.zy_contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([self titleLabelEdge]);
    }];
}

- (UIEdgeInsets)titleLabelEdge {
    CGFloat labelLeft = ZYCRWIDTH_SCALE(13);
    if (self.isSetLabelLeft) {
        labelLeft = self.labelLeft;
    }else if (self.isSetLabelEdge) {
        labelLeft = self.labelEdge.left;
    }
    
    CGFloat labelRight = ZYCRWIDTH_SCALE(13);
    if (self.isSetLabelRight) {
        labelLeft = self.labelRight;
    }else if (self.isSetLabelEdge) {
        labelLeft = self.labelEdge.right;
    }
    
    CGFloat labelTop = ZYCRWIDTH_SCALE(13);
    if (self.isSetLabelTop) {
        labelTop = self.labelTop;
    }else if (self.isSetLabelEdge) {
        labelTop = self.labelEdge.top;
    }
    
    CGFloat labelBottom = ZYCRWIDTH_SCALE(6);
    if (self.isSetLabelBottom) {
        labelBottom = self.labelBottom;
    }else if (self.isSetLabelEdge) {
        labelBottom = self.labelEdge.bottom;
    }
    
    return UIEdgeInsetsMake(labelTop, labelLeft, labelBottom, labelRight);
}

- (void)setCellType:(CollectionSectionHeaderTitleCellType)cellType {
    if (_cellType != cellType) {
        _cellType = cellType;
        if (_cellType == CollectionSectionHeaderTitleCellTypeText) {
            [self.moreButton removeFromSuperview];
            self.moreButton = nil;
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo([self titleLabelEdge]);
            }];
        }else if (_cellType == CollectionSectionHeaderTitleCellTypeTextButton) {
            if (!self.moreButton.superview) {
                [self.zy_contentView addSubview:self.moreButton];
                [self.moreButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(-ZYCRWIDTH_SCALE(13));
                    make.size.mas_equalTo(CGSizeMake(ZYCRWIDTH_SCALE(55), ZYCRWIDTH_SCALE(20)));
                    make.centerY.equalTo(self.titleLabel);
                }];
                
                UIEdgeInsets titleEdge = [self titleLabelEdge];
                [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(self.moreButton.mas_left).offset(ZYCRWIDTH_SCALE(8));
                    make.left.mas_equalTo(titleEdge.left);
                    make.top.mas_equalTo(titleEdge.top);
                    make.bottom.mas_equalTo(-titleEdge.bottom);
                }];
            }
            
        }
    }
}

- (void)moreButtonClick:(UIButton *)sender {
    if (self.moreButtonClick) {
        self.moreButtonClick();
    }
}

- (ZYButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [ZYButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setImage:[UIImage imageNamed:@"icon_gray_more"] forState:UIControlStateNormal];
        [_moreButton setTitleColor: [UIColor colorWithRed:(126)/255.0f green:(128)/255.0f blue:(135)/255.0f alpha:1] forState:UIControlStateNormal];
        [_moreButton layoutButtonWithEdgeInsetsStyle:ZYButtonEdgeInsetsStyleRight imageTitleSpace:ZYCRWIDTH_SCALE(3) imageSize:CGSizeMake(ZYCRWIDTH_SCALE(8), ZYCRWIDTH_SCALE(13)) forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:ZYCRWIDTH_SCALE(12)];
        [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (void)setLabelEdge:(UIEdgeInsets)labelEdge {
    _labelEdge = labelEdge;
    self.isSetLabelEdge = YES;
    self.isSetLabelLeft = self.isSetLabelRight = self.isSetLabelTop = self.isSetLabelBottom = NO;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(labelEdge.left);
        make.right.mas_equalTo(-labelEdge.right);
        make.top.mas_equalTo(labelEdge.top);
        make.bottom.mas_equalTo(-labelEdge.bottom);
    }];
}

- (void)setLabelTop:(CGFloat)labelTop {
    _labelTop = labelTop;
    self.isSetLabelTop = YES;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labelTop);
    }];
}

- (void)setLabelBottom:(CGFloat)labelBottom {
    _labelBottom = labelBottom;
    self.isSetLabelBottom = YES;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-labelBottom);
    }];
}

- (void)setLabelLeft:(CGFloat)labelLeft {
    _labelLeft = labelLeft;
    self.isSetLabelLeft = YES;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(labelLeft);
    }];
}

- (void)setLabelRight:(CGFloat)labelRight {
    _labelRight = labelRight;
    self.isSetLabelRight = YES;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-labelRight);
    }];
}

@end
