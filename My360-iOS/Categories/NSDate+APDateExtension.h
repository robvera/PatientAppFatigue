//
//  NSDate+APDateExtension.h
//  MSPatient
//
//  Created by David Benko on 4/1/13.
//
//

#import <Foundation/Foundation.h>
#import <APSDK/TreatmentSchedule.h>

@interface NSDate (APDateExtension)
/*
 * Returns the appropriate NSDate for next_schedule_on
 * Based on a schedule and a starting date
 */
+(NSDate *)getNextDateForSchedule:(TreatmentSchedule *)schedule andStartingDate:(NSDate *)startingDate;
+(NSDate *)absoluteDateWithDate:(NSDate *)theDate;
@end
