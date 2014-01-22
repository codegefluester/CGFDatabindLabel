//
//  CGFDataBindLabel_SampleTests.m
//  CGFDataBindLabel-SampleTests
//
//  Created by Björn Kaiser on 22.01.14.
//  Copyright (c) 2014 Björn Kaiser. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CGFDatabindLabel.h"
#import "TestObject.h"

@interface CGFDataBindLabel_Tests : XCTestCase

@end

@implementation CGFDataBindLabel_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) dataBindTest
{
    TestObject *testObj = [TestObject new];
    testObj.score = 10;
    
    CGFDatabindLabel *testLabel = [[CGFDatabindLabel alloc] initWithFrame:CGRectZero andKeypath:@"score" inObject:testObj];
    
    XCTAssertTrue([testLabel.text intValue] == 10, @"Values dont match");
    
    testObj.score = 200;
    XCTAssertTrue([testLabel.text intValue] == 200, @"Values dont match");
}

@end
