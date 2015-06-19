//
//  NSData+Serialization.h
//  AnyPresence SDK
//

/*!
 @header NSData+Serialization
 @abstract Serialization category for NSData class
 */

#import <Foundation/Foundation.h>

@class APEndPointConfiguration;

/*!
 @category NSData (Serialization)
 @abstract Adds ability to serialize objects to/from JSON or XML.
 */
@interface NSData (Serialization)

#pragma mark - General serialization

/*!
 @method objectFromSerializationWithConfig:
 @abstract Restores object from XML or JSON.
 @param config Contains field mapping information.
 @result Restored object.
 */
- (id)objectFromSerializationWithConfig:(APEndPointConfiguration *)config;

/*!
 @method objectFromSerializationWithConfig:error:
 @abstract Restores object from XML or JSON.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Restored object.
 */
- (id)objectFromSerializationWithConfig:(APEndPointConfiguration *)config error:(NSError **)error;

/*!
 @method serializedDataFromObject:withConfig:
 @abstract Converts object to XML or JSON.
 @param object Object to be serialized.
 @param config Contains field mapping information.
 @result Binary XML or JSON data.
 */
+ (NSData *)serializedDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config;

/*!
 @method serializedDataFromObject:withConfig:error:
 @abstract Converts object to XML or JSON.
 @param object Object to be serialized.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Binary XML or JSON data.
 */
+ (NSData *)serializedDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error;

#pragma mark - JSON Serialization

/*!
 @method objectFromJSONWithConfig:error:
 @abstract Restores object from JSON.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Restored object.
 */
- (id)objectFromJSONWithConfig:(APEndPointConfiguration *)config error:(NSError **)error;

/*!
 @method jsonDataFromObject:withConfig:error:
 @abstract Converts object to JSON.
 @param object Object to be serialized.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Binary JSON data.
 */
+ (NSData *)jsonDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error;

#pragma mark - XML Serialization

/*!
 @method objectFromXMLWithConfig:error:
 @abstract Restores object from XML.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Restored object.
 */
- (id)objectFromXMLWithConfig:(APEndPointConfiguration *)config error:(NSError **)error;

/*!
 @method xmlDataFromObject:withConfig:error:
 @abstract Converts object to XML.
 @param object Object to be serialized.
 @param config Contains field mapping information.
 @param error Error that occured during conversion, if any.
 @result Binary XML data.
 */
+ (NSData *)xmlDataFromObject:(id)object withConfig:(APEndPointConfiguration *)config error:(NSError **)error;

@end
