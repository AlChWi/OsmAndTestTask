//
//  OATableViewModelSection.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OATableViewModelSection<CellConfiguration, HeaderConfiguration> : NSObject

@property(nonatomic, strong, nullable) HeaderConfiguration header;
@property(nonatomic, strong, nonnull) NSArray<CellConfiguration> *rows;

@end

NS_ASSUME_NONNULL_END
