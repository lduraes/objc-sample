//
//  AVCRKObjectManagerProvider.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCRKObjectManagerProvider.h"
#import "AVCConstants.h"

static NSString *const kRestKitAssertMessage = @"Cannot make a request without an object or a path.";

@implementation AVCRKObjectManagerProvider

#pragma mark - Private

-(void)setTimeoutIntervalForRequest:(NSURLRequest *)urlRequest {
    NSMutableURLRequest *mutableURLRequest = (NSMutableURLRequest *)urlRequest;
    [mutableURLRequest setTimeoutInterval:kRequestResponseTimeout];
}

#pragma mark - Override

-(void)getObjectsAtPath:(NSString *)path
             parameters:(NSDictionary *)parameters
                success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
                failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure {
    NSParameterAssert(path);
    RKObjectRequestOperation *operation = [self appropriateObjectRequestOperationWithObject:nil method:RKRequestMethodGET path:path parameters:parameters];
    
    // set timeout
    [self setTimeoutIntervalForRequest:operation.HTTPRequestOperation.request];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    [self enqueueObjectRequestOperation:operation];
}

-(void)postObject:(id)object
             path:(NSString *)path
       parameters:(NSDictionary *)parameters
          success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
          failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure {
    NSAssert(object || path, kRestKitAssertMessage);
    RKObjectRequestOperation *operation = [self appropriateObjectRequestOperationWithObject:object method:RKRequestMethodPOST path:path parameters:parameters];
    
    [self setTimeoutIntervalForRequest:operation.HTTPRequestOperation.request];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    [self enqueueObjectRequestOperation:operation];
}

@end
