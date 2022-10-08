//
//  ZYCornerRadiusHeader.h
//  JSGL
//
//  Created by XUZY on 2021/10/13.
//

#ifndef CornerRadiusHeader_h
#define CornerRadiusHeader_h

typedef NS_ENUM(NSUInteger, ZYCellCornerRadiusType) {
    ZYCellCornerRadiusTypeNone = 0,
    ZYCellCornerRadiusTypeTopLeft,
    ZYCellCornerRadiusTypeTopRight,
    ZYCellCornerRadiusTypeBottomLeft,
    ZYCellCornerRadiusTypeBottomRight,
    ZYCellCornerRadiusTypeTopLeftAndTopRight,
    ZYCellCornerRadiusTypeBottomLeftAndBottomRight,
    ZYCellCornerRadiusTypeAll
};

#define ZYCRLine_Color [UIColor colorWithRed:(238)/255.0f green:(238)/255.0f blue:(242)/255.0f alpha:1]
#define ZYCRWIDTH_SCALE(space)        ((CGFloat)(((space) / 375.0) * [[UIScreen mainScreen] bounds].size.width))

#endif /* CornerRadiusHeader_h */
