//
//  APRequest.m
//  AnyPresence SDK
//

#define __VERBOSE

#import "APRequest.h"
#import "AnyPresenceAPI.h"
#import "NSString+Inflections.h"
#import "APStringUtils.h"
#import "APService+Internal.h"

@interface APRequest () <NSURLConnectionDataDelegate> {
    
}

@property (nonatomic, strong) NSString * verb;
@property (nonatomic, strong) NSString * stringURL;
@property (nonatomic, strong) NSData * data;
@property (nonatomic, strong) NSDictionary * httpHeaders;
@property (nonatomic, strong) NSString * contentType;
@property (nonatomic, strong) NSURLConnection * connection;
@property (nonatomic, strong) APRequestCallback callback;
@property (nonatomic, strong) NSError * error;
@property (nonatomic, strong) NSMutableData * downloadedData;
@property (nonatomic, strong) id dataSource;
@property (nonatomic, strong) id context;

- (void)reset;
- (NSURLRequest *)request;
- (void)checkResponse:(NSURLResponse *)response error:(NSError **)error;

@end

@implementation APRequest

NSString * const kAPRequestBaseURLException = @"kAPRequestBaseURLException";
NSString * const kAPRequestConcurrentRequestException = @"kAPRequestConcurrentRequestException";
NSString * const kAPRequestErrorDomain = @"APRequest";
NSString * const kAPRequestErrorURLResponseKey = @"resp";
NSString * const kAPRequestErrorStatusCodeKey = @"ss";
NSString * const kAPRequestErrorNotification = @"AnyPresenceSDK:kAPRequestErrorNotification";
NSString * const kAPRequestErrorNotificationErrorKey = @"err";
const NSUInteger kAPRequestErrorServerError = 1;

#pragma mark - Public

- (id)initWithVerb:(APRequestVerb)verb URL:(NSURL *)URL {
    return [self initWithVerb:[[AnyPresenceAPI class] verb:verb]
                          URL:URL
                   dataSource:[AnyPresenceAPI class]];
}

- (id)initWithVerb:(APRequestVerb)verb resource:(NSString *)name query:(NSDictionary *)params {
    
    if (self = [super init]) {
        self.dataSource = [AnyPresenceAPI class];
        self.verb = [self.dataSource verb:verb];
        self.stringURL = [self stringURLTo:name query:params];
    }
    return self;
}

- (id)initWithVerb:(NSString *)verb resource:(NSString *)name query:(NSDictionary *)params dataSource:(id)dataSource {
    
    if (self = [super init]) {
        assert(dataSource);
        self.dataSource = dataSource;
        self.verb = verb;
        self.stringURL = [self stringURLTo:name query:params];
    }
    return self;
}

- (id)initWithVerb:(NSString *)verb URL:(NSURL *)URL dataSource:(id)dataSource {
    if (self = [super init]) {
        self.dataSource = dataSource;
        self.verb = verb;
        self.stringURL = [URL absoluteString];
    }
    return self;
}

- (void)setBaseURL:(NSURL *)URL {
    if (!self.dataSource) {
        [AnyPresenceAPI setBaseURL:URL];
    }
}

- (void)setBody:(NSData *)data as:(NSString *)contentType {
    
    self.data = data;
    
    if (contentType) {
        self.contentType = contentType;
    } else {
        self.contentType = @"application/json";
    }
}

- (NSData *)load:(NSError **)error {
    
    NSURLRequest * request = [self request];
    
#ifdef __VERBOSE
    NSLog(@"\n%@ %@\n%@\n%@", [request HTTPMethod], [[request URL] absoluteString], [request allHTTPHeaderFields], [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding]);
#endif
    
    NSHTTPURLResponse * response;
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:error];

#ifdef __VERBOSE
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
#endif
    
    [self checkResponse:response error:error];
    if (error && *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kAPRequestErrorNotification
                                                            object:@{ kAPRequestErrorNotificationErrorKey: *error }];
    }
    
    return data;
}

