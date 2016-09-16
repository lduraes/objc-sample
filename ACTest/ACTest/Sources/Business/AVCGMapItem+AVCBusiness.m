//
//  AVCGMapItem+AVCBusiness.m
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCGMapItem+AVCBusiness.h"

static NSString *const kAllItems = @"Display All on Map";

@implementation AVCGMapItem (AVCBusiness)

#pragma mark - Public

+(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler {
    __weak typeof(self) weakSelf = self;

    [AVCGMapItemProvider.new searchAddress:address withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        if(error) {
            handler(nil, error);
        } else {
            handler([weakSelf prepareArrayWithItems:arrayItems], nil);
        }
    }];
}

#pragma mark - Private

+(NSArray *)prepareArrayWithItems:(NSArray *)arrayItems {
    if(arrayItems.count > 1) {
        return @[@[], @[[[AVCGMapItem alloc] initWithAddress:kAllItems]], arrayItems];
    }
    
    return @[@[], arrayItems];
}

@end
