//
//  AVCGMapItem.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCGMapItem.h"

static NSString *const kLatitude = @"lat";
static NSString *const kLongitude = @"lng";

@implementation AVCGMapItem

#pragma mark - Public

-(instancetype)initWithAddress:(NSString *)address {
    if(self = [super init]) {
        [self setAddress:address];
    }
    
    return self;
}

#pragma mark - Private

-(void)setDictLocation:(NSDictionary *)dictLocation {
    _dictLocation = dictLocation;
    [self setLatitude:[self.dictLocation[kLatitude] floatValue]];
    [self setLongitude:[self.dictLocation[kLongitude] floatValue]];
}

@end
