//
//  ZYBaseTable_Cell.m
//  ReadBook
//
//  Created by XUZY on 2021/7/28.
//  Copyright © 2021 xuzy. All rights reserved.
//

#import "ZYBaseTable_Cell.h"

@interface ZYBaseTable_Cell ()
@property (nonatomic, assign) BOOL isUpdateLayout;
@end

@implementation ZYBaseTable_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius {
    [self setZyContentEdgeInsets:contentEdgeInsets radiusType:radiusType cornerRadius:cornerRadius cellHeight:0];
}

- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius cellHeight:(CGFloat)cellHeight {
    self.isUpdateLayout = YES;
    self.backgroundColor = [UIColor clearColor];
    self.zy_contentView.backgroundColor = [UIColor whiteColor];
    self.zy_contentEdgeInsets = contentEdgeInsets;
    self.radiusType = radiusType;
    self.cornerRadius = cornerRadius;
    if (cellHeight > 0) {
        self.cellHeight = cellHeight;
    }
    [self.zy_contentView layoutButtonWithRadiusType:(ZYButtonCornerRadiusType)radiusType cornerRadius:cornerRadius];
    [self.zy_contentView layoutRadiusType];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (ZYButton *)zy_contentView {
    if (!_zy_contentView) {
        _zy_contentView = [ZYButton buttonWithType:UIButtonTypeCustom];
        _zy_contentView.zy_userInteractionEnabled = NO;
        [_zy_contentView addTarget:self action:@selector(zyContentViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_zy_contentView];
    }
    return _zy_contentView;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = ZYCRLine_Color;
    }
    return _line;
}

- (void)setZyContentViewClick:(void (^)(void))zyContentViewClick {
    _zyContentViewClick = zyContentViewClick;
    _zy_contentView.zy_userInteractionEnabled = YES;
}

- (void)zyContentViewClick:(UIButton *)sender {
    if (_zyContentViewClick) {
        _zyContentViewClick();
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.isUpdateLayout = YES;

        [self initUI];
        if (_zy_contentView) {
            [_zy_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self.zy_contentEdgeInsets);
            }];
        }
    }
    return self;
}

- (void)setCellWidth:(CGFloat)cellWidth {
    _cellWidth = cellWidth;

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:cellWidth];
    constraint.priority = UILayoutPriorityDefaultHigh;
    [self.contentView addConstraint:constraint];
}

- (void)setZy_contentEdgeInsets:(UIEdgeInsets)zy_contentEdgeInsets {
    _zy_contentEdgeInsets = zy_contentEdgeInsets;
    [_zy_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(zy_contentEdgeInsets);
    }];
}

- (void)setCellHeight:(CGFloat)cellHeight {
    _cellHeight = cellHeight;
    if (_zy_contentView) {
        [_zy_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(cellHeight).priorityMedium();
        }];
    }
}

- (void)initUI {
    
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self layoutZyContentView];
//}
//
//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    [self layoutZyContentView];
//}

//- (void)layoutZyContentView {
//    if (self.isUpdateLayout) {
//        if (_zy_contentView && _zy_contentView.width > 0) {
//            self.isUpdateLayout = NO;
//            if (self.radiusType != ZYCellCornerRadiusTypeNone) {
//                UIRectCorner corner;
//                if (self.radiusType == ZYCellCornerRadiusTypeTopLeftAndTopRight) {
//                    corner = UIRectCornerTopLeft | UIRectCornerTopRight;
//                }else if (self.radiusType == ZYCellCornerRadiusTypeBottomLeftAndBottomRight) {
//                    corner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
//                }else {
//                    corner = UIRectCornerAllCorners;
//                }
//                UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:_zy_contentView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
//                
//                CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
//                maskLayer.frame = _zy_contentView.bounds;
//                maskLayer.path = maskPath.CGPath;
//                _zy_contentView.layer.mask = maskLayer;
//            }else {
//                _zy_contentView.layer.mask = nil;
//            }
//        }
//    }
//}

@end
