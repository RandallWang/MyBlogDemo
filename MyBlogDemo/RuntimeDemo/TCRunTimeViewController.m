//
//  TCRunTimeViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/11.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCRunTimeViewController.h"
#import <objc/runtime.h>

#pragma mark - Method Swizzling
@interface NSMutableArray (methodSwizzling)

- (void)tc_addObject:(id)anObject;

@end

@implementation NSMutableArray (methodSwizzling)

- (void)tc_addObject:(id)anObject {
    [self tc_addObject:anObject];
    NSLog(@"add a new Object(%@) with my method",anObject);
    NSLog(@"new array:%@",self);
}

@end

@interface NSArray (methodSwizzling)

- (BOOL)tc_containsObject:(id)anObject;

@end

@implementation NSArray (methodSwizzling)

- (BOOL)tc_containsObject:(id)anObject {
    BOOL contain = [self tc_containsObject:anObject];
    NSLog(@"contain:%@",contain ? @"YES" : @"NO");
    NSLog(@"self:%@", self);
    NSLog(@"self Class:%@, address:%p", NSStringFromClass([self class]), self);
    NSLog(@"#######################################");
    return contain;
}

@end


@interface TCRunTimeViewController ()

@end

@implementation TCRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"runtime Demo";
    
    [self methodSwizzlingDemo];
}

#pragma mark - AssociatedObject
- (void)associatedObjectDemo {
//    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
}


#pragma mark - Message Forwarding
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

#pragma mark - Method Swizzling
- (void)methodSwizzlingDemo {
//    Method originalMethod = class_getInstanceMethod([NSMutableArray class], @selector(addObject:));
//    Method newMethod = class_getInstanceMethod([NSMutableArray class], @selector(tc_addObject:));
//    method_exchangeImplementations(originalMethod, newMethod);
    
    Method originalMethod = class_getInstanceMethod([NSArray class], @selector(containsObject:));
    Method newMethod = class_getInstanceMethod([NSArray class], @selector(tc_containsObject:));
    method_exchangeImplementations(originalMethod, newMethod);

//    NSMutableArray *testMutableArray = [NSMutableArray arrayWithObjects:@"a", nil];
//    [testMutableArray addObject:@"b"];
    
    NSArray *testArray = @[@"a"];
    [testArray containsObject:@"b"];
    [testArray containsObject:@"a"];
}

#pragma mark - Class Cluster
- (void)classClusterDemo {
    
}

@end


