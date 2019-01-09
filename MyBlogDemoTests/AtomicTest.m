//
//  AtomicTest.m
//  MyBlogDemoTests
//
//  Created by Tianchi Wang on 2019/1/9.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

#import <XCTest/XCTest.h>

typedef struct {
    NSUInteger x;
    NSUInteger xSquared;  // cached value of x*x
} Data;



@interface AtomicTest : XCTestCase

@property (nonatomic) Data latestData;
//@property (atomic) Data latestData;

@property (nonatomic) NSObject *latestObject;
//@property (atomic) NSObject *latestObject;

@property (atomic) NSString *threadSafeTest;

@property (nonatomic) XCTestExpectation *expectation;

@end

@implementation AtomicTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testNonatomic {
    self.expectation = [[XCTestExpectation alloc] initWithDescription:@"find the Case"];
    // Produce new Data structs.
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSUInteger x = 0; x < NSUIntegerMax; x++) {
            Data newData;
            newData.x = x;
            newData.xSquared = x * x;
            
            // Since the Data struct is too large for a single store,
            // the setter actually updates the two fields separately.
            self.latestData = newData;
        }
    });
    
    // Produce new objects.
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (true) {
            // Release the previous value; retain the new value.
            self.latestObject = [NSObject new];
        }
    });
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(logStatus) userInfo:nil repeats:YES];
    
    [self waitForExpectations:@[self.expectation] timeout:30];
}

- (void)logStatus{
    // Implicitly retain the current object for our own uses.
    NSObject *o = self.latestObject;
    NSLog(@"Latest object: %@", o);
    
    // Validate the consistency of the data.
    Data latest = self.latestData;
    if (latest.x * latest.x != latest.xSquared ) {
        [self.expectation fulfill];
    }
    NSAssert(latest.x * latest.x == latest.xSquared, @"WRONG: %lu^2 != %lu", latest.x, latest.xSquared);
    NSLog(@"Latest data: %lu^2 = %lu", latest.x, latest.xSquared);
}

- (void)testThreadSafe {
    self.expectation = [[XCTestExpectation alloc] initWithDescription:@"Not Thread Safe"];

    dispatch_queue_t queue1 = dispatch_queue_create("queue1", nil);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", nil);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue1, ^{
        self.threadSafeTest = @"a";
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), queue2, ^{
        self.threadSafeTest = @"b";
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), queue1, ^{
        NSLog(@"%@", self.threadSafeTest);

        if (![self.threadSafeTest isEqualToString:@"a"]) {
            [self.expectation fulfill];
        }
    });


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"finished");
    });

    
    [self waitForExpectations:@[self.expectation] timeout:30];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
