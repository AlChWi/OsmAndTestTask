//
//  OARegionDetailsControllerConfiguration.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionDetailsControllerConfiguration.h"
#import "OARegionDownloadStatusViewConfiguration.h"
#import "OAContinentHeaderConfiguration.h"

@implementation OARegionDetailsControllerConfiguration

#pragma mark - Initializers

- (instancetype)initWithContinentModel:(OARegionDetailsContinentModel*)continentModel
                          countryModel:(OARegionDetailsCountryModel*)countryModel
                                 areas:(NSArray<OARegionsListCountryArea*>*)areas {
    self = [super init];
    if (self) {
        self.continentModel = continentModel;
        self.countryModel = countryModel;
        self.tableModel = [[OATableViewModel alloc] init];
        
        OATableViewModelSection *regionSection = [[OATableViewModelSection alloc] init];
        NSArray *sections = @[regionSection];
        self.tableModel.sections = sections;
        
        NSMutableArray *rows = [[NSMutableArray alloc] initWithCapacity:areas.count];
        
        for (OARegionsListCountryArea *area in areas) {
            OARegionCellAccessory rowAccessory = OARegionCellAccessoryDownloadIcon;
            OARegionDownloadStatusViewConfiguration *row = [[OARegionDownloadStatusViewConfiguration alloc]
                                                            initWithRegionName:area.name
                                                            accessoryType:rowAccessory
                                                            downloadStatus:OARegionCellDownloadStatusNotLoaded];
            [rows addObject:row];
        }
        regionSection.rows = rows;
        regionSection.header = [[OAContinentHeaderConfiguration alloc] initWithRegionName:@"Regions"];
    }
    return self;
}

#pragma mark UITableViewDelegate & UITableViewDataSource methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.tableModel.sections[indexPath.section].rows[indexPath.row] dequeueCellInTableView:tableView];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableModel.sections[section].rows.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.tableModel.sections[section].header dequeueHeaderInTableView:tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableModel.sections[indexPath.section].rows[indexPath.row] startLoading];
}

@end
