//
//  NSString+LACJSONPath.h
//  Lacona
//
//  Created by Brandon Horst on 10/3/13.
//  Copyright (c) 2013 Brandon Horst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (APLACJSONPath)

-(NSString*) parseWithJSONPath:(NSString*)jsonPath;

@end

@interface NSArray (APLACJSONPath)

-(NSString*) parseWithJSONPath:(NSString*)jsonPath;

@end
