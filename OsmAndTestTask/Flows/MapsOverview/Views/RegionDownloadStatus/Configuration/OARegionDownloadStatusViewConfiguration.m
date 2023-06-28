//
//  OARegionDownloadStatusViewConfiguration.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OARegionDownloadStatusViewConfiguration.h"
#import "OARegionDownloadStatusTableViewCell.h"

@interface OARegionDownloadStatusViewConfiguration ()

@property(nonatomic, weak, nullable) OARegionDownloadStatusTableViewCell *cell;

@end

@implementation OARegionDownloadStatusViewConfiguration

#pragma mark - Initialization

- (instancetype)initWithRegionName:(NSString*)regionName
                     accessoryType:(OARegionCellAccessory)accessoryType
                    downloadStatus:(OARegionCellDownloadStatus)downloadStatus {
    self = [super init];
    if (self) {
        self.regionName = regionName;
        self.accessoryType = accessoryType;
        self.downloadStatus = downloadStatus;
        self.isDownloadInProgress = NO;
    }
    return self;
}

#pragma mark - Dequeueing

- (nonnull UITableViewCell *)dequeueCellInTableView:(nonnull UITableView *)tableView {
    OARegionDownloadStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OARegionDownloadStatusTableViewCell class])];
    [cell setupWithConfiguration:self];
    self.cell = cell;
    
    return cell;
}

#pragma mark - Map download

- (void)startLoading {
    [self.cell showProgressIndicatorAnimated:YES];
    self.isDownloadInProgress = YES;
}

@end
