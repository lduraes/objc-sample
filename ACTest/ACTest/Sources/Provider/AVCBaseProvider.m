//
//  AVCBaseProvider.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCBaseProvider.h"
#import "AVCConstants.h"

@implementation AVCBaseProvider

#pragma mark - Public

-(void)getObjectsAtPath:(NSString *)path withParameters:(NSDictionary *)parameters withCompletionHandler:(MappingResultBlock)handler {
    [self enableDebug];
    
    [self.objectManager getObjectsAtPath:path parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if(mappingResult) {
            handler(mappingResult, nil);
        }
        else {
            handler(nil, [NSError errorWithDomain:kErrorDomain code:kErrCodeNoRecordFound userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"errNoRecordFound", nil)}]);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self failureWithPath:path withError:error withCompletionHandler:handler];
    }];
}

-(void)postObject:(id)object withPath:(NSString *)path withParameters:(NSDictionary *)parameters withCompletionHandler:(MappingResultBlock)handler {
    [self enableDebug];
    
    [self.objectManager postObject:object path:path parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        handler(mappingResult, nil);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self failureWithPath:path withError:error withCompletionHandler:handler];
    }];
}

-(void)setupRequestDescriptors { }

-(void)setupResponseDescriptors { }

#pragma mark - Private

-(void)enableDebug {
//    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);           // http request and response bodies
//    RKLogConfigureByName("RestKit/CoreData", RKLogLevelDebug);          // core data
//    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);     // object mapping
}

-(void)failureWithPath:path withError:(NSError *)error withCompletionHandler:(MappingResultBlock)handler {
//    [Helper trackError:NSStringFromSelector(_cmd) withError:error.localizedDescription withMoreInfo:@{@"service": [path stringByReplacingOccurrencesOfString:kPartialPath withString:@""]}];
    
    if(error.code == kCFURLErrorTimedOut) {
        handler(nil, [NSError errorWithDomain:kErrorDomain code:kErrCodeServerTimedOut userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"errMsgServerTimedOut", nil)}]);
    }
    else {
        handler(nil, [NSError errorWithDomain:kErrorDomain code:kErrCodeServiceUnavailable userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"errMsgServiceUnavailable", nil)}]);
    }
}

#pragma mark - Override

-(instancetype)init {
    if(self = [super init]) {
        _objectManager = [AVCRKObjectManagerProvider managerWithBaseURL:[NSURL URLWithString:kRestProviderBaseUrl]];
        [self setupRequestDescriptors];
        [self setupResponseDescriptors];
    }
    
    return self;
}

@end
