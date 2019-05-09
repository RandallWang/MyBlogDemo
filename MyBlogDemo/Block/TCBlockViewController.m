 //
//  TCBlockViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCBlockViewController.h"
#import "TCCopyItem.h"

#import <objc/runtime.h>


typedef void(^TestBlock)(int testValue);

@interface TCBlockViewController ()

@property (nonatomic, strong) TestBlock strongBlock;
@property (nonatomic, copy) TestBlock copyBlock;

- (void)TCBlockCompletionHandler:(TestBlock)completion;

@end


@implementation TCBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self simpleBlockUsage];
//    [self standerBlockUsage];
    
    [self blockProperty];
}

- (void)simpleBlockUsage {
    void (^itemCountBlock)(void) = ^(void) {
        NSLog(@"2");
    };
    NSLog(@"1");
    itemCountBlock();
    NSLog(@"3");
}

- (void)standerBlockUsage {
    NSArray *testArray = @[@"1", @"2", @"3"];
    __block NSMutableString *string = [NSMutableString string];
    NSLog(@"string:%p,pointer address:%p", string, &string);

    [testArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendString:[NSString stringWithFormat:@"%@", obj]];
        NSLog(@"string:%p,pointer address:%p", string, &string);
    }];
    
    TCCopyItem *test = [[TCCopyItem alloc] initWithName:@"a"];
    NSLog(@"item:%@,pointer address:%p", test, &test);
    [self TCBlockCompletionHandler:^void(int testValue) {
        NSLog(@"item:%@,pointer address:%p", test, &test);

        NSLog(@"%i",testValue);
        NSLog(@"done!");
    }];
}

- (void)TCBlockCompletionHandler:(TestBlock)completion {
    NSLog(@"do something");
    completion(1);
}

- (void)blockProperty {
    TCBlockViewController *__weak weakSelf = self;
    
    self.strongBlock = ^(int testValue) {
        NSLog(@"%i",testValue);
        NSLog(@"strongBlock:%@",weakSelf.strongBlock);
    };
    
    self.copyBlock = ^(int testValue) {
        NSLog(@"%i",testValue);
        NSLog(@"copyBlock:%@",weakSelf.copyBlock);
    };
    
    self.copyBlock(1);
    self.copyBlock(2);

    self.strongBlock(3);
    self.strongBlock(2);
    
//        "name:strongBlock,attributes:T@?,C,N,V_strongBlock",
//        "name:copyBlock,attributes:T@?,C,N,V_copyBlock"
    [self dumpInfo];
}

- (void)dumpInfo {
    Class clazz = [self class];
    u_int count;

    Ivar* ivars = class_copyIvarList(clazz, &count);
    NSMutableArray* ivarArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++) {
        const char* ivarName = ivar_getName(ivars[i]);
        [ivarArray addObject:[NSString  stringWithCString:ivarName encoding:NSUTF8StringEncoding]];
    }
    free(ivars);
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++) {
        const char* propertyName = property_getName(properties[i]);
        const char* propertyAttributes = property_getAttributes(properties[i]);
        [propertyArray addObject:[NSString stringWithFormat:@"name:%@,attributes:%@", [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding], [NSString stringWithCString:propertyAttributes encoding:NSUTF8StringEncoding]]];
    }
    free(properties);
    
    NSDictionary* classDump = [NSDictionary dictionaryWithObjectsAndKeys:
                               ivarArray, @"ivars",
                               propertyArray, @"properties",
                               nil];
    
    NSLog(@"%@", classDump);

}

@end
