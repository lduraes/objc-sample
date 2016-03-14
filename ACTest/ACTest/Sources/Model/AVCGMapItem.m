//
//  AVCGMapItem.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCGMapItem.h"

@implementation AVCGMapItem

#pragma mark - Public

-(instancetype)initWithAddress:(NSString *)address {
    if(self = [super init]) {
        [self setAddress:address];
    }
    
    return self;
}

@end
