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
#import "MyBlogDemo-Swift.h"
#import "ResponderChainViewController.h"
#import "TCTaskQueueViewController.h"
#import "TCCrashViewController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <TCBlogModel *> *models;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToRxMVVM"]) {

    }
}

#pragma mark - UITableView DataSource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    TCBlogModel *model = self.models[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TCBlogModel *model = self.models[indexPath.row];
    [self performPushForModel:model];
}

#pragma mark - Private Method
- (void)setUpViewModel {
    
    TCBlogModel *copyModel = [[TCBlogModel alloc] initWithType:ModelTypeStrongVsWeak];
    
    TCBlogModel *runtimeModel =  [[TCBlogModel alloc] initWithType:ModelTypeRuntimeDemo];
    TCBlogModel *retainCycleModel = [[TCBlogModel alloc] initWithType:ModelTypeRetainCycle];
    TCBlogModel *memoryOptimizationModel =  [[TCBlogModel alloc] initWithType:ModelTypeMemoryOptimization];
    TCBlogModel *blockModel =  [[TCBlogModel alloc] initWithType:ModelTypeBlock];
    TCBlogModel *GCDModel =  [[TCBlogModel alloc] initWithType:ModelTypeGCD];
    TCBlogModel *MockModel = [[TCBlogModel alloc] initWithType:ModelTypeMock];
    TCBlogModel *TableViewModel = [[TCBlogModel alloc] initWithType:ModelTypeTableView];
    TCBlogModel *SwiftModel = [[TCBlogModel alloc] initWithType:ModelTypeSwift];
    TCBlogModel *ResponderChainModel = [[TCBlogModel alloc] initWithType:ModelTypeResponderChain];
    TCBlogModel *RxSwiftModel = [[TCBlogModel alloc] initWithType:ModelTypeRxSwift];
    TCBlogModel *TaskQueueModel = [[TCBlogModel alloc] initWithType:ModelTypeTaskQueue];
    TCBlogModel *CrashModel = [[TCBlogModel alloc] initWithType:ModelTypeCrash];
    TCBlogModel *codableModel = [[TCBlogModel alloc] initWithType:ModelTypeCodable];

    self.models = @[copyModel, runtimeModel, retainCycleModel, memoryOptimizationModel, blockModel, GCDModel, MockModel, TableViewModel, SwiftModel, ResponderChainModel, RxSwiftModel, TaskQueueModel, CrashModel, codableModel];
}

- (void)performPushForModel:(TCBlogModel *)model {
    if (model.type == ModelTypeRxSwift) {
        [self performSegueWithIdentifier:@"ToRxMVVM" sender:self];
    }else {
        BaseViewController *targetViewController = model.targetVC;
        targetViewController.model = model;
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
}

@end
