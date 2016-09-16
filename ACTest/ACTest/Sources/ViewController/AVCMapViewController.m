//
//  AVCMapViewController.m
//  ACTest
//
//  Created by Luiz Duraes on 3/12/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCMapViewController.h"
#import <Mapkit/MapKit.h>
#import "SVProgressHUD.h"
#import "AVCCustomAnnotation.h"
#import "AVCPlace+AVCBusiness.h"

static CGFloat const kMetersPerMile = 1609.344;

@interface AVCMapViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *arrayAnnotations;
@property (strong, nonatomic) AVCGMapItem *item;
@property (strong, nonatomic) AVCPlace *place;

@end

@implementation AVCMapViewController

#pragma mark - Public

-(void)configComponents {
    [self loadAnnotations];
    
    [self dropPinsOnScreen];

    if(self.arrayAnnotations.count > 1) {
        [self.navigationItem setRightBarButtonItem:nil];
        return;
    }
    
    [self showActionButton];
}

#pragma mark - Private

-(void)addPlace {
    if([AVCPlace addItem:self.item]) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrnMsgTitle", nil) message:NSLocalizedString(@"wrnMsgAddPin", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"btnOk", nil) otherButtonTitles:nil, nil] show];
        [self showActionButton];
    }
}

-(void)deletePlace {
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"wrnMsgTitle", nil) message:NSLocalizedString(@"wrnMsgDeletePin", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"btnCancel", nil) otherButtonTitles:NSLocalizedString(@"btnConfirm", nil), nil] show];
}

-(void)dropPinsOnScreen {
    AVCCustomAnnotation *annotation = (AVCCustomAnnotation *)self.arrayAnnotations.lastObject;
    [self zoomLocation:annotation.coordinate withRadius:(kMetersPerMile)];
    [self.mapView showAnnotations:self.arrayAnnotations animated:YES];
}

-(void)loadAnnotations {
    [self setArrayAnnotations:[NSMutableArray array]];
    __weak typeof(self) weakSelf = self;

    [self.arrayItems enumerateObjectsUsingBlock:^(AVCGMapItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        AVCCustomAnnotation *annotation = [[AVCCustomAnnotation alloc] initWithMapItem:item];
        [weakSelf.arrayAnnotations addObject:annotation];
        [weakSelf setItem:item];
    }];
}

-(void)showActionButton {
    [self setPlace:[AVCPlace fetchItemWithAddress:self.item.address]];
    
    if(self.place) {
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(deletePlace)]];
    } else {
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlace)]];
    }
}

-(void)zoomLocation:(CLLocationCoordinate2D)coordinate withRadius:(CGFloat)radius {
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, radius, radius);
    [self.mapView setRegion:[self.mapView regionThatFits:viewRegion] animated:NO];
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        if([AVCPlace deletePlace:self.place]) {
            [self.mapView removeAnnotations:self.arrayAnnotations];
            [self.navigationItem setRightBarButtonItem:nil];
        }
    }
}

#pragma mark - Override

-(void)viewDidLoad {
    [super viewDidLoad];
    [self configComponents];
}

@end
