//
//  OAMapZipDownloadRequestDelegate.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// An entity that should be notified about download task progress
@protocol OAMapZipDownloadRequestDelegate <NSObject>
@required
/// This function will be called periodically to indicate task overall task progress
/// @param request a request that is executing
/// @param bytesWritten bytes written since last call
/// @param totalBytes total number of bytes expected to write
- (void)mapZipDownloadRequest:(OAMapZipDownloadRequest *)request didWriteData:(int64_t)bytesWritten bytesExpectedToWrite:(int64_t)totalBytes;

/// This function gets called once the request is complete
/// @param request a request that was executed
/// @param location location to which data was written
- (void)mapZipDownloadRequest:(OAMapZipDownloadRequest *)request didFinishWritingDataToLocation:(NSURL *)location;

@end

NS_ASSUME_NONNULL_END
