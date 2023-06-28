//
//  OAMapZipDownloadRequest.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>
#import "OAMapZipDownloadRequestURLEncoder.h"

NS_ASSUME_NONNULL_BEGIN

/// A class responsible for creating and monitoring a download task for map files in .zip format
@interface OAMapZipDownloadRequest : NSObject <NSURLSessionDownloadDelegate>

/// Inititalizes OAMapZipDownloadRequest with given session and endpoint
/// @param session a session with which download task will be created
/// @param url endpoint for creating a url request
- (NSURLSessionDownloadTask*)startWithSession:(NSURLSession*)session
                                          url:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END
