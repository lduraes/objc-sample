//
//  AVCPlaceProvider.m
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "AVCPlaceProvider.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

static NSString *const kEntityAVCPlace = @"AVCPlace";
static NSString *const kActionAdd = @"add";
static NSString *const kActionDelete = @"delete";

@interface AVCPlaceProvider ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation AVCPlaceProvider

#pragma mark - Public

-(instancetype)init {
    if(self = [super init]) {
        [self setManagedObjectContext:[(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]];
    }
    
    return self;
}

-(BOOL)addItem:(AVCGMapItem *)item {
    AVCPlace *place = [NSEntityDescription insertNewObjectForEntityForName:kEntityAVCPlace inManagedObjectContext:self.managedObjectContext];
    
    if([self isExistingInstance:place]) {
        [place setAddress:item.address];
        [place setLatitude:@(item.latitude)];
        [place setLongitude:@(item.longitude)];
        return [self saveChanges:kActionAdd];
    }
    
    return NO;
}

-(BOOL)deletePlace:(AVCPlace *)place {
    if([self isExistingInstance:place]) {
        [self.managedObjectContext deleteObject:place];
        return [self saveChanges:kActionDelete];
    }

    return NO;
}

-(AVCPlace *)fetchItemWithAddress:(NSString *)address {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:kEntityAVCPlace];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"address == %@", address]];
    
    NSError *error;
    NSArray *arrayFetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(arrayFetchedObjects.count == 1) {
        return arrayFetchedObjects[0];
    }
    
    return nil;
}

#pragma mark - Private

-(BOOL)isExistingInstance:(AVCPlace *)place {
    if(place == nil) {
        NSLog(@"Failed to retrieve Place instance");
        return NO;
    }
    
    return YES;
}

-(BOOL)saveChanges:(NSString *)message {
    NSError *error;
    
    if([self.managedObjectContext save:&error]) {
        NSLog(@"Place %@ed", message);
        return YES;
    }
    
    NSLog(@"[ERR] Failed to %@ place >> %@", message, error);
    return NO;
}

@end
