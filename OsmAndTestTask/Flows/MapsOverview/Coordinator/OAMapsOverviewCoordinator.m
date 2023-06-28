//
//  OAMapsOverviewCoordinator.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "UIKit/UIKit.h"
#import "OAMapsOverviewCoordinator.h"
#import "OARegionDetailsControllerBuilder.h"


@interface OAMapsOverviewCoordinator ()
@property(nonatomic, strong, nonnull) UINavigationController *navigationController;
@end

@implementation OAMapsOverviewCoordinator

#pragma mark - Initializers

- (instancetype)initWithNavigationController:(UINavigationController*)navigationController {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}

#pragma mark - Navigating to other screens

- (void)navigateToRegionDetailsWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration {
    UIViewController *viewController = [OARegionDetailsControllerBuilder makeWithConfiguration:configuration];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
