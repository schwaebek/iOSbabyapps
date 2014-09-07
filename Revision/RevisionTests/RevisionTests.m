//
//  RevisionTests.m
//  RevisionTests
//
//  Created by Katlyn Schwaebe on 8/7/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RevisionTests : XCTestCase

@end

@implementation RevisionTests

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

- (void)testForLoops
{
    int sum = 0;
    
    for (int i=0; i<5; i++) {
        sum = sum + i;
    }
    //NSLog(@"Sum of intergers 0 through 4 (inclusive) = %d", sum);
    XCTAssertEqual(sum,10,@"Testing sum of ints 0..4");
    
}
    
    
@end
    
