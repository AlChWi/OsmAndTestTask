//
//  OAContinentHeaderFooterView.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <UIKit/UIKit.h>
#import "OAContinentHeaderConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface OAContinentHeaderFooterView : UITableViewHeaderFooterView

- (void)setupWithConfiguration:(OAContinentHeaderConfiguration*)configuration;

@end

NS_ASSUME_NONNULL_END
