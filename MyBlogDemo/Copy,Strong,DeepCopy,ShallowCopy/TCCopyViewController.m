//
//  TCCopyViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/9.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCCopyViewController.h"
#import "TCCopyItem.h"

@interface TCCopyViewController ()

@property (nonatomic, strong)NSString *strongString;
@property (nonatomic, copy) NSString *stringCopy;

@property (nonatomic, copy) NSMutableArray *testCopyMutableArray;

@property (nonatomic, strong) NSArray *testStrongArray;
@property (nonatomic, copy) NSArray *testCopyArray;

@end


@implementation TCCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Copy and Strong";

//    [self copyAndStrongStringTest];
//    [self MutableCopyArrayTest];
    [self strongArray];
//    [self testDeepCopy];
//    [self imageViewTest];
}

- (void)copyAndStrongStringTest {
    NSString *testString = @"test String";
    self.strongString = testString;
    self.stringCopy = testString;
    
    NSLog(@"*********NSString Test************");
    NSLog(@"address:%p",testString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    testString = @"changed test string";
    NSLog(@"address:%p",testString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    
    NSMutableString *testMutableString = [@"test Mutable String" mutableCopy];
    self.strongString = testMutableString;
    self.stringCopy = testMutableString;
    
    NSLog(@"*********NSMutableString Test************");
    NSLog(@"address:%p",testMutableString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
    [testMutableString appendString:@"changed!!!"];
    NSLog(@"address:%p",testMutableString);
    NSLog(@"address:%p,value:%@", self.strongString, self.strongString);
    NSLog(@"address:%p,value:%@", self.stringCopy, self.stringCopy);
    NSLog(@"*********************");
}

- (void)strongArray {
    NSMutableString *a = [NSMutableString stringWithString:@"a"];
    NSMutableArray *test = [NSMutableArray arrayWithObjects:a, @"b", nil];
    
    self.testStrongArray = test;
    self.testCopyArray = test;
    
    
    
    NSArray *array = [[NSArray alloc] initWithArray:test copyItems:test];
    
//    a = @"b";
    [a appendString:@"xxxx"];
    NSLog(@"array:%@",array);
    
    [test addObject:@"c"];
    
    NSLog(@"strong array%@", self.testStrongArray);
    NSLog(@"copy array%@", self.testCopyArray);
}

- (void)MutableCopyArrayTest {
    NSMutableArray *testArray = [NSMutableArray arrayWithObjects:@"aa", @"bb", nil];
    self.testCopyMutableArray = testArray;
    
    [self.testCopyMutableArray addObject:@"c"];//This will crash
}

- (void)testDeepCopy {
    NSMutableString *s = [NSMutableString stringWithString:@"a"];

    TCCopyItem *item = [[TCCopyItem alloc] initWithName:s];

    TCCopyItem *newItem = [item copy];

    NSLog(@"item name:%@", item.name);
    NSLog(@"DeepCopy item name:%@", newItem.name);

    [s appendString:@"xxx"];

    NSLog(@"item name:%@", item.name);
    NSLog(@"DeepCopy item name:%@", newItem.name);
}

- (void)imageViewTest {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100 , 100, 100)];
    [self.view addSubview:imageView];
    
    UIImage *testImage = [UIImage imageNamed:@"a"];
    NSLog(@"image:%p,**************%p", testImage, &testImage);
    
    imageView.image = testImage;
    
    UIImage *image = imageView.image;
    NSLog(@"imageVIew.image:%p,**************%p", imageView.image, &image);
    
    testImage = nil;
    NSLog(@"image:%p,**************%p", testImage, &testImage);
    NSLog(@"imageVIew.image:%p,**************%p", imageView.image, &image);
    
}

@end

