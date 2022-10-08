//
//  ZYBaseTableTable_Cell.h
//  JSGL
//
//  Created by XUZY on 2021/8/30.
//

#import "ZYBaseTable_Cell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseTableTable_Cell : ZYBaseTable_Cell  <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

NS_ASSUME_NONNULL_END
