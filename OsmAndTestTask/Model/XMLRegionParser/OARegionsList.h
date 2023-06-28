//
//  OARegionsList.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsListContinent.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionsList : NSObject
@property(strong, nonatomic) NSMutableArray<OARegionsListContinent *> *continents;
@end

NS_ASSUME_NONNULL_END
