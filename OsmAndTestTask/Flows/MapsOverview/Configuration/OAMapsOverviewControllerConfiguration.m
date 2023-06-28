//
//  OAMapsOverviewViewControllerConfiguration.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OAMapsOverviewControllerConfiguration.h"
#import "OAStorageLeftTableViewCell.h"
#import "OARegionDownloadStatusTableViewCell.h"
#import "OAContinentHeaderFooterView.h"

@interface OAMapsOverviewControllerConfiguration ()

@property(nonatomic, strong, nonnull) OARegionsXMLDataParser *parser;
@property(nonatomic, strong, nullable) OARegionsList *regionsList;

@end

@implementation OAMapsOverviewControllerConfiguration

#pragma mark - Initialization

- (instancetype)initWithStorageManager:(DeviceStorageManager *)storageManager
                             xmlParser:(OARegionsXMLDataParser *)xmlParser
                        networkService:(OANetworkService *)networkService
                           coordinator:(OAMapsOverviewCoordinator *)coordinator {
    self = [super init];
    if (self) {
        self.storageManager = storageManager;
        self.coordinator = coordinator;
        self.tableModel = [[OATableViewModel alloc] init];
        
        self.parser = xmlParser;
        [xmlParser parseXMLWithName:@"regions"];
        OARegionsList *list = [xmlParser getParsingResult];
        self.regionsList = list;
        NSArray *continentSections = [self mapRegionsList:list];
        
        // Storage section
        OATableViewModelSection *storageSection = [[OATableViewModelSection alloc] init];
        double totalSpace = [storageManager queryStorageSize];
        double availableSpace = [storageManager queryFreeStorage];
        storageSection.rows = @[[[OAStorageLeftViewConfiguration alloc]
                                 initWithSpaceInTotal:totalSpace
                                 spaceAvailable:availableSpace]];
        
        NSMutableArray *sections = [[NSMutableArray alloc] init];
        [sections addObject:storageSection];
        [sections addObjectsFromArray:continentSections];
        self.tableModel.sections = sections;
    }
    return self;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.tableModel.sections[indexPath.section].rows[indexPath.row] dequeueCellInTableView:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableModel.sections.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableModel.sections[section].rows.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.tableModel.sections[section].header dequeueHeaderInTableView:tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return;
    }
    OARegionsListContinent *continent = self.regionsList.continents[indexPath.section - 1];
    OARegionsListCountry *country = continent.countries[indexPath.row];
    
    OARegionDetailsContinentModel *continentModel = [[OARegionDetailsContinentModel alloc] initWithRegionsListContinent:continent];
    OARegionDetailsCountryModel *countryModel = [[OARegionDetailsCountryModel alloc] initWithRegionsListCountry:country];
    if (country.areas.count > 0) {
        OARegionDetailsControllerConfiguration *configuration = [[OARegionDetailsControllerConfiguration alloc]
                                                                 initWithContinentModel:continentModel
                                                                 countryModel:countryModel
                                                                 areas:country.areas];
        [self.coordinator navigateToRegionDetailsWithConfiguration:configuration];
    } else {
        // Download map
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.tableModel.sections[indexPath.section].rows[indexPath.row] startLoading];
    }
}

#pragma mark - Configuring table view model

- (NSArray<OATableViewModelSection *> *)mapRegionsList:(OARegionsList *)list {
    NSMutableArray *mapped = [[NSMutableArray alloc] init];
    for (OARegionsListContinent *continent in list.continents) {
        OATableViewModelSection *continentSection = [[OATableViewModelSection alloc] init];
        
        continentSection.header = [[OAContinentHeaderConfiguration alloc] initWithRegionName:continent.name];
        NSMutableArray *rows = [[NSMutableArray alloc] initWithCapacity:continent.countries.count];
        
        for (OARegionsListCountry *country in continent.countries) {
            OARegionCellAccessory rowAccessory = country.areas.count > 0 ? OARegionCellAccessoryChevronIcon : OARegionCellAccessoryDownloadIcon;
            OARegionDownloadStatusViewConfiguration *row = [[OARegionDownloadStatusViewConfiguration alloc]
                                                            initWithRegionName:country.name
                                                            accessoryType:rowAccessory
                                                            downloadStatus:OARegionCellDownloadStatusNotLoaded];
            [rows addObject:row];
        }
        continentSection.rows = rows;
        [mapped addObject:continentSection];
    }
    return mapped;
}

@end
