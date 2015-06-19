//
//  GlucoseCell.h
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/26/13.
//
//

#import <UIKit/UIKit.h>
#import <APSDK/PatientGlucose.h>

@interface GlucoseCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeFrameLabel;
@property (weak, nonatomic) IBOutlet UILabel *glucoseLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *insulinLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbohydratesLabel;


-(void) configureWith:(PatientGlucose *)patientGlucose;

@end
