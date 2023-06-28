//
//  OARegionDetailsContinentModel.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionDetailsContinentModel.h"

@implementation OARegionDetailsContinentModel

- (instancetype)initWithRegionsListContinent:(OARegionsListContinent*)continentModel {
    self = [super init];
    if (self) {
        self.name = continentModel.name;
        self.innerDownloadPrefix = continentModel.downloadPrefix;
        self.innerDownloadSuffix = continentModel.downloadSuffix;
    }
    return self;
}

@end
