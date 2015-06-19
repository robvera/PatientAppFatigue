//
//  HelpViewController.m
//  MSPatient
//
//  Created by David Benko on 8/4/13.
//
//

#import "HelpViewController.h"
#import "WebPageViewController.h"
#import "ConfigurationManager.h"
#import "PikConstants.h"
@interface HelpViewController ()

@end

@implementation HelpViewController
NSInteger appID;
@synthesize tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;

    appID = [[[ConfigurationManager sharedManager] appID] integerValue];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1){
        
        
         if (appID == MS) {
             // MSAA HAS 3 rows in section 1
             switch (indexPath.row) {
                 case 0:
                     [self callPhone ];
                     //NSLog(@"compose");
                     break;
                 case 1:
                     [self composeEmail];
                     //NSLog(@"call");
                     break;
                 
                 default:
                     break;
             }
             
         }else{
             switch (indexPath.row) {
                 case 0:
                     [self composeEmail];
                     //NSLog(@"compose");
                     break;
                 case 1:
                     [self callPhone];
                     //NSLog(@"call");
                     break;
                 default:
                     break;
             }
             
         }
        
    }else if  (indexPath.section == 2){
        
        if (appID == MS) {
            //MSAA has 1 row in section 2
            
            [self composeEmailTechSupport];
        }
        
    }
        
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier]isEqualToString:@"OnlineHelp"]){
        [(WebPageViewController*)segue.destinationViewController setWebpage:@"http://atpointofcare.com/patient/help/"]; // used to be http://www.atpointofcare.com/my360/help
    }
    else if ([[segue identifier]isEqualToString:@"GetStarted"]){
        [(WebPageViewController*)segue.destinationViewController setWebpage:@"http://atpointofcare.com/patient/help/basics"]; //http://www.atpointofcare.com/my360/help/basics
    }else if ([[segue identifier]isEqualToString:@"MSAASite"]){
        [(WebPageViewController*)segue.destinationViewController setWebpage:@"http://www.mymsaa.org"];
        
    }
        
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    if (appID == MS) {
        if(section == 1){
            return @"Multiple Sclerosis Association of America\n706 Haddonfield Road\nCherry Hill, NJ 08002";
        }
        if(section == 2){
            return @"@Point of Care\n290 W. Mt. Pleasant Avenue, Suite 2350\nLivingston, NJ 07039";
        }
        
    }else{
        if(section == 1){
//            NSString * appVersion = [NSString stringWithFormat:@"v.%@\n\n\n@Point of Care\n290 W. Mt. Pleasant Avenue\nSuite 2350\nLivingston, NJ 07039", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
            return @"@Point of Care\n290 W. Mt. Pleasant Avenue\nSuite 2350\nLivingston, NJ 07039";
//            return appVersion;
            
        }
    }
    
    
    return nil;
}

 //NSString * appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
-(IBAction)composeEmailTechSupport {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:Info@AtPointOfCare.com"]]];

}

-(IBAction)composeEmail {
    
    if (appID == MS) {
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:Msquestions@mymsaa.org"]]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:patientsupport@atpointofcare.com"]]];
    }
    
    
}

-(IBAction)callPhone {
    
    if (appID == MS) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:1.800.532.7667"]]];
    }else{
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:973-200-2527"]]];
    }
    
    
    
}


@end
