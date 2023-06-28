//
//  OARegionDetailsViewController.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <UIKit/UIKit.h>
#import "OARegionDetailsControllerConfiguration.h"

NS_ASSUME_NONNULL_BEGIN
/// A controller responsible for showing different areas of a single country
@interface OARegionDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/// Initializes an instance of OARegionDetailsViewController with the given configuration
/// @param configuration - the configuration to be used for determining the behavior of the controller
- (instancetype)initWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration;

@end

NS_ASSUME_NONNULL_END
