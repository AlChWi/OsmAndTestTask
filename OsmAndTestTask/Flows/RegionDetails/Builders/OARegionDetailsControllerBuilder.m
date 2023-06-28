//
//  OARegionDetailsControllerBuilder.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionDetailsControllerBuilder.h"

@implementation OARegionDetailsControllerBuilder

+ (OARegionDetailsViewController*)makeWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration {
    OARegionDetailsViewController *controller = [[OARegionDetailsViewController alloc] initWithConfiguration:configuration];
    return controller;
}

@end