- (void)loadAsync:(APRequestCallback)callback {
    
    if (self.connection) {
        @throw [NSException exceptionWithName:kAPRequestConcurrentRequestException
                                       reason:@"Concurrent asynchronous requests not supported"
                                     userInfo:nil];
    }
    
    NSURLRequest * request = [self request];
    
    [self reset];
    self.connection = [[NSURLConnection alloc] initWithRequest:request
                                                      delegate:self
                                              startImmediately:NO];
    
    self.downloadedData = [NSMutableData new];
    self.callback = callback;
    
#ifdef __VERBOSE
    NSLog(@"\n%@ %@\n%@\n%@", [request HTTPMethod], [[request URL] absoluteString], [request allHTTPHeaderFields], [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding]);
#endif
    
    [self.connection start];
}

#pragma mark - NSObject

- (void)dealloc {
    [self abort];
}

- (void)abort {
    [self.connection cancel];
    [self reset];
}

#pragma mark - Private

- (NSURL *)baseURL {
    return [self.dataSource baseURL];
}

- (NSData *)sslCertificateData {
    return [self.dataSource certificate];
}

- (BOOL)isPinningCertificate {
    return (BOOL)[self.dataSource certificate];
}

- (void)resetSSLPinning {
    [self.dataSource resetSSLPinning];
}

- (void)reset {
    self.connection = nil;
    self.downloadedData = nil;
    self.callback = nil;
    self.error = nil;
}

- (NSString *)stringURLTo:(NSString *)resource query:(NSDictionary *)params {
    
    if ([params count] > 0) {
        
        NSMutableArray * kvPairs = [[NSMutableArray alloc] initWithCapacity:params.count];
        
        [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            assert([key isKindOfClass:[NSString class]]);
            NSString *encodedKey = [APStringUtils urlEncodeString:key];
            
            if ([encodedKey isEqualToString:@"query"] && [[self.dataSource class] isSubclassOfClass:[AnyPresenceAPI class]]) {
                for (id pair in [self apQueryKVPairsForKey:key value:obj]) {
                    [kvPairs addObject:pair];
                }
            } else {
                assert([obj isKindOfClass:[NSString class]]);
                NSString *encodedObj = [APStringUtils urlEncodeString:obj];
                [kvPairs addObject:[NSString stringWithFormat:@"%@=%@", encodedKey, encodedObj]];
            }
        }];
        resource = [resource stringByAppendingFormat:@"?%@", [kvPairs componentsJoinedByString:@"&"]];
    }
    
    NSURL *base = [self formatBaseURL:[self.dataSource baseURL]];
    NSString *res = [self formatURLQuery:resource];
    
    return [[base absoluteString] stringByAppendingString:res];
}

