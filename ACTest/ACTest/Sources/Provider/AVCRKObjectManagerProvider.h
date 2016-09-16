//
//  AVCRKObjectManagerProvider.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import <RestKit/RestKit.h>

@interface AVCRKObjectManagerProvider : RKObjectManager

-(void)getObjectsAtPath:(NSString *)path
             parameters:(NSDictionary *)parameters
                success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
                failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
