//
//  OARegionDetailsViewController.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/27/23.
//

#import "OARegionDetailsViewController.h"
#import "UINavigationBarAppearance+CustomAppearance.h"
#import "UIImage+ProjectIcons.h"
#import "DeviceStorageManager.h"
#import "OARegionDownloadStatusTableViewCell.h"
#import "OAContinentHeaderFooterView.h"

@interface OARegionDetailsViewController ()
@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong, nonnull) OARegionDetailsControllerConfiguration *configuration;
@end

@implementation OARegionDetailsViewController

#pragma mark - Initializers

- (instancetype)initWithConfiguration:(OARegionDetailsControllerConfiguration*)configuration {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.configuration = configuration;
        [self configureSubviews];
    }
    return self;
}

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.configuration.countryModel.name;
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationController.navigationBar.prefersLargeTitles = NO;
        [self.navigationController.view layoutIfNeeded];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

#pragma mark - Creating subviews

- (void)configureSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = UIColor.systemGroupedBackgroundColor;
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.tableView];
    
    // Configure table view
    [self.tableView registerClass:[OARegionDownloadStatusTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OARegionDownloadStatusTableViewCell class])];
    [self.tableView registerClass:[OAContinentHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([OAContinentHeaderFooterView class])];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSArray<NSLayoutConstraint*> *constraints = @[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ];
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.configuration tableView:tableView numberOfRowsInSection:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.configuration tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.configuration tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.configuration tableView:tableView viewForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38;
}

@end
