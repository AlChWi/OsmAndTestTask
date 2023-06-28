//
//  OARegionDetailsCountryModel.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionDetailsCountryModel.h"

@implementation OARegionDetailsCountryModel
- (instancetype)initWithRegionsListCountry:(OARegionsListCountry*)countryModel {
    self = [super init];
    if (self) {
        self.name = countryModel.name;
        self.innerDownloadPrefix = countryModel.downloadPrefix;
        self.innerDownloadSuffix = countryModel.downloadSuffix;
    }
    return self;
}
@end
