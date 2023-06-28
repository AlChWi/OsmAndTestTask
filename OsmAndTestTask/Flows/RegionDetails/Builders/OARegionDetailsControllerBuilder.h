//
//  OARegionDetailsControllerBuilder.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OARegionDetailsControllerConfiguration.h"
#import "OARegionDetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

/// A builder object responsible for creating instances of OARegionDetailsViewController
@interface OARegionDetailsControllerBuilder : NSObject

/// Creates an instance of OARegionDetailsViewController with the given configuration
+ (OARegionDetailsViewController*)makeWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration;

@end

NS_ASSUME_NONNULL_END
