//
//  AVCRequest.m
//  ACTest
//
//  Created by Luiz Duraes on 3/26/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCRequest.h"

@implementation AVCRequest

#pragma mark - Public

-(instancetype)initWithAddress:(NSString *)address {
    if(self = [super init]) {
        [self setAddress:address];
    }
    
    return self;
}

@end
