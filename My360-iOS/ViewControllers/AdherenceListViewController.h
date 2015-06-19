//
//  AdherenceListViewController.h
//  MSPatient
//
//  Created by David Benko on 5/21/13.
//
//

#import "BaseTableViewController.h"
#import <APSDK/PatientAdherenceLog.h>
#import "FilterViewController.h"

@class APFilterPopup;

@interface AdherenceListViewController : BaseTableViewController <UITableViewDelegate,UITableViewDataSource>{
    Boolean isFiltered;
}

@property (nonatomic,strong) PatientAdherenceLog *adherence;
@property (nonatomic, strong)FilterViewController *fvc;
@property (nonatomic, strong) APFilterPopup *popup;
@property (strong)NSMutableDictionary *treatmentNames;
@end
