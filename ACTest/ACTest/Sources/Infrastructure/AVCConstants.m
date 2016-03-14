//
//  AVCConstants.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCConstants.h"

@implementation AVCConstants

NSString *const kRestProviderBaseUrl = @"http://maps.googleapis.com/";
NSString *const kRestProviderSearchItem = @"maps/api/geocode/json?address=:address";

NSString *const kErrorDomain = @"AVCErrorDomain";
NSString *const kErrorPrefix = @"ERROR";

NSUInteger const kErrCodeServiceUnavailable = 2;
NSUInteger const kErrCodeNoRecordFound = 3;
NSUInteger const kErrCodeServerTimedOut = 4;

NSTimeInterval const kRequestResponseTimeout = 10;

@end
