//
//  AVCPlace+CoreDataProperties.h
//  
//
//  Created by Luiz Duraes on 3/27/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AVCPlace.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVCPlace (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END
