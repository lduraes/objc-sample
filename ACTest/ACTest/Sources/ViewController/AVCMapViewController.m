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
#import "AVCGMapItem.h"
#import "AVCCustomAnnotation.h"

static CGFloat const kMetersPerMile = 1609.344;

@interface AVCMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButtonItem;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *arrayAnnotations;

@end

@implementation AVCMapViewController

#pragma mark - Public

-(void)configComponents {
    [self loadAllPins];
}

#pragma mark - Private

-(void)loadAllPins {
    [self setArrayAnnotations:[NSMutableArray array]];
    
    __weak typeof(self) weakSelf = self;
//    [SVProgressHUD showWithStatus:NSLocalizedString(@"infMsgAutheticating", nil)];

    [self.arrayItems enumerateObjectsUsingBlock:^(AVCGMapItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        AVCCustomAnnotation *annotation = [[AVCCustomAnnotation alloc] initWithMapItem:item];
        [weakSelf.arrayAnnotations addObject:annotation];
    }];
    
    if(self.arrayAnnotations.count > 0) {
        AVCCustomAnnotation *annotation = (AVCCustomAnnotation *)self.arrayAnnotations.lastObject;
        [self.mapView showAnnotations:self.arrayAnnotations animated:YES];
        [self zoomLocation:annotation.coordinate withRadius:(3 * kMetersPerMile)];
        
        self.navigationItem.rightBarButtonItem = self.arrayAnnotations.count > 1 ? nil : self.addBarButtonItem;
    }
}

-(void)zoomLocation:(CLLocationCoordinate2D)coordinate withRadius:(CGFloat)radius {
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, radius, radius);
    [self.mapView setRegion:[self.mapView regionThatFits:viewRegion] animated:NO];
}

#pragma mark - MKMapViewDelegate methods

//-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
//    if(fullyRendered) {
//        [SVProgressHUD dismiss];
//    }
//}

#pragma mark - Override

-(void)viewDidLoad {
    [super viewDidLoad];
    [self configComponents];
}

@end
