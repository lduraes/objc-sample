//
//  AVCConstants.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCConstants.h"

@implementation AVCConstants

NSString *const kRestProviderBaseUrl = @"http://maps.googleapis.com/";
NSString *const kRestProviderSearchItem = @"maps/api/geocode/json";

NSString *const kErrorDomain = @"AVCErrorDomain";
NSString *const kErrorPrefix = @"ERROR";

NSUInteger const kErrCodeServiceUnavailable = 2;
NSUInteger const kErrCodeNoRecordFound = 3;
NSUInteger const kErrCodeServerTimedOut = 4;

NSTimeInterval const kRequestResponseTimeout = 100;

@end
