//
//  AVCMapViewController.m
//  ACTest
//
//  Created by Luiz Duraes on 3/12/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCMapViewController.h"
#import <Mapkit/MapKit.h>
#import "SVProgressHUD.h"
#import "AVCCustomAnnotation.h"
#import "AVCPlace+AVCBusiness.h"

static CGFloat const kMetersPerMile = 1609.344;

@interface AVCMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *arrayAnnotations;
@property (strong, nonatomic) AVCGMapItem *item;
@property (strong, nonatomic) AVCPlace *place;

@end

@implementation AVCMapViewController

#pragma mark - Public

-(void)configComponents {
    [self loadAnnotations];
    
    if(self.arrayAnnotations.count > 1) {
        [self.navigationItem setRightBarButtonItem:nil];
        return;
    }
    
    [self showActionButton];
    [self dropPinsOnScreen];
}

#pragma mark - Private

-(void)addPlace {
    if([AVCPlace addItem:self.item]) {
        NSLog(@"Record added");
    }
}

-(void)deletePlace {
    if([AVCPlace deletePlace:self.place]) {
        [self.mapView removeAnnotations:self.arrayAnnotations];
        [self.navigationItem setRightBarButtonItem:nil];
    }
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
    }
    else {
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlace)]];
    }
}

-(void)zoomLocation:(CLLocationCoordinate2D)coordinate withRadius:(CGFloat)radius {
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, radius, radius);
    [self.mapView setRegion:[self.mapView regionThatFits:viewRegion] animated:NO];
}

#pragma mark - Override

-(void)viewDidLoad {
    [super viewDidLoad];
    [self configComponents];
}

@end
