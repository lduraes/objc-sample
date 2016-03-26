//
//  AVCGMapItemProvider.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCGMapItemProvider.h"
#import "AVCObjectMapping.h"

static NSString *const kRestProviderSearchItemKeyPath = @"results";

@implementation AVCGMapItemProvider

-(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler {
    AVCRequest *request = [[AVCRequest alloc] initWithAddress:address];
    
    [self getObjectsAtPath:RKPathFromPatternWithObject(kRestProviderSearchItem, request) withParameters:nil withCompletionHandler:^(RKMappingResult *mappingResult, NSError *error) {
        if(error) {
            handler(nil, error.code == kErrCodeServiceUnavailable ? [NSError errorWithDomain:kErrorDomain code:kErrCodeServiceUnavailable userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"errMsgAuthentication", nil)}] : error);
        }
        else {
            handler(mappingResult.array, error);
        }
    }];
}

#pragma mark - Override

-(void)setupResponseDescriptors {
    [super setupResponseDescriptors];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[AVCObjectMapping gMapItemMapping]
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:kRestProviderSearchItemKeyPath
                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self.objectManager addResponseDescriptor:responseDescriptor];
}

@end
