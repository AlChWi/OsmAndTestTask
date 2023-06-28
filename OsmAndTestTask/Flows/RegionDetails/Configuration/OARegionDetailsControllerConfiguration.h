//
//  OARegionDetailsControllerConfiguration.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionDetailsCountryModel.h"
#import "OARegionDetailsContinentModel.h"
#import "OATableViewModel.h"
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

/// Responsible for configuring the the behavior of a OARegionDetailsViewController
@interface OARegionDetailsControllerConfiguration : NSObject
/// A country model for which subregions will be shown
@property(nonatomic, strong, nonnull) OARegionDetailsCountryModel *countryModel;
/// Continent data to be used for downloading map files
@property(nonatomic, strong, nonnull) OARegionDetailsContinentModel *continentModel;
/// A model that defines the layout of the screen
@property(nonatomic, strong, nonnull) OATableViewModel *tableModel;

/// Creates an instance of OARegionDetailsControllerConfiguration
/// @param continentModel - Continent data to be used for downloading map files
/// @param countryModel - A country model for which subregions will be shown
/// @param areas - subregions of the given country available for download
- (instancetype)initWithContinentModel:(OARegionDetailsContinentModel*)continentModel
                          countryModel:(OARegionDetailsCountryModel*)countryModel
                                 areas:(NSArray<OARegionsListCountryArea*>*)areas;

#pragma mark UITableViewDelegate & UITableViewDataSource methods
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
