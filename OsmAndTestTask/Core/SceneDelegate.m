//
//  SceneDelegate.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "SceneDelegate.h"
#import "UINavigationBarAppearance+CustomAppearance.h"
#import "OAMapsOverviewViewController.h"
#import "OAMapsOverviewControllerConfiguration.h"
#import "OARegionsXMLDataParser.h"
#import "OANetworkService.h"

@interface SceneDelegate ()

@end


@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene* windowScene = (UIWindowScene *)scene;
    
    if (windowScene) {
        UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
        // Theme setup
        [UINavigationBarAppearance setCustomAppearance];
        // Navigation
        UINavigationController *navigationController = [[UINavigationController alloc] init];
        OAMapsOverviewCoordinator *coordinator = [[OAMapsOverviewCoordinator alloc] initWithNavigationController:navigationController];
        // Network
        OANetworkService *networkService = [OANetworkService shared];
        // Initial controller creation
        OAMapsOverviewControllerConfiguration *configuration = [[OAMapsOverviewControllerConfiguration alloc]
                                                                initWithStorageManager:[DeviceStorageManager shared]
                                                                xmlParser:[OARegionsXMLDataParser shared]
                                                                networkService:networkService
                                                                coordinator:coordinator];
        OAMapsOverviewViewController *viewController = [[OAMapsOverviewViewController alloc]
                                                        initWithConfiguration:configuration];
        
        [navigationController pushViewController:viewController animated:NO];
        
        window.rootViewController = navigationController;
        self.window = window;
        [window makeKeyAndVisible];
    }
}


@end
