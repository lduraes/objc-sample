//
//  AVCRegionListViewController.m
//  ACTest
//
//  Created by Luiz Duraes on 3/12/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCRegionListViewController.h"
#import "AVCGMapItem+AVCBusiness.h"

static NSString *kRegionCell = @"regionCell";
static CGFloat kRegionCellHeight = 44.0;

@interface AVCRegionListViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;

@end

@implementation AVCRegionListViewController

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *regionCell = [tableView dequeueReusableCellWithIdentifier:kRegionCell forIndexPath:indexPath];
    
    return regionCell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRegionCellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [AVCGMapItem searchAddress:searchBar.text withCompletionHandler:^(AVCGMapItem *item, NSError *error) {
        if(error) {
            NSLog(@"%@", error);
            return;
        }
        
        NSLog(@"item >> %@", item);
    }];
}

#pragma mark - Overrides

-(void)viewDidLoad {
    [super viewDidLoad];
}

@end
