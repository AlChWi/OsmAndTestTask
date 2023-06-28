//
//  DeviceStorageManager.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "DeviceStorageManager.h"

@implementation DeviceStorageManager

+ (instancetype)shared {
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (double)queryFreeStorage {
    NSError *error;

    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attr = [fm attributesOfFileSystemForPath:@"/"
                                                     error:&error];
    
    NSLog(@"Attr: %@", attr);
    float totalsizeGb = [[attr objectForKey:NSFileSystemSize]floatValue] / 1000 / 1000;
    NSLog(@" size in GB %.2f",totalsizeGb);
    
    float freesizeGb = [[attr objectForKey:NSFileSystemFreeSize]floatValue] / 1000 / 1000;
    NSLog(@" size in GB %.2f",freesizeGb);
    return [[attr objectForKey:NSFileSystemFreeSize]floatValue] / 1000 / 1000;
}

- (double)queryStorageSize {
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attr = [fm attributesOfFileSystemForPath:@"/"
                                                     error:&error];
    NSLog(@"Attr: %@", attr);
    return [[attr objectForKey:NSFileSystemSize]floatValue] / 1000 / 1000;
}

@end
