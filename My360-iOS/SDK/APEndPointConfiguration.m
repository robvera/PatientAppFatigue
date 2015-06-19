//
//  APEndPointConfiguration.m
//  AnyPresence SDK
//

#import "APEndPointConfiguration.h"

@implementation APEndPointConfiguration

- (NSString *)contentType {
    
    switch (self.serializationFormat) {

        case APSerializationFormatJSON:
            return @"application/json";
        case APSerializationFormatXML:
            return @"application/xml";
        case APSerializationFormatURLEncoded:
            return @"application/x-www-form-urlencoded";
    }
}

@end
