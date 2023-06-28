//
//  DeviceStorageManager.h
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceStorageManager : NSObject

+ (instancetype)shared;

- (double)queryFreeStorage;
- (double)queryStorageSize;

@end

NS_ASSUME_NONNULL_END