- (NSArray *)apQueryKVPairsForKey:(NSString *)key value:(id)value {
    
    NSMutableArray *queryKVPairs = [NSMutableArray array];
    
    if ([value isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *dict = value;
        
        for (id nestedKey in dict.allKeys) {
            
            id nestedValue = [dict objectForKey:nestedKey];
            if (nestedValue) {
                
                NSString *formattedKey = [NSString stringWithFormat:@"%@[%@]", key, nestedKey];
                NSString *evaluatedNestedKey = key ? formattedKey : nestedKey;
                
                [queryKVPairs addObjectsFromArray:[self apQueryKVPairsForKey:evaluatedNestedKey
                                                                       value:nestedValue]];
            }
        }
    } else if ([value isKindOfClass:[NSArray class]]) {
        for (id nestedValue in (NSArray *)value) {
            [queryKVPairs addObjectsFromArray:[self apQueryKVPairsForKey:[NSString stringWithFormat:@"%@[]", key]
                                                                   value:nestedValue]];
        }
    } else if ([value isKindOfClass:[NSSet class]]) {
        for (id obj in (NSSet *)value) {
            [queryKVPairs addObjectsFromArray:[self apQueryKVPairsForKey:key
                                                                   value:obj]];
        }
    } else {
        if (!value) {
            [queryKVPairs addObject:key];
        } else {
            [queryKVPairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
    }
    
    return queryKVPairs;
}

- (NSURL *)formatBaseURL:(NSURL *)baseURL {
    
    NSString *url = [baseURL absoluteString];
    
    if (baseURL && ![url hasSuffix:@"/"]) {
        return [NSURL URLWithString:[url stringByAppendingString:@"/"]];
    }
    
    return baseURL;
}

- (NSString *)formatURLQuery:(NSString *)urlPostfix {
    
    if (urlPostfix && urlPostfix.length > 1 && [urlPostfix hasPrefix:@"/"]) {
        return [urlPostfix substringFromIndex:1];
    }
    
    return urlPostfix;
}

- (NSURLRequest *)request {
    
    NSString *interpolatedURL = [APStringUtils interpolateString:self.stringURL withObject:self.context];
    NSURL *requestURL = [NSURL URLWithString:interpolatedURL];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    [request setHTTPMethod:self.verb];
    [request setValue:self.contentType forHTTPHeaderField:@"Content-Type"];
    
    for(NSString *key in self.httpHeaders) {
        NSString *value = [APStringUtils interpolateString:[self.httpHeaders valueForKey:key] withObject:self.context];
        [request setValue:value forHTTPHeaderField:key];
    }
    [request setHTTPBody:self.data];
    
    return request;
}

- (void)checkResponse:(NSURLResponse *)response error:(NSError **)error {
    
    NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *)response;
    
    if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
        if (httpResponse.statusCode < 200 || httpResponse.statusCode >= 300) {
            *error = [NSError errorWithDomain:kAPRequestErrorDomain
                                         code:kAPRequestErrorServerError
                                     userInfo:@{ kAPRequestErrorURLResponseKey: response, kAPRequestErrorStatusCodeKey: @(httpResponse.statusCode), NSLocalizedDescriptionKey: [[NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode] titleize] }];
        }
    }
    else if (*error) {
        if ([*error code] == NSURLErrorUserCancelledAuthentication) {
            *error = [NSError errorWithDomain:kAPRequestErrorDomain
                                         code:kAPRequestErrorServerError
                                     userInfo:@{ kAPRequestErrorStatusCodeKey: [NSNumber numberWithInt:401], NSLocalizedDescriptionKey: [[NSHTTPURLResponse localizedStringForStatusCode:401] titleize], NSUnderlyingErrorKey: *error }];
        }
    }
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    assert(connection = self.connection);
    
#ifdef __VERBOSE
    if ([response isKindOfClass:[NSHTTPURLResponse class]])
        NSLog(@"%ld", (long)((NSHTTPURLResponse *)response).statusCode);
#endif
    
    NSError * error = nil;
    [self checkResponse:response error:&error];
    
    if (error) {
        self.error = error;
        [[NSNotificationCenter defaultCenter] postNotificationName:kAPRequestErrorNotification
                                                            object:self
                                                          userInfo:@{ kAPRequestErrorNotificationErrorKey: error }];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    assert(connection == self.connection);
    
    self.error = error;
    [[NSNotificationCenter defaultCenter] postNotificationName:kAPRequestErrorNotification
                                                        object:self
                                                      userInfo:@{ kAPRequestErrorNotificationErrorKey: self.error }];
    self.callback(nil, self.error);
    [self reset];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    assert(connection == self.connection);
    [self.downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    assert(connection == self.connection);
    
#ifdef __VERBOSE
    NSLog(@"%@", [[NSString alloc] initWithData:self.downloadedData encoding:NSUTF8StringEncoding]);
#endif
    
    self.callback(self.downloadedData, self.error);
    [self reset];
}

#pragma mark - NSURLConnection Pinning methods

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)space {
    return [space.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
    SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
    
    // Check if certificate pinning is enabled/disabled
    if ([self isPinningCertificate]) {
        
        if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
            
            (void)SecTrustEvaluate(serverTrust, NULL);
            
            SecCertificateRef remoteCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0);
            CFDataRef remoteCertificateData = SecCertificateCopyData(remoteCertificate);

            BOOL certificatesMatch = [[self sslCertificateData] isEqualToData:(__bridge NSData *)remoteCertificateData];
            CFRelease(remoteCertificateData);

            if (certificatesMatch) {
                NSURLCredential *credential = [NSURLCredential credentialForTrust:serverTrust];
                [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
                return;
            }
        }

        NSLog(@"SSL certificates do not match.  Please make sure the certificate is not expired.");
        [challenge.sender cancelAuthenticationChallenge:challenge];
        return;
    }
    else {
        NSURLCredential *credential = [NSURLCredential credentialForTrust:serverTrust];
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        return;
    }
}

@end
