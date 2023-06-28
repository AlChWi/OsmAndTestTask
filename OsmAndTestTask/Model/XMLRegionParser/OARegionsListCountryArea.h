//
//  OARegionsListCountryArea.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OARegionsListCountryArea : NSObject
@property(strong, nonnull, nonatomic) NSString *name;
@property(strong, nullable, nonatomic) NSString *downloadSuffix;
@property(strong, nullable, nonatomic) NSString *downloadPrefix;
@end

NS_ASSUME_NONNULL_END
