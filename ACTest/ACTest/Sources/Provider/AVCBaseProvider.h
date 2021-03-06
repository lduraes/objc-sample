//
//  AVCBaseProvider.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "AVCRKObjectManagerProvider.h"
#import "AVCConstants.h"
#import "AVCRequest.h"

typedef void(^MappingResultBlock)(RKMappingResult *mappingResult, NSError *error);

@interface AVCBaseProvider : NSObject

@property(strong, nonatomic, readonly) RKObjectManager *objectManager;

-(void)getObjectsAtPath:(NSString *)path withParameters:(NSDictionary *)parameters withCompletionHandler:(MappingResultBlock)handler;
-(void)setupRequestDescriptors;
-(void)setupResponseDescriptors;

@end
