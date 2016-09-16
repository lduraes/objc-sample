//
//  AVCCustomAnnotation.h
//  ACTest
//
//  Created by Luiz Duraes on 3/26/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class AVCGMapItem;

@interface AVCCustomAnnotation : NSObject <MKAnnotation>

-(instancetype)initWithMapItem:(AVCGMapItem *)mapItem;

@end
