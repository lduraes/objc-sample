//
//  AVCPlace+AVCBusiness.h
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCPlace.h"
#import "AVCGMapItem.h"

@interface AVCPlace (AVCBusiness)

+(BOOL)addItem:(AVCGMapItem *)item;
+(BOOL)deletePlace:(AVCPlace *)place;
+(AVCPlace *)fetchItemWithAddress:(NSString *)address;

@end
