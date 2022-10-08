//
//  ZYBaseCollectionHeader_Cell.m
//  JSGL
//
//  Created by XUZY on 2021/10/13.
//

#import "ZYBaseCollectionHeader_Cell.h"
#import "ZYButton.h"

@interface ZYBaseCollectionHeader_Cell ()
@property (nonatomic, assign) BOOL isUpdateLayout;
@end

@implementation ZYBaseCollectionHeader_Cell

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
}

- (ZYButton *)zy_contentView {
    if (!_zy_contentView) {
        _zy_contentView = [ZYButton buttonWithType:UIButtonTypeCustom];
        _zy_contentView.zy_userInteractionEnabled = NO;
        [_zy_contentView addTarget:self action:@selector(zyContentViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_zy_contentView];
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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isUpdateLayout = YES;

        [self initUI:frame];
        if (_zy_contentView) {
            [_zy_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(self.zy_contentEdgeInsets).priorityMedium();
            }];
        }
    }
    return self;
}

- (void)setCellWidth:(CGFloat)cellWidth {
    _cellWidth = cellWidth;

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:cellWidth];
    constraint.priority = UILayoutPriorityDefaultHigh;
    [self addConstraint:constraint];
}

- (void)setZy_contentEdgeInsets:(UIEdgeInsets)zy_contentEdgeInsets {
    _zy_contentEdgeInsets = zy_contentEdgeInsets;
    [_zy_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(zy_contentEdgeInsets).priorityMedium();
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

- (void)initUI:(CGRect)frame {
    
}

@end
