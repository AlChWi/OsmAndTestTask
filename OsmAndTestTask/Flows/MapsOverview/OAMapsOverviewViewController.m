//
//  ViewController.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "OAMapsOverviewViewController.h"
#import "UINavigationBarAppearance+CustomAppearance.h"
#import "OAStorageLeftTableViewCell.h"
#import "OARegionDownloadStatusTableViewCell.h"
#import "OAContinentHeaderFooterView.h"

#define kScreenTitle @"Download Maps"

@interface OAMapsOverviewViewController ()

@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong, nonnull) OAMapsOverviewControllerConfiguration *configuration;

@end

@implementation OAMapsOverviewViewController

#pragma mark - Initialization

- (instancetype)initWithConfiguration:(OAMapsOverviewControllerConfiguration*)configuration {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.configuration = configuration;
    }
    return self;
}

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemGroupedBackgroundColor;
    self.navigationItem.title = kScreenTitle;
    
    [self configureSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    if (path) {
        [self.tableView deselectRowAtIndexPath:path animated:animated];
    }
}

#pragma mark - Configuring subviews

- (void)configureSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = UIColor.systemGroupedBackgroundColor;
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.tableView];
    
    // Configure table view
    [self.tableView registerClass:[OAStorageLeftTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OAStorageLeftTableViewCell class])];
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

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.configuration numberOfSectionsInTableView:tableView];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.configuration tableView:tableView numberOfRowsInSection:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [self.configuration tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.configuration tableView:tableView viewForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        return 38;
    } else {
        return CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.configuration tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
