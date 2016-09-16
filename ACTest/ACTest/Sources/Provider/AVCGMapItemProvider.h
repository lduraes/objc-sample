//
//  AVCGMapItemProvider.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import "AVCBaseProvider.h"
#import "AVCGMapItem.h"

typedef void(^AVCGMapItemBlock)(NSArray *arrayItems, NSError *error);

@interface AVCGMapItemProvider : AVCBaseProvider

-(void)searchAddress:(NSString *)address withCompletionHandler:(AVCGMapItemBlock)handler;

@end
