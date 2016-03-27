//
//  AVCGMapItem+AVCBusiness.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCGMapItem.h"
#import "AVCGMapItemProvider.h"

@interface AVCGMapItem (AVCBusiness)

+(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler;

@end
