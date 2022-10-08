//
//  ZYTableSectionTitle_Cell.h
//  JSGL
//
//  Created by XUZY on 2021/9/22.
//

#import "ZYBaseTable_Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYTableSectionTitle_Cell : ZYBaseTable_Cell
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) UIEdgeInsets labelEdge;
@property (nonatomic, assign) CGFloat labelTop;
@property (nonatomic, assign) CGFloat labelBottom;
@property (nonatomic, assign) CGFloat labelLeft;
@property (nonatomic, assign) CGFloat labelRight;
@end

NS_ASSUME_NONNULL_END
