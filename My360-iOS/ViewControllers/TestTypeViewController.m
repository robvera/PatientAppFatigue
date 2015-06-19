//
//  TestTypeViewController.m
//  MSPatient
//
//  Created by Agustin Echeandia on 3/1/13.
//
//

#import "TestTypeViewController.h"
#import <APSDK/TestType.h>
#import "UIColor+APColorExtension.h"
#import "SelectionListCell.h"

@interface TestTypeViewController ()

@end

@implementation TestTypeViewController

@synthesize tableData;
@synthesize sectionedTableData;




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionedTableData = [[NSMutableDictionary alloc] init];
    
    BOOL found;
    
    for (TestType *testType in self.tableData) {
        
        //NSString *category = testType.category;
        NSString *category = testType.testTypeCat;   //RV New lable on API for SymtomsCat, TestTypeCat and medicationCat comented 6/8/15
        found = NO;
        
        //see if we already have the category
        for (NSString *sectionLabel in [self.sectionedTableData allKeys]) {
            if ([sectionLabel isEqualToString:category]) {
                found = YES;
                break;
            }
        }
        
        //category was not found so create a new array for it
        if (!found) {
            [self.sectionedTableData setValue:[[NSMutableArray alloc] init] forKey:category];
            
        }
    }
    
    //add each testType to the correct category
    for (TestType *testType in self.tableData) {
        
       // [[self.sectionedTableData objectForKey:testType.category] addObject:testType];    //RV New lable on API for SymtomsCat, TestTypeCat and medicationCat comented 6/8/15
        [[self.sectionedTableData objectForKey:testType.testTypeCat] addObject:testType];
    }
    
    // Sort each section array
    for (NSString *key in [self.sectionedTableData allKeys])
    {
        [[self.sectionedTableData objectForKey:key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.sectionedTableData allKeys] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectionCell";
    SelectionListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    TestType *testType = [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    cell.contentLabel.text = testType.name;
    
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 24)];
    headerView.backgroundColor = [UIColor darkBlue];
    
    UILabel *sectionTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 320, 20)];
    sectionTitle.textColor = [UIColor whiteColor];
    sectionTitle.backgroundColor = [UIColor clearColor];
    
    NSString *title = [[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
    
    sectionTitle.text = title;
    
    [headerView addSubview:sectionTitle];
    
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 24;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestType *testType = [[self.sectionedTableData valueForKey:[[[self.sectionedTableData allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: testType, @"testType", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedTestType" object:nil userInfo:userInfo];
    
}

@end
