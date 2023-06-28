//
//  OAContinentHeaderConfiguration.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OAContinentHeaderConfiguration.h"
#import "OAContinentHeaderFooterView.h"

@implementation OAContinentHeaderConfiguration

- (instancetype)initWithRegionName:(NSString*)name {
    self = [super init];
    if (self) {
        self.regionName = name;
    }
    return self;
}

- (UIView*)dequeueHeaderInTableView:(UITableView*)tableView {
    OAContinentHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([OAContinentHeaderFooterView class])];
    [header setupWithConfiguration:self];
    return header;
}

@end
