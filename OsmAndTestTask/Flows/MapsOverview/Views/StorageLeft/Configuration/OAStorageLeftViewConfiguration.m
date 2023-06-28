//
//  OAStorageLeftViewConfiguration.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OAStorageLeftViewConfiguration.h"
#import "OAStorageLeftTableViewCell.h"

@implementation OAStorageLeftViewConfiguration

- (instancetype)initWithSpaceInTotal:(double)spaceInTotal spaceAvailable:(double)spaceAvailable {
    self = [super init];
    if (self) {
        self.spaceInTotal = spaceInTotal;
        self.spaceAvailable = spaceAvailable;
    }
    return self;
}

- (nonnull UITableViewCell *)dequeueCellInTableView:(nonnull UITableView *)tableView {
    OAStorageLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OAStorageLeftTableViewCell class])];
    OAStorageLeftViewConfiguration *configuration = [[OAStorageLeftViewConfiguration alloc] initWithSpaceInTotal:self.spaceInTotal spaceAvailable:self.spaceAvailable];
    [cell setupWithConfiguration:configuration];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

@end
