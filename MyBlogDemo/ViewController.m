//
//  ViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/8/9.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "ViewController.h"
#import "TCCopyViewController.h"
#import "TCRunTimeViewController.h"
#import "TCRetainCycleViewController.h"
#import "TCMemoryOptimizationViewController.h"
#import "TCBlockViewController.h"
#import "TCGCDViewController.h"
#import "TCMockViewController.h"
#import "TCGoodTableViewController.h"
#import "TCViewModel.h"
#import "MyBlogDemo-Swift.h"
#import "ResponderChainViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <TCViewModel *> *viewModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    [self setUpViewModel];
    [self.tableView reloadData];
    
    self.title = @"My blog demo";
}



#pragma mark - UITableView DataSource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    TCViewModel *model = self.viewModels[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TCViewModel *model = self.viewModels[indexPath.row];
    UIViewController *targetViewController = [[NSClassFromString(model.targetVCName) alloc] init];
    [self.navigationController pushViewController:targetViewController animated:YES];
}

#pragma mark - Private Method
- (void)setUpViewModel {
    TCViewModel *copyViewModel = [[TCViewModel alloc] initWithTitle:@"Copy VS Strong,Deep Copy VS Shallow Copy" targetVCName:NSStringFromClass([TCCopyViewController class])];
    TCViewModel *runtimeViewModel = [[TCViewModel alloc] initWithTitle:@"Runtime Demo" targetVCName:NSStringFromClass([TCRunTimeViewController class])];
    TCViewModel *retainCycleViewModel = [[TCViewModel alloc] initWithTitle:@"Retain Cycle" targetVCName:NSStringFromClass([TCRetainCycleViewController class])];
    TCViewModel *memoryOptimizationViewModel = [[TCViewModel alloc] initWithTitle:@"Memory Optimization" targetVCName:NSStringFromClass([TCMemoryOptimizationViewController class])];
    TCViewModel *blockViewModel = [[TCViewModel alloc] initWithTitle:@"Block" targetVCName:NSStringFromClass([TCBlockViewController class])];
    TCViewModel *GCDViewModel = [[TCViewModel alloc] initWithTitle:@"GCD" targetVCName:NSStringFromClass([TCGCDViewController class])];
    TCViewModel *MockViewModel = [[TCViewModel alloc] initWithTitle:@"Mock" targetVCName:NSStringFromClass([TCMockViewController class])];
    TCViewModel *TableViewViewModel = [[TCViewModel alloc] initWithTitle:@"Table View" targetVCName:NSStringFromClass([TCGoodTableViewController class])];
    TCViewModel *SwiftViewModel = [[TCViewModel alloc] initWithTitle:@"Swift" targetVCName:NSStringFromClass([SwiftDemo class])];
    TCViewModel *ResponderChainViewModel = [[TCViewModel alloc] initWithTitle:@"ResponderChain" targetVCName:NSStringFromClass([ResponderChainViewController class])];

    self.viewModels = @[copyViewModel, runtimeViewModel, retainCycleViewModel, memoryOptimizationViewModel, blockViewModel, GCDViewModel, MockViewModel, TableViewViewModel, SwiftViewModel, ResponderChainViewModel];
}

@end
