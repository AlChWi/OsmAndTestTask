//
//  OARegionDetailsContinentModel.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsListContinent.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionDetailsContinentModel : NSObject
@property(strong, nonnull, nonatomic) NSString *name;
@property(strong, nullable, nonatomic) NSString *innerDownloadSuffix;
@property(strong, nullable, nonatomic) NSString *innerDownloadPrefix;

- (instancetype)initWithRegionsListContinent:(OARegionsListContinent*)continentModel;
@end

NS_ASSUME_NONNULL_END
