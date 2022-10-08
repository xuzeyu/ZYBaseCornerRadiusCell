//
//  ZYTableSectionHeaderTitle_View.h
//  JSGL
//
//  Created by XUZY on 2021/10/18.
//

#import "ZYBaseCornerRadius_View.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TableSectionHeaderTitleCellType) {
    TableSectionHeaderTitleCellTypeText = 0,
    TableSectionHeaderTitleCellTypeTextButton,
};

@interface ZYTableSectionHeaderTitle_View : ZYBaseCornerRadius_View
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong, nullable) ZYButton *moreButton;

@property (nonatomic, assign) UIEdgeInsets labelEdge;
@property (nonatomic, assign) CGFloat labelTop;
@property (nonatomic, assign) CGFloat labelBottom;
@property (nonatomic, assign) CGFloat labelLeft;
@property (nonatomic, assign) CGFloat labelRight;

@property (nonatomic, assign) TableSectionHeaderTitleCellType cellType;
@property (nonatomic, strong, nullable) void(^moreButtonClick)(void);
@end

NS_ASSUME_NONNULL_END
