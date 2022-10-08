//
//  ZYCollectionSectionHeaderTitle_Cell.h
//  JSGL
//
//  Created by XUZY on 2021/10/13.
//

#import "ZYBaseCollectionHeader_Cell.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CollectionSectionHeaderTitleCellType) {
    CollectionSectionHeaderTitleCellTypeText = 0,
    CollectionSectionHeaderTitleCellTypeTextButton,
};

@interface ZYCollectionSectionHeaderTitle_Cell : ZYBaseCollectionHeader_Cell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong, nullable) ZYButton *moreButton;

@property (nonatomic, assign) UIEdgeInsets labelEdge;
@property (nonatomic, assign) CGFloat labelTop;
@property (nonatomic, assign) CGFloat labelBottom;
@property (nonatomic, assign) CGFloat labelLeft;
@property (nonatomic, assign) CGFloat labelRight;

@property (nonatomic, assign) CollectionSectionHeaderTitleCellType cellType;
@property (nonatomic, strong, nullable) void(^moreButtonClick)(void);
@end

NS_ASSUME_NONNULL_END
