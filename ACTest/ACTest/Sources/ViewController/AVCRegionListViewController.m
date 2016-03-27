//
//  AVCRegionListViewController.m
//  ACTest
//
//  Created by Luiz Duraes on 3/12/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCRegionListViewController.h"
#import "AVCGMapItem+AVCBusiness.h"
#import "AVCMapViewController.h"
#import "SVProgressHUD.h"
#import "UIView+AVCExtensions.h"

// constant
static NSString *kRegionCell = @"regionCell";
static CGFloat kRegionCellHeight = 44.0;

@interface AVCRegionListViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewNoRecords;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;
@property (strong, nonatomic) NSArray *arrayItems;

@end

@implementation AVCRegionListViewController

#pragma mark - Private

-(void)clearTableViewRecords {
    NSString *searchString = [self.searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if(searchString.length == 0) {
        [self.searchBar setText:@""];
        [self loadTableViewWithArrayItems:[NSArray array]];
    }
}

-(void)configComponents {
    [self.searchBar becomeFirstResponder];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

-(void)loadTableViewWithArrayItems:(NSArray *)arrayItems {
    [self setArrayItems:arrayItems];
    [self.tableView reloadData];
    
    if(self.arrayItems.count == 0) {
        [self.viewNoRecords showViewNoRecordsFound];
    }
}

-(void)performSearch {
    __weak typeof(self) weakSelf = self;
    [SVProgressHUD showWithStatus:NSLocalizedString(@"infMsgAutheticating", nil)];
    
    [AVCGMapItem searchAddress:self.searchBar.text withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        [SVProgressHUD dismiss];
        if(error) {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            return;
        }
        
        [weakSelf loadTableViewWithArrayItems:arrayItems];
    }];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayItems.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayItems[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *regionCell = [tableView dequeueReusableCellWithIdentifier:kRegionCell forIndexPath:indexPath];
    AVCGMapItem *item = (self.arrayItems.count > 1) ? self.arrayItems[indexPath.section][indexPath.row] : self.arrayItems[indexPath.row];
    [regionCell.textLabel setText:item.address];
    
    return regionCell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRegionCellHeight;
}

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performSearch];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self clearTableViewRecords];
}

#pragma mark - Override

-(void)viewDidLoad {
    [super viewDidLoad];
    [self configComponents];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AVCMapViewController *mapViewController = (AVCMapViewController *)segue.destinationViewController;
    [mapViewController setArrayItems:self.arrayItems[1]];
}

@end
