//
//  RegionDownloadStatusTableViewCell.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OARegionDownloadStatusTableViewCell.h"
#import "OARegionDownloadStatusViewConfiguration.h"
#import "UIImage+ProjectIcons.h"
#import "UIColor+ProjectColors.h"

#define kVerticalLabelPadding 11.0f

@interface OARegionDownloadStatusTableViewCell ()

@property(nonatomic, strong, nonnull) UIImageView *accessoryIconImageView;
@property(nonatomic, strong, nonnull) UIImageView *mapIconImageView;
@property(nonatomic, strong, nonnull) UILabel *regionNameLabel;
@property(nonatomic, strong, nonnull) UIProgressView *progressView;

@property(nonatomic, weak, nullable) NSLayoutConstraint *topConstraint;
@property(nonatomic, weak, nullable) NSLayoutConstraint *bottomConstraint;

@end

@implementation OARegionDownloadStatusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)setupWithConfiguration:(OARegionDownloadStatusViewConfiguration*)configuration {
    switch (configuration.downloadStatus) {
        case OARegionCellDownloadStatusNotLoaded:
            [self.mapIconImageView setImage:[UIImage mapIcon]];
            break;
        case OARegionCellDownloadStatusLoaded:
            [self.mapIconImageView setImage:[[UIImage mapIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            break;
    }
    switch (configuration.accessoryType) {
        case OARegionCellAccessoryChevronIcon:
            [self.accessoryIconImageView setImage:[UIImage chevronIcon]];
            break;
        case OARegionCellAccessoryDownloadIcon:
            [self.accessoryIconImageView setImage:[UIImage downloadIcon]];
            break;
    }
    [self.regionNameLabel setText:configuration.regionName];
    if (configuration.isDownloadInProgress) {
        [self showProgressIndicatorAnimated:NO];
    } else {
        [self hideProgressIndicatorAnimated:NO];
    }
}

- (void)configureSubviews {
    self.regionNameLabel = [UILabel new];
    [self.regionNameLabel setText:@"Region Name"];
    self.regionNameLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:self.regionNameLabel];
    
    self.mapIconImageView = [[UIImageView alloc] initWithImage:[UIImage mapIcon]];
    self.mapIconImageView.tintColor = [UIColor systemGreenColor];
    self.mapIconImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:self.mapIconImageView];
    
    self.accessoryIconImageView = [[UIImageView alloc] initWithImage:[UIImage mapIcon]];
    self.accessoryIconImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:self.accessoryIconImageView];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.translatesAutoresizingMaskIntoConstraints = false;
    [self.progressView setHidden:YES];
    [self addSubview:self.progressView];
    
    self.bottomConstraint = [self.regionNameLabel.bottomAnchor
                             constraintEqualToAnchor:self.contentView.bottomAnchor
                             constant:-kVerticalLabelPadding];
    self.topConstraint = [self.regionNameLabel.topAnchor
                          constraintEqualToAnchor:self.contentView.topAnchor
                          constant:kVerticalLabelPadding];
    
    NSArray<NSLayoutConstraint*> *constraints = @[
        [self.mapIconImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [self.mapIconImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:7],
        [self.mapIconImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-7],
        
        [self.regionNameLabel.leadingAnchor constraintEqualToAnchor:self.mapIconImageView.trailingAnchor constant:16],
        self.topConstraint,
        [self.regionNameLabel.trailingAnchor constraintEqualToAnchor:self.accessoryIconImageView.leadingAnchor],
        self.bottomConstraint,
        
        [self.accessoryIconImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:7],
        [self.accessoryIconImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16],
        [self.accessoryIconImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-7],
        [self.accessoryIconImageView.widthAnchor constraintEqualToConstant:30],
        
        [self.progressView.leadingAnchor constraintEqualToAnchor:self.regionNameLabel.leadingAnchor],
        [self.progressView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-12],
        [self.progressView.trailingAnchor constraintEqualToAnchor:self.accessoryIconImageView.leadingAnchor constant:-28],
        [self.progressView.heightAnchor constraintEqualToConstant:3]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)showProgressIndicatorAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.33 animations:^{
            self.bottomConstraint.constant = -19;
            self.topConstraint.constant = 6;
            [self.progressView setHidden: NO];
            [self layoutIfNeeded];
        }];
    } else {
        self.bottomConstraint.constant = -19;
        self.topConstraint.constant = 6;
        [self.progressView setHidden: NO];
    }
}

- (void)hideProgressIndicatorAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.33 animations:^{
            self.bottomConstraint.constant = -kVerticalLabelPadding;
            self.topConstraint.constant = kVerticalLabelPadding;
            [self.progressView setHidden: YES];
            [self layoutIfNeeded];
        }];
    } else {
        self.bottomConstraint.constant = -kVerticalLabelPadding;
        self.topConstraint.constant = kVerticalLabelPadding;
        [self.progressView setHidden: YES];
    }
}
//- (void)configureOnTapActionWithTarger:(id)target
//                              selector:(SEL)selector {
//    self.onTapSelector = selector;
//    self.onTapSelectorTarget = target;
//}
//
//- (void)triggerTapSelectorWithIndexPath:(NSIndexPath*)indexPath {
//    IMP imp = [self.onTapSelectorTarget methodForSelector:self.onTapSelector];
//    void (*func)(id, SEL, NSIndexPath*) = (void *)imp;
//    func(self.onTapSelectorTarget, self.onTapSelector, indexPath);
//}

@end
