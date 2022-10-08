//
//  ZYBaseCollection_Cell.h
//  JSGL
//
//  Created by XUZY on 2021/10/12.
//

#import <UIKit/UIKit.h>
#import "ZYButton.h"
#import "ZYCornerRadiusHeader.h"
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseCollection_Cell : UICollectionViewCell
@property (nonatomic, strong) ZYButton *zy_contentView;
@property (nonatomic, assign) UIEdgeInsets zy_contentEdgeInsets;
@property (nonatomic, assign) ZYCellCornerRadiusType radiusType;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong, nullable) void(^zyContentViewClick)(void);
@property (nonatomic, strong) UIView *line;
@property (nonatomic, assign) CGFloat cellWidth;

- (void)initUI:(CGRect)frame;
- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius;
- (void)setZyContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets radiusType:(ZYCellCornerRadiusType)radiusType cornerRadius:(CGFloat)cornerRadius cellHeight:(CGFloat)cellHeight;
@end

NS_ASSUME_NONNULL_END
