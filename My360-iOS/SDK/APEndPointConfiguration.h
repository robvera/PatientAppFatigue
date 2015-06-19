//
//  APEndPointConfiguration.h
//  AnyPresence SDK
//

#import <Foundation/Foundation.h>

enum APSerializationFormat { APSerializationFormatJSON, APSerializationFormatXML, APSerializationFormatURLEncoded };

@interface APEndPointConfiguration : NSObject

@property (nonatomic, assign) enum APSerializationFormat serializationFormat;
@property (nonatomic, strong) NSString *objectsPath;
@property (nonatomic, strong) NSDictionary *localToRemoteFieldPathsDictionary;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *bodyTemplate;
@property (nonatomic, strong) NSString *httpVerb;
@property (nonatomic, strong) NSString *incrementalPath;
@property (nonatomic, strong) NSDictionary *incrementalHttpHeaders;
@property (nonatomic, strong) NSDictionary *incrementalURLParameters;
@property (nonatomic, assign) NSString *limit;
@property (nonatomic, assign) NSString *offset;

@end
