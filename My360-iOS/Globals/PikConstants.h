//
//  PikConstants.h
//  MSPatient
//
//  Created by Agustin Echeandia on 2/27/13.
//
//

#import <Foundation/Foundation.h>

@interface PikConstants : NSObject


extern NSInteger const kSmallFontSize;
extern NSInteger const kMediumFontSize;
extern NSInteger const kLargeFontSize;
extern NSInteger const kListLength;
extern NSString *kDateFormat;
extern NSString *kTimeFormat;
extern NSString *kDateTimeFormat;
extern NSString * const kFieldPlaceHolderText;
extern NSString * const kErrorCodeSS;
extern CGFloat const kRowHeight;

typedef NS_ENUM(NSInteger, CurrentApp) {
    MS = 1,
    MS2 = 2,
    MM = 3,
    COPD = 4,
    Diabetes = 5,
    RA = 6,
    HepC = 7,
    Asthma = 8,
    PD = 9,
    IPF = 10,
    BC = 11,
    PPA = 12,
    AAPA = 13,
    MDD = 14,
    MDSAML = 15,
    PC = 16,
    NSCLC = 17
};
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IPAD_Cell_Frame CGRectMake(0,0,768,44)
#define IPHONE_Cell_Frame CGRectMake(0,0,320,44)

@end
