//
//  AVCPlace+AVCBusiness.m
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCPlace+AVCBusiness.h"
#import "AVCPlaceProvider.h"

@implementation AVCPlace (AVCBusiness)

#pragma mark - Public

+(BOOL)addItem:(AVCGMapItem *)item {
    return [AVCPlaceProvider.new addItem:item];
}

+(BOOL)deletePlace:(AVCPlace *)place {
    return [AVCPlaceProvider.new deletePlace:place];
}

+(AVCPlace *)fetchItemWithAddress:(NSString *)address {
    return [AVCPlaceProvider.new fetchItemWithAddress:address];
}

@end
