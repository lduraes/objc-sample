//
//  AVCGMapItem+AVCBusiness.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCGMapItem+AVCBusiness.h"

@implementation AVCGMapItem (AVCBusiness)

+(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler {
    [AVCGMapItemProvider.new searchAddress:address withCompletionHandler:^(AVCGMapItem *item, NSError *error) {
        if(error) {
            handler(nil, [NSError errorWithDomain:kErrorDomain code:kErrCodeServiceUnavailable userInfo:[NSDictionary dictionaryWithObject:NSLocalizedString(@"errMsgUserOrPassword", nil) forKey:NSLocalizedDescriptionKey]]);
        }
        else {
            handler(item, nil);
        }
    }];
}

@end
