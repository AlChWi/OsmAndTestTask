//
//  ViewController.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <UIKit/UIKit.h>
#import "OAMapsOverviewControllerConfiguration.h"

/// Displays all regions available for download and remaining device storage
@interface OAMapsOverviewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/// Initializes an instance of OAMapsOverviewViewController
/// @param configuration - a configuration that will be used for determining the behavior of the view controller
- (instancetype)initWithConfiguration:(OAMapsOverviewControllerConfiguration*)configuration;

@end

