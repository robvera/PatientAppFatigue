//
//  LoadingTableViewCell.m
//  AnotherTest
//

#import "LoadingTableViewCell.h"

@interface LoadingTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel * label;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView * spinner;

- (void)refresh;

@end

@implementation LoadingTableViewCell

#pragma mark - Public

- (void)setState:(LoadingTableViewCellState)state {
    if (_state != state) {
        _state = state;
        
        [self refresh];
    }
}

#pragma mark - Private

- (void)refresh {
    switch (self.state) {
        case kLoadingTableViewCellStateReady:
            self.label.textColor = [UIColor darkTextColor];
            [self.spinner stopAnimating];
            break;
            
        case kLoadingTableViewCellStateBusy:
            self.label.textColor = [UIColor grayColor];
            [self.spinner startAnimating];
            break;
    }
}

#pragma mark - UIView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [self refresh];
    }
}

@end
