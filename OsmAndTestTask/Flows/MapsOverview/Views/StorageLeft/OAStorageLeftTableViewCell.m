//
//  OAStorageLeftTableViewCell.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OAStorageLeftTableViewCell.h"
#import "OAStorageLeftView.h"

@interface OAStorageLeftTableViewCell ()

@property(nonatomic, strong, nonnull) OAStorageLeftView *storageView;

@end


@implementation OAStorageLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)setupWithConfiguration:(OAStorageLeftViewConfiguration*)configuration {
    [self.storageView setupWithConfiguration:configuration];
}

- (void)configureSubviews {
    self.storageView = [[OAStorageLeftView alloc] initWithFrame:CGRectZero];
    self.storageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addSubview:self.storageView];
    
    NSArray<NSLayoutConstraint*> *constraints = @[
        [self.storageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.storageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.storageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.storageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

@end
