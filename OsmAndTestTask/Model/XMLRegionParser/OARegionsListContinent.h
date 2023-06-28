//
//  OARegionsListContinent.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsListCountry.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionsListContinent : NSObject

@property(strong, nonnull, nonatomic) NSString *name;
@property(nonatomic) BOOL joinMapFiles;
@property(strong, nullable, nonatomic) NSString *downloadSuffix;
@property(strong, nullable, nonatomic) NSString *downloadPrefix;
@property(strong, nonatomic) NSMutableArray<OARegionsListCountry *> *countries;

@end

NS_ASSUME_NONNULL_END
