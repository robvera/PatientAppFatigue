//
//  PIKCommon.m
//  My360-iOS
//
//  Created by Savio Vaz on 4/23/14.
//
//

#import "PIKCommon.h"
#import "UIColor+APColorExtension.h"
@implementation PIKCommon
static PIKCommon *sharedInstance = nil;



- (void) popLayerMessageWithInterval:(UIView*) view message:(NSString *)message NSTimeInterval:(NSTimeInterval ) interval CGRect: (CGRect) frame{
//    CGRect frame = CGRectMake(0.0,3.0,320.0,80.0);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.layer.cornerRadius = 7;
    v.layer.masksToBounds = YES;
    v.backgroundColor= [UIColor navBarBlue];  //[UIColor blueColor];
    v.hidden = NO;
    v.alpha = 1.0f;
    UITextView *t = [[UITextView alloc] initWithFrame:CGRectMake(5.0,5.0,310.0,70.0)];
    t.layer.cornerRadius = 7;
    t.layer.masksToBounds = YES;
    t.backgroundColor=[UIColor whiteColor];
    t.text = message;
    [v addSubview:t];
    [view addSubview:v];
    
    
//    [UIView animateWithDuration:3.0 animations:^{
//        // Animate the alpha value of your imageView from 1.0 to 0.0 here
//        v.alpha = 0.0f;
//    }];
//    v.hidden = YES;
//    [v removeFromSuperview ];

    // Then fades it away after 9 seconds (the cross-fade animation will take 0.5s)
    [UIView animateWithDuration:interval delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        // Animate the alpha value of your imageView from 1.0 to 0.0 here
        v.alpha = 0.0f;
    } completion:^(BOOL finished) {
        // Once the animation is completed and the alpha has gone to 0.0, hide the view for good
        v.hidden = YES;
        [v removeFromSuperview ];
    }];
    
    

    
}


-(void) popLayerMessageWithInterval:(UIView*) view message:(NSString *)message NSTimeInterval:(NSTimeInterval ) interval{


    CGRect frame = CGRectMake(0.0,3.0,320.0,80.0);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.layer.cornerRadius = 7;
    v.layer.masksToBounds = YES;
    v.backgroundColor= [UIColor navBarBlue];  //[UIColor blueColor];
    v.hidden = NO;
    v.alpha = 1.0f;
    UITextView *t = [[UITextView alloc] initWithFrame:CGRectMake(5.0,5.0,310.0,70.0)];
    t.layer.cornerRadius = 7;
    t.layer.masksToBounds = YES;
    t.backgroundColor=[UIColor whiteColor];
    t.text = message;
    [v addSubview:t];
    [view addSubview:v];
    
    // Then fades it away after 21 seconds (the cross-fade animation will take 0.5s)
    [UIView animateWithDuration:1.0 delay:interval options:UIViewAnimationOptionCurveLinear animations:^{
        // Animate the alpha value of your imageView from 1.0 to 0.0 here
        v.alpha = 0.0f;
//         v.hidden = YES;
    } completion:^(BOOL finished) {
        // Once the animation is completed and the alpha has gone to 0.0, hide the view for good
        v.hidden = YES;
        [v removeFromSuperview ];
    }];
    

    
}

