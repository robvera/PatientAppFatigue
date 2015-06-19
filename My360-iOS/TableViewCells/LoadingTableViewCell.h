//
//  LoadingTableViewCell.h
//  AnotherTest
//

#import <UIKit/UIKit.h>

typedef enum {
    kLoadingTableViewCellStateReady,
    kLoadingTableViewCellStateBusy
} LoadingTableViewCellState;

@interface LoadingTableViewCell : UITableViewCell

@property (nonatomic, assign) LoadingTableViewCellState state;

@end
