//
//  AnyPresenceAPI.m
//  AnyPresence SDK
//

#import "AnyPresenceAPI.h"
#import "APService+Internal.h"
#import "APRequest.h"

@implementation AnyPresenceAPI

static NSURL * __baseURL;
static NSData * __certificate;

#pragma mark - Setters

+ (void)setBaseURL:(NSURL *)url {
    __baseURL = url;
}

+ (void)setSSLCertificate:(NSString *)path {
    __certificate = [super certificatePathToData:path dataSource:self];
}

+ (void)setBaseURL:(NSURL *)url withSSLCertificatePath:(NSString *)path {
    __baseURL = url;
    __certificate = [super certificatePathToData:path dataSource:self];
}

#pragma mark - Getters

+ (NSURL *)baseURL {
    
    if (!__baseURL) {
        @throw [NSException exceptionWithName:kAPRequestBaseURLException
                                       reason:@"AnyPresenceAPI base URL is not set.  Use [AnyPresenceAPI setBaseURL:(NSURL *)URL] to set base URL."
                                     userInfo:nil];
    }
    
    return __baseURL;
}

+ (NSData *)certificate {
    return __certificate;
}

+ (NSDictionary *)httpHeaders {
    return nil;
}

+ (NSDictionary *)urlParameters {
    return nil;
}

#pragma mark - Helpers

+ (void)resetSSLPinning {
    __certificate = nil;
}

#pragma mark - Requests

+ (NSString *)verb:(APRequestVerb)verb {
    
    switch (verb) {
        case kAPRequestVerbCreate:
            return @"POST";
        case kAPRequestVerbRead:
            return @"GET";
        case kAPRequestVerbUpdate:
            return @"PUT";
        case kAPRequestVerbDelete:
            return @"DELETE";
    }
    
    assert(NO);
}

@end
