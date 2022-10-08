//
//  ZYBaseTable_Cell.h
//  ReadBook
//
//  Created by XUZY on 2021/7/28.
//  Copyright © 2021 xuzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYButton.h"
#import "ZYCornerRadiusHeader.h"
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseTable_Cell : UITableViewCell
@property (nonatomic, strong) ZYButton *zy_contentView;
@property (nonatomic, assign) UIEdgeInsets zy_contentEdgeInsets;
@property (nonatomic, assign) ZYCellCornerRadiusType radiusType;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong, nullable) void(^zyContentViewClick)(void);
@property (nonatomic, strong) UIView *line;
@property (nonatomic, assign) CGFloat cellWidth;

- (void)initUI;
- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius;
- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius cellHeight:(CGFloat)cellHeight;
@end

NS_ASSUME_NONNULL_END
