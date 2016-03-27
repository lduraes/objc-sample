//
//  AVCPlaceBusinessTests.m
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AVCPlace+AVCBusiness.h"

@interface AVCPlaceBusinessTests : XCTestCase

@end

@implementation AVCPlaceBusinessTests

#pragma mark - Tests

-(void)testAddItem {
    AVCGMapItem *item = [AVCGMapItem new];
    [item setAddress:@"New Jersey, USA"];
    [item setLatitude:40.0583229];
    [item setLongitude:-74.4056625];
    XCTAssertTrue([AVCPlace addItem:item]);
}

-(void)testDeleteItem {
    XCTAssertTrue([AVCPlace deletePlace:[AVCPlace fetchItemWithAddress:@"New Jersey, USA"]]);
}

-(void)testFetchItemWithAddress {
    [self testAddItem];
    AVCPlace *place = [AVCPlace fetchItemWithAddress:@"New Jersey, USA"];
    XCTAssertTrue([place.latitude.stringValue isEqualToString:@"40.05832"]);
    [self testDeleteItem];
}

#pragma mark - Override

-(void)setUp {
    [super setUp];
}

-(void)tearDown {
    [super tearDown];
}

@end
