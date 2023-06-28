//
//  OAContinentHeaderFooterView.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OAContinentHeaderFooterView.h"
#import "UIColor+ProjectColors.h"

@interface OAContinentHeaderFooterView ()

@property(nonatomic, strong, nonnull) UILabel* titleLabel;

@end

@implementation OAContinentHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    self.titleLabel = [UILabel new];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.titleLabel setText:@"Europe".uppercaseString];
    [self.titleLabel setTextColor:UIColor.secondaryTextColor];
    [self.contentView addSubview:self.titleLabel];
    
    NSArray<NSLayoutConstraint*> *constraints = @[
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-6],
        [self.titleLabel.heightAnchor constraintEqualToConstant:16]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)setupWithConfiguration:(OAContinentHeaderConfiguration*)configuration {
    [self.titleLabel setText:configuration.regionName.uppercaseString];
}

@end
