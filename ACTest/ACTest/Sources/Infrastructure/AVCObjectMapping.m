//
//  AVCObjectMapping.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCObjectMapping.h"
#import "AVCGMapItem.h"

@implementation AVCObjectMapping

//+(RKObjectMapping *)gMapItemMapping {
//    RKObjectMapping *gMapItemMapping = [RKObjectMapping mappingForClass:[AVCGMapItem class]];
//    [gMapItemMapping addAttributeMappingsFromDictionary:@{ @"address_components": @"addressComponents"
//                                                          ,@"formatted_address": @"formattedAddress"
//                                                          ,@"place_id": @"placeId"}];
//
//    [gMapItemMapping addAttributeMappingsFromArray:@[ @"geometry"
//                                                     ,@"types"]];
//    
//    return gMapItemMapping;
//
//}

+(RKObjectMapping *)gMapItemMapping {
    RKObjectMapping *gMapItemMapping = [RKObjectMapping mappingForClass:[AVCGMapItem class]];
    [gMapItemMapping addAttributeMappingsFromArray:@[ @"results"
                                                     ,@"status"]];
    
    return gMapItemMapping;
    
}

@end
