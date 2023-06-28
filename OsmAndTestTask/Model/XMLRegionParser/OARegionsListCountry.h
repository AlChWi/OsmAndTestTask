//
//  OARegionsListCountry.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsListCountryArea.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionsListCountry : NSObject
@property(strong, nonnull, nonatomic) NSString *name;
@property(strong, nonatomic) NSMutableArray<OARegionsListCountryArea *> *areas;
@property(strong, nullable, nonatomic) NSString *downloadSuffix;
@property(strong, nullable, nonatomic) NSString *downloadPrefix;
@end

NS_ASSUME_NONNULL_END
