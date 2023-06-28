//
//  OANetworkService.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OANetworkService.h"
#import "OAMapZipDownloadRequest.h"

@interface OANetworkService ()

@property(nonatomic, strong, nullable) NSMutableArray *runningTasks;
@property(nonatomic, strong, nonnull) NSURLSession *session;

@end

@implementation OANetworkService

#pragma mark - Singleton object

+ (instancetype)shared {
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] initWithSession:[NSURLSession sharedSession]];
    });
    return _sharedObject;
}

#pragma mark - Initializers

- (instancetype)initWithSession:(NSURLSession *)session
{
    self = [super init];
    if (self) {
        self.session = session;
    }
    return self;
}

#pragma mark - Executing requests

- (void)downloadMapForRegion:(NSString *)regionName
                  withPrefix:(NSString *)prefix
                      suffix:(NSString *)suffix {
    self.session = [NSURLSession sharedSession];
    OAMapZipDownloadRequest *request = [[OAMapZipDownloadRequest alloc] init];
    NSURL *testURL = [[NSURL alloc] initWithString:@"http://download.osmand.net/download.php?standard=yes&file=Denmark_europe_2.obf.zip"];
    [request startWithSession:self.session url:testURL];
    [self.runningTasks addObject:request];
}

@end
