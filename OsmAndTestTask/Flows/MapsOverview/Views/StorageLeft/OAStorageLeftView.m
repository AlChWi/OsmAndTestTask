//
//  OAStorageLeftView.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OAStorageLeftView.h"

#define kDeviceMemoryString     @"Device memory"
#define kSpaceFreeFormatString  @"Free %.*f %@"
#define kGBString               @"Gb"
#define kMBString               @"Mb"
#define kStorageNumberPrecision 2

@interface OAStorageLeftView ()

@property(nonatomic, strong, nonnull) UIProgressView *progressView;
@property(nonatomic, strong, nonnull) UILabel *deviceMemoryLabel;
@property(nonatomic, strong, nonnull) UILabel *memoryFreeLabel;

@end


@implementation OAStorageLeftView

@synthesize configuration;

/// Initializes OAStorageLeftView with storage values set to 0
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.spaceAvailable = 0;
        self.spaceInTotal = 0;
        [self configureSubviews];
    }
    return self;
}

/// Initializes OAStorageLeftView with storage values set to 0
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.spaceAvailable = 0;
        self.spaceInTotal = 0;
        [self configureSubviews];
    }
    return self;
}

/// Initializes OAStorageLeftView
///
/// @param spaceInTotal total storage capacity (in megabytes)
/// @param spaceAvailable total storage - space taken (in megabytes)
- (instancetype)initWithFrame:(CGRect) frame
                 spaceInTotal:(double) spaceInTotal
               spaceAvailable:(double) spaceAvailable {
    self = [super initWithFrame:frame];
    if (self) {
        self.spaceAvailable = spaceAvailable;
        self.spaceInTotal = spaceInTotal;
        [self configureSubviews];
    }
    return self;
}

/// Sets available storage value and recalculates 'ProgressView' progress
- (void)setSpaceAvailable:(double)spaceAvailable {
    _spaceAvailable = spaceAvailable;
    if (_spaceAvailable > 1000) {
        
    } else {
        
    }
    [self recalculateProgress];
}

/// Sets total storage value and recalculates 'ProgressView' progress
- (void)setSpaceInTotal:(double)spaceInTotal {
    _spaceInTotal = spaceInTotal;
    [self recalculateProgress];
}

/// Sets 'spaceAvailable' and 'spaceInTotal' according to the configuration and recalculates 'progressView' progress
- (void)setupWithConfiguration:(OAStorageLeftViewConfiguration *)configuration {
    _spaceAvailable = configuration.spaceAvailable;
    _spaceInTotal = configuration.spaceInTotal;
    [self recalculateProgress];
}

/// Updates 'ProgressView' progress using current 'spaceInTotal' and 'spaceAvailable' values
- (void)recalculateProgress {
    [self.progressView setProgress:(self.spaceInTotal - self.spaceAvailable)/self.spaceInTotal];
    if (self.spaceAvailable > 1024) {
        NSString *text = [[NSString alloc] initWithFormat:kSpaceFreeFormatString,
                          kStorageNumberPrecision,
                          self.spaceAvailable / 1024,
                          kGBString];
        [self.memoryFreeLabel setText:text];
    } else {
        NSString *text = [[NSString alloc] initWithFormat:kSpaceFreeFormatString,
                          kStorageNumberPrecision,
                          self.spaceAvailable,
                          kMBString];
        [self.memoryFreeLabel setText:text];
    }
}

/// Configures subviews and constraints
- (void)configureSubviews {
    self.deviceMemoryLabel = [UILabel new];
    [self.deviceMemoryLabel setText:kDeviceMemoryString];
    [self.deviceMemoryLabel setFont:[UIFont systemFontOfSize:13]];
    self.deviceMemoryLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.deviceMemoryLabel];
    
    self.memoryFreeLabel = [UILabel new];
    [self.memoryFreeLabel setFont:[UIFont systemFontOfSize:13]];
    self.memoryFreeLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.memoryFreeLabel setTextAlignment:NSTextAlignmentRight];
    [self addSubview:self.memoryFreeLabel];

    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.progressView];
    
    NSArray<NSLayoutConstraint*> *constraints = @[
        [self.deviceMemoryLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16],
        [self.deviceMemoryLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:11],
        [self.deviceMemoryLabel.heightAnchor constraintEqualToConstant:16],
        
        [self.memoryFreeLabel.topAnchor constraintEqualToAnchor:self.deviceMemoryLabel.topAnchor],
        [self.memoryFreeLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16],
        [self.memoryFreeLabel.bottomAnchor constraintEqualToAnchor:self.deviceMemoryLabel.bottomAnchor],
        
        [self.progressView.leadingAnchor constraintEqualToAnchor:self.deviceMemoryLabel.leadingAnchor],
        [self.progressView.topAnchor constraintEqualToAnchor:self.deviceMemoryLabel.bottomAnchor constant:9],
        [self.progressView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16],
        [self.progressView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16],
        [self.progressView.heightAnchor constraintEqualToConstant:16.0]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
    [self recalculateProgress];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath
                              bezierPathWithRoundedRect:self.progressView.bounds
                              cornerRadius:10
    ];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    self.progressView.layer.mask = mask;
}

@end
