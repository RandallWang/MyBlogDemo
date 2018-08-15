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
#import "TCViewModel.h"

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
    
    self.viewModels = @[copyViewModel, runtimeViewModel, retainCycleViewModel];
}

@end
