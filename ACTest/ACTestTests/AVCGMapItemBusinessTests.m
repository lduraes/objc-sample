//
//  AVCGMapItemBusinessTests.m
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AVCGMapItem+AVCBusiness.h"

@interface AVCGMapItemBusinessTests : XCTestCase

@end

@implementation AVCGMapItemBusinessTests

-(void)setUp {
    [super setUp];
}

-(void)tearDown {
    [super tearDown];
}

-(void)testSearchDisplayAllOnMap {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchAddress"];
    [AVCGMapItem searchAddress:@"new york" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[1][0];
        XCTAssertEqualObjects(@"Display All on Map", item.address, @"Fail retrieving - Display All on Map");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchOneAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchAddress"];
    [AVCGMapItem searchAddress:@"santos" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[1][0];
        XCTAssertEqualObjects(@"Santos, Santos - State of São Paulo, Brazil", item.address, @"Fail retrieving - address (one)");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchMoreThanOneAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchAddress"];
    [AVCGMapItem searchAddress:@"springfield" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[2][0];
        XCTAssertEqualObjects(@"Springfield, MA, USA", item.address, @"Fail retrieving - address (list)");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchInvalidAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchAddress"];
    [AVCGMapItem searchAddress:@"sxptoydsadsa" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        XCTAssertTrue([arrayItems[1] count] == 0);
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

@end
