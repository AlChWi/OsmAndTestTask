//
//  RegionDownloadStatusTableViewCell.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <UIKit/UIKit.h>
#import "OARegionDownloadStatusViewConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface OARegionDownloadStatusTableViewCell : UITableViewCell

- (void)setupWithConfiguration:(OARegionDownloadStatusViewConfiguration *)configuration;

- (void)configureOnTapActionWithTarger:(id)target
                              selector:(SEL)selector;

- (void)triggerTapSelectorWithIndexPath:(NSIndexPath*)indexPath;

- (void)showProgressIndicatorAnimated:(BOOL)animated;

- (void)hideProgressIndicatorAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
