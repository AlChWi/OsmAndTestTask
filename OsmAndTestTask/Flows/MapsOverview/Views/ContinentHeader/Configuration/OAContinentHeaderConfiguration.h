//
//  OAContinentHeaderConfiguration.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface OAContinentHeaderConfiguration : NSObject

@property(nonatomic, strong, nonnull) NSString* regionName;

- (instancetype)initWithRegionName:(NSString*)name;
- (UIView*)dequeueHeaderInTableView:(UITableView*)tableView;

@end

NS_ASSUME_NONNULL_END
