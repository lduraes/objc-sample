//
//  AVCGMapItem.h
//  ACTest
//
//  Created by Luiz Duraes on 3/13/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCGMapItem : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSDictionary *results;
@property (strong, nonatomic) NSString *status;
//@property (strong, nonatomic) NSString *addressComponents;
//@property (strong, nonatomic) NSString *formattedAddress;
//@property (strong, nonatomic) NSString *geometry;
//@property (strong, nonatomic) NSString *placeId;
//@property (strong, nonatomic) NSString *types;

-(instancetype)initWithAddress:(NSString *)address;

@end
