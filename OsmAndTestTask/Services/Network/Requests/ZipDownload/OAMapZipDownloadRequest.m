//
//  OAMapZipDownloadRequest.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OAMapZipDownloadRequest.h"
#import "OAMapZipDownloadRequestDelegate.h"

@interface OAMapZipDownloadRequest ()

@property(nonatomic, strong, nonnull) OAMapZipDownloadRequestURLEncoder *encoder;
@property(nonatomic, weak, nullable) id <OAMapZipDownloadRequestDelegate> delegate;

@property(nonatomic, strong, nullable) NSURLSessionDownloadTask *task;

@end

@implementation OAMapZipDownloadRequest

#pragma mark instantiating download task

- (NSURLSessionDownloadTask*)startWithSession:(NSURLSession*)session
                                     url:(NSURL*)url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    task.delegate = self;
    [task resume];
    self.task = task;
    return task;
}

#pragma mark - NSURLDownloadTaskDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    [self.delegate mapZipDownloadRequest:self didWriteData:bytesWritten bytesExpectedToWrite:totalBytesExpectedToWrite];
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location { 
    [self.delegate mapZipDownloadRequest:self didFinishWritingDataToLocation:location];
}

@end
