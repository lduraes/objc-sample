//
//  AVCObjectMapping.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCObjectMapping.h"
#import "AVCGMapItem.h"

@implementation AVCObjectMapping

#pragma mark - Public

+(RKObjectMapping *)gMapItemMapping {
    RKObjectMapping *gMapItemMapping = [RKObjectMapping mappingForClass:[AVCGMapItem class]];
    [gMapItemMapping addAttributeMappingsFromArray:@[@"status"]];
    [gMapItemMapping addAttributeMappingsFromDictionary:@{@"formatted_address": @"address"}];
    [gMapItemMapping addAttributeMappingsFromDictionary:@{@"geometry.location": @"dictLocation"}];
    
    return gMapItemMapping;
}

@end
