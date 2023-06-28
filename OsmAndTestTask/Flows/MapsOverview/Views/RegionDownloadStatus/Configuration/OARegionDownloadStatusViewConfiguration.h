//
//  OARegionDownloadStatusViewConfiguration.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

/// Possible accessory types for the left side of the cell
typedef NS_ENUM(NSUInteger, OARegionCellAccessory) {
    OARegionCellAccessoryDownloadIcon,
    OARegionCellAccessoryChevronIcon
};

/// Possible download states used for coloring the map icon
typedef NS_ENUM(NSUInteger, OARegionCellDownloadStatus) {
    OARegionCellDownloadStatusLoaded,
    OARegionCellDownloadStatusNotLoaded,
};

/// A cell that displays the name of the region and its download progress
@interface OARegionDownloadStatusViewConfiguration : NSObject
/// The name of the region that will be displayed in the label
@property(nonatomic, strong, nonnull) NSString *regionName;
/// An accessory that will be used for the left portion of the cell
@property(nonatomic) OARegionCellAccessory accessoryType;
/// Determines the color of the map icon
@property(nonatomic) OARegionCellDownloadStatus downloadStatus;
/// Used for filtering out redundant requests
@property(nonatomic) BOOL isDownloadInProgress;

/// Initializes an instance of the OARegionDownloadStatusViewConfiguration
/// @param regionName - name of the region that will be displayed
/// @param accessoryType - an accessory that will be used for the left portion of the cell
/// @param downloadStatus - determines the color of the map icon
- (instancetype)initWithRegionName:(NSString*)regionName
                     accessoryType:(OARegionCellAccessory)accessoryType
                    downloadStatus:(OARegionCellDownloadStatus)downloadStatus;

/// Deques an instance of UITableViewCell to be used in the table view
/// @param tableView - a table view from which the cell should be dequeued
- (nonnull UITableViewCell *)dequeueCellInTableView:(nonnull UITableView *)tableView;

- (void)startLoading;

@end

NS_ASSUME_NONNULL_END
