//
//  OARegionDetailsCountryModel.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionsListCountry.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionDetailsCountryModel : NSObject
@property(strong, nonnull, nonatomic) NSString *name;
@property(strong, nullable, nonatomic) NSString *innerDownloadSuffix;
@property(strong, nullable, nonatomic) NSString *innerDownloadPrefix;

- (instancetype)initWithRegionsListCountry:(OARegionsListCountry*)countryModel;
@end

NS_ASSUME_NONNULL_END