-(BOOL) popLayerMessage:(UIView*) view message:(NSString *)message{
    
    CGRect frame = CGRectMake(0.0,3.0,320.0,80.0);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.layer.cornerRadius = 7;
    v.layer.masksToBounds = YES;
    v.backgroundColor= [UIColor navBarBlue];  //[UIColor blueColor];
    v.hidden = NO;
    v.alpha = 1.0f;
    UITextView *t = [[UITextView alloc] initWithFrame:CGRectMake(5.0,5.0,310.0,70.0)];
    t.layer.cornerRadius = 7;
    t.layer.masksToBounds = YES;
    t.backgroundColor=[UIColor whiteColor];
    t.text = message;
    [v addSubview:t];
    [view addSubview:v];
    
    // Then fades it away after 21 seconds (the cross-fade animation will take 0.5s)
    [UIView animateWithDuration:1.0 delay:3.0 options:0 animations:^{
        // Animate the alpha value of your imageView from 1.0 to 0.0 here
        v.alpha = 0.0f;
    } completion:^(BOOL finished) {
        // Once the animation is completed and the alpha has gone to 0.0, hide the view for good
        v.hidden = YES;
        [v removeFromSuperview ];
    }];
    
    
    return NO;
}
- (NSString *) formatPhone:(UITextField *) textField   shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSCharacterSet *numSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789-() "];
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    long charCount = [newString length];
    if ([newString rangeOfCharacterFromSet:[numSet invertedSet]].location != NSNotFound
        || [string rangeOfString:@")"].location != NSNotFound
        || [string rangeOfString:@"("].location != NSNotFound
        || [string rangeOfString:@"-"].location != NSNotFound
        || charCount > 14) {
//        return NO ;
        //            - ios cleanup svaz 1/20/15
        return @"" ;
        
    }
    if (![string isEqualToString:@""])
    {
        if (charCount == 1)
        {
            newString = [NSString stringWithFormat:@"(%@", newString];
        }
        else if(charCount == 4)
        {
            newString = [newString stringByAppendingString:@")"];
        }
        else if(charCount == 5)
        {
            newString = [NSString stringWithFormat:@"%@) %@", [newString substringToIndex:4], [newString substringFromIndex:4]];
        }
        else if(charCount == 6)
        {
            newString = [NSString stringWithFormat:@"%@ %@", [newString substringToIndex:5], [newString substringFromIndex:5]];
        }
        
        else if (charCount == 9)
        {
            newString = [newString stringByAppendingString:@"-"];
        }
        else if(charCount == 10)
        {
            newString = [NSString stringWithFormat:@"%@-%@", [newString substringToIndex:9], [newString substringFromIndex:9]];
        }
    }
    textField.text = newString;
 
    return newString;

}

- (void) printObjectContents:(id) object{
    
    
    unsigned int numberOfProperties = 0;
    objc_property_t *propertyArray = class_copyPropertyList([object class], &numberOfProperties);
    
    for (NSUInteger i = 0; i < numberOfProperties; i++)
    {
        objc_property_t property = propertyArray[i];
        NSString *name = [[NSString alloc] initWithUTF8String:property_getName(property)];
        NSString *attributesString = [[NSString alloc] initWithUTF8String:property_getAttributes(property)];
        NSLog(@"Property %lu:= %@ is of type=:= %@  ",(unsigned long)i, name, attributesString  );
        NSLog(@"-----------------------------------------------");
          //[self valueForKey:name]
    }
     free(propertyArray);
    
}


#pragma mark - object methods
+ (PIKCommon *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance= [[super allocWithZone:nil] init];
    });
    
    return sharedInstance;
}


- (id)init
{
    self = [super init];
    
    if (self) {
        
        
    }
    
    return self;
}

- (BOOL) validatePhone:(NSString*)number
{

    NSString *numberRegEx =@"^(\\([0-9]{3})\\) [0-9]{3}-[0-9]{4}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx];
    if ([numberTest evaluateWithObject:number] == YES)
        return YES;
    else
        return NO;
}



- (BOOL) validateEmail: (NSString *) email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

//-(BOOL) ipadSize{
//   
//        UIScrollView* scrollView= [self.view.subviews lastObject];
//        UIView *view1 = [scrollView.subviews objectAtIndex:0];
//        NSLog(@"---View=1 %@", view1);
//        //    UIView* contentView= [[UIView alloc] initWithFrame:view1.bounds];
//        //    for (UIView *v  in view1.subviews) {
//        //        NSLog(@"View== %d, %@",v.tag, v);
//        //    }
//        
//        //view1.layer.transform = CATransform3DMakeScale(2.0, 2.0, 1);
//        view1.layer.transform = CATransform3DMakeScale(768.0/320.0,1024/480.0 , 1);
//
//
//}

@end
