//
//  OANetworkService.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Class responsible for executing requests
@interface OANetworkService : NSObject

/// Singleton object
+ (instancetype)shared;

/// Initializes NetworkService with given session object
- (instancetype)initWithSession:(NSURLSession *)session;

/// Creates and starts executing a download task for given map region
/// @param regionName the name of the region to be downloaded
/// @param prefix the prefix that should be used for the filename
/// @param the suffix that should be used for the filename
- (void)downloadMapForRegion:(NSString *)regionName
                  withPrefix:(NSString *)prefix
                      suffix:(NSString *)suffix;

@end

NS_ASSUME_NONNULL_END
