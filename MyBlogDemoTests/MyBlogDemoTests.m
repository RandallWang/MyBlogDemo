//
//  MyBlogDemoTests.m
//  MyBlogDemoTests
//
//  Created by Tianchi Wang on 2018/12/16.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TCNetworkManager.h"
#import "TCListItemRequest.h"
#import "TCBaseResponse.h"
#import "TCListItemResponse.h"

@interface MyBlogDemoTests : XCTestCase<TCNetworkDelegate>

@property (nonatomic, strong)XCTestExpectation *listItemExpertation;

@end

@implementation MyBlogDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [[TCNetworkManager manager] setDelegate:self];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testListItemAPI {
    self.listItemExpertation = [[XCTestExpectation alloc] initWithDescription:@"Test:\\listItems,HTTP Method:GET"];

    TCListItemRequest *request = [[TCListItemRequest alloc] init];
    [[TCNetworkManager manager] startRequest:request];
    [self waitForExpectations:@[self.listItemExpertation] timeout:10];
}




#pragma mark - TCNetworkDelegate
- (void)failedWithError:(NSError *)error {
    XCTFail(@"Fail With Error:%@",error.description);
}

- (void)successedWithResponse:(TCBaseResponse *)response {
    if ([response isKindOfClass:[TCListItemResponse class]]) {
        [self.listItemExpertation fulfill];
    }
}

@end

