//
//  NSDate+APDateExtension.m
//  MSPatient
//
//  Created by David Benko on 4/1/13.
//
//

#import "NSDate+APDateExtension.h"

@implementation NSDate (APDateExtension)
+(NSDate *)getNextDateForSchedule:(TreatmentSchedule *)schedule andStartingDate:(NSDate *)startingDate {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = [[schedule reminderInterval] intValue];
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:startingDate options:0];
}
+(NSDate *)absoluteDateWithDate:(NSDate *)theDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:theDate];
    [components setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    return [calendar dateFromComponents:components];
}
@end
