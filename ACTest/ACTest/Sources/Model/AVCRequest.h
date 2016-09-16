//
//  AVCRequest.h
//  ACTest
//
//  Created by Luiz Duraes on 3/26/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCRequest : NSObject

@property (strong, nonatomic) NSString *address;

-(instancetype)initWithAddress:(NSString *)address;

@end
