//
//  OATableViewModel.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OATableViewModelSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface OATableViewModel : NSObject

@property(nonatomic, strong, nonnull) NSArray<OATableViewModelSection *> *sections;

@end

NS_ASSUME_NONNULL_END
