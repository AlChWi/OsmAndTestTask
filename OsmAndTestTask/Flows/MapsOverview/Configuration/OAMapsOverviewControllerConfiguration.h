//
//  OAMapsOverviewViewControllerConfiguration.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "DeviceStorageManager.h"
#import "OARegionDownloadStatusViewConfiguration.h"
#import "OATableViewModel.h"
#import "UIKit/UIKit.h"
#import "OARegionsXMLDataParser.h"
#import "OAMapsOverviewCoordinator.h"
#import "OANetworkService.h"

NS_ASSUME_NONNULL_BEGIN

/// A class that is responsible for configuring the the behavior of a OAMapsOverviewViewController
@interface OAMapsOverviewControllerConfiguration : NSObject
/// A class that will be used for quering information about device storage
@property(nonatomic, strong, nonnull) DeviceStorageManager *storageManager;
/// A class that will be used for determining the layout of the controller
@property(nonatomic, strong, nonnull) OATableViewModel *tableModel;
/// A class that will be used for navigating to other screens
@property(nonatomic, strong, nonnull) OAMapsOverviewCoordinator *coordinator;

/// Initializes an instance of OAMapsOverviewControllerConfiguration
/// @param storageManager - a class that will be used for quering information about device storage
/// @param xmlParser - a class that will be used for parsing the regions list
/// @param networkService - a class that will be used for starting map download tasks
/// @param coordinator - a class that will be used for navigating to other screens
- (instancetype)initWithStorageManager:(DeviceStorageManager *)storageManager
                             xmlParser:(OARegionsXMLDataParser *)xmlParser
                        networkService:(OANetworkService *)networkService
                           coordinator:(OAMapsOverviewCoordinator *)coordinator;

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
