//
//  SymptomsViewController.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/28/13.
//
//

#import <UIKit/UIKit.h>

@interface SymptomsViewController : UITableViewController


@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSMutableDictionary *sectionedTableData;
@property (strong, nonatomic) NSMutableDictionary *expandedSections;

@end
