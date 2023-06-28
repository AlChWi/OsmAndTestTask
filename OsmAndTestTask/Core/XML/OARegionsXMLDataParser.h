//
//  OARegionsXMLDataParser.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsList.h"

NS_ASSUME_NONNULL_BEGIN

/// A class responsible for parsing '.xml' file bundled with the application
@interface OARegionsXMLDataParser : NSObject <NSXMLParserDelegate>

/// Singleton object
+ (instancetype)shared;

/// Start parsing xml file with the given name
/// @param name - name of the xml file to parse
- (void)parseXMLWithName:(NSString *)name;

/// Returns the parsed regions list
- (OARegionsList *)getParsingResult;

@end

NS_ASSUME_NONNULL_END
