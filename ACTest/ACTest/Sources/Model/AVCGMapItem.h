//
//  AVCGMapItem.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface AVCGMapItem : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSDictionary *dictLocation;
@property (strong, nonatomic) CLLocation *coordinates;

-(instancetype)initWithAddress:(NSString *)address;

@end
