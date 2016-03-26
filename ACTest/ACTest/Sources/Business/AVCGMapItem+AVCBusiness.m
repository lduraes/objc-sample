//
//  AVCGMapItem+AVCBusiness.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCGMapItem+AVCBusiness.h"

@implementation AVCGMapItem (AVCBusiness)

#pragma mark - Public

+(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler {
    __weak typeof(self) weakSelf = self;
//    NSString *uft8Str = [NSString stringWithUTF8String:address];
    
    [AVCGMapItemProvider.new searchAddress:address withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        if(error) {
            handler(nil, [NSError errorWithDomain:kErrorDomain code:kErrCodeServiceUnavailable userInfo:[NSDictionary dictionaryWithObject:NSLocalizedString(@"errMsgUserOrPassword", nil) forKey:NSLocalizedDescriptionKey]]);
        }
        else {
            handler([weakSelf prepareArrayWithItems:arrayItems], nil);
        }
    }];
}

#pragma mark - Private

+(NSArray *)prepareArrayWithItems:(NSArray *)arrayItems {
    if(arrayItems.count > 1) {
        return @[@[], @[[[AVCGMapItem alloc] initWithAddress:@"Display All on Map"]], arrayItems];
    }
    
    return @[@[], arrayItems];
}

@end
