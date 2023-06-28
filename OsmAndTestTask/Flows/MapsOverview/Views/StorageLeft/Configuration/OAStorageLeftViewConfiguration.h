//
//  OAStorageLeftViewConfiguration.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface OAStorageLeftViewConfiguration : NSObject

@property(nonatomic) double spaceAvailable;
@property(nonatomic) double spaceInTotal;


- (instancetype)initWithSpaceInTotal:(double) spaceInTotal
                      spaceAvailable:(double) spaceAvailable;

- (nonnull UITableViewCell *)dequeueCellInTableView:(nonnull UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
