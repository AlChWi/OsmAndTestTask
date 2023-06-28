//
//  OAMapsOverviewCoordinator.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionDetailsControllerConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

/// A class responsible for navigation from OAMapsOverviewViewController
@interface OAMapsOverviewCoordinator : NSObject
/// Initializes an instance of OAMapsOverviewViewController
/// @param navigationController - a container controller that will be used for pushing other views
- (instancetype)initWithNavigationController:(UINavigationController*)navigationController;

/// Navigates to an instance of OARegionDetailsViewController
/// @param configuration - a configuration that will be used for determining the behavior of the OARegionDetailsViewController
- (void)navigateToRegionDetailsWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration;

@end

NS_ASSUME_NONNULL_END
