//
//  UIStoryboard+Definition.m
//  My360-iOS
//
//  Created by Agustin Echeandia on 12/27/13.
//
//

#import "UIStoryboard+Definition.h"
#import "ConfigurationManager.h"
#import "PikConstants.h"

@implementation UIStoryboard (Definition)


+ (UIStoryboard *)mainStoryboard {
    
    UIStoryboard *storyBoard;
    
    switch ([[[ConfigurationManager sharedManager] appID] integerValue] ) {
        case MS:
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard" bundle:nil];
            } else {
//                storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard-iPad" bundle:nil];            }
            storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard" bundle:nil];
            }
            
            break;
        case Diabetes:
            storyBoard = [UIStoryboard storyboardWithName:@"DiabetesAppMainStoryboard" bundle:nil];
            break;
        case COPD:
             storyBoard = [UIStoryboard storyboardWithName:@"COPDAppMainStoryboard" bundle:nil];
            break;
        case MM:
            storyBoard = [UIStoryboard storyboardWithName:@"MMAppMainStoryboard" bundle:nil];
            break;
        case RA:
            storyBoard = [UIStoryboard storyboardWithName:@"RAAppMainStoryboard" bundle:nil];
            break;
        case HepC:
            storyBoard = [UIStoryboard storyboardWithName:@"HepCAppMainStoryboard" bundle:nil];
            break;
        case PD:
            storyBoard = [UIStoryboard storyboardWithName:@"PDAppMainStoryboard" bundle:nil];
            break;
        case IPF:
            storyBoard = [UIStoryboard storyboardWithName:@"IPFAppMainStoryboard" bundle:nil];
            break;
        case Asthma:
            storyBoard = [UIStoryboard storyboardWithName:@"AsthmaAppMainStoryboard" bundle:nil];
            break;
        case AAPA:
             storyBoard = [UIStoryboard storyboardWithName:@"AAPAsthmaAppMainStoryboard" bundle:nil];
            break;
        case BC:
            storyBoard = [UIStoryboard storyboardWithName:@"BCAppMainStoryboard" bundle:nil];
            break;
        case MDD:
            storyBoard = [UIStoryboard storyboardWithName:@"MDDAppMainStoryboard" bundle:nil];
            break;
        case MDSAML:
            storyBoard = [UIStoryboard storyboardWithName:@"MDSAMLAppMainStoryboard" bundle:nil];
            break;
        case NSCLC:
            storyBoard = [UIStoryboard storyboardWithName:@"NSCLCAppMainStoryboard" bundle:nil];
            break;
            
        default:
            storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard" bundle:nil];
            break;
    }
    
//    if ([[[ConfigurationManager sharedManager] appID] integerValue] == MS) {
//        storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == Diabetes) {
//        storyBoard = [UIStoryboard storyboardWithName:@"DiabetesAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == COPD) {
//        storyBoard = [UIStoryboard storyboardWithName:@"COPDAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == MM) {
//        storyBoard = [UIStoryboard storyboardWithName:@"MMAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == RA) {
//        storyBoard = [UIStoryboard storyboardWithName:@"RAAppMainStoryboard" bundle:nil];
//        
//    }
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == HepC) {
//    storyBoard = [UIStoryboard storyboardWithName:@"HepCAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == PD) {
//        storyBoard = [UIStoryboard storyboardWithName:@"PDAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == IPF) {
//        storyBoard = [UIStoryboard storyboardWithName:@"IPFAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == Asthma) {
//        storyBoard = [UIStoryboard storyboardWithName:@"AsthmaAppMainStoryboard" bundle:nil];
//    }
//    
//    else if ([[[ConfigurationManager sharedManager] appID] integerValue] == AAPA) {
//        storyBoard = [UIStoryboard storyboardWithName:@"AAPAsthmaAppMainStoryboard" bundle:nil];
//    }
//    
//    else {
//        storyBoard = [UIStoryboard storyboardWithName:@"MSAppMainStoryboard" bundle:nil];
//    }
    
    return storyBoard;
}


@end
