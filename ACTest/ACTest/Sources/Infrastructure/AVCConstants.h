//
//  AVCConstants.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCConstants : NSObject

extern NSString *const kRestProviderBaseUrl;
extern NSString *const kRestProviderSearchItem;

extern NSString *const kErrorDomain;
extern NSString *const kErrorPrefix;

extern NSUInteger const kErrCodeServiceUnavailable;
extern NSUInteger const kErrCodeNoRecordFound;
extern NSUInteger const kErrCodeServerTimedOut;

extern NSTimeInterval const kRequestResponseTimeout;

@end
