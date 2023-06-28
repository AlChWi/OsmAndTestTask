//
//  OAStorageLeftView.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import <UIKit/UIKit.h>
#import "OAStorageLeftViewConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface OAStorageLeftView : UIView <UIContentView>

@property(nonatomic) double spaceAvailable;
@property(nonatomic) double spaceInTotal;


- (instancetype)initWithFrame:(CGRect) frame
                 spaceInTotal:(double) spaceInTotal
               spaceAvailable:(double) spaceAvailable;

- (void)setupWithConfiguration:(OAStorageLeftViewConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END
