//
//  ZYBaseCollectionCollection_Cell.h
//  JSGL
//
//  Created by XUZY on 2021/10/13.
//

#import "ZYBaseCollection_Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseCollectionCollection_Cell : ZYBaseCollection_Cell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableDictionary *sectionColumn;
@end

NS_ASSUME_NONNULL_END
