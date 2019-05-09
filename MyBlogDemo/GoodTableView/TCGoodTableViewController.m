//
//  TCGoodTableViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/14.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCGoodTableViewController.h"
#import "TCDemoTableViewCell.h"
#import "TCAutoLayoutTableViewCell.h"
#import "TCMasonryTableViewCell.h"
#import "TCListItemRequest.h"
#import "TCListItemResponse.h"
#import "TCNetworkManager.h"
#import "FakeNetRequest.h"
#import "TCItemModel.h"


@interface TCGoodTableViewController ()<TCNetworkDelegate>

@property (nonatomic, copy)NSArray <TCItemModel *>*items;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TCGoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TCAutoLayoutTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TCAutoLayoutTableViewCell class])];
    [self.tableView registerClass:[TCDemoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([TCDemoTableViewCell class]) ];
    
    self.title = @"A Good TableView";
    
    [[TCNetworkManager manager] setDelegate:self];

    [self startListRequest];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCDemoTableViewCell class]) forIndexPath:indexPath];
//    TCAutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCAutoLayoutTableViewCell class]) forIndexPath:indexPath];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCMasonryTableViewCell class]) forIndexPath:indexPath];
    
//    TCItemModel *model = self.items[indexPath.row];
    
//    [cell setImages:@[[UIImage imageNamed:model.img1], [UIImage imageNamed:model.img2], [UIImage imageNamed:model.img3]]];
    NSLog(@"cell for row");

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"estimatedHeightForRowAtIndexPath");
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] init];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"heightForHeaderInSection");
    return 40;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Network
- (void)startListRequest {
    TCListItemRequest *request = [[TCListItemRequest alloc] init];
    [[TCNetworkManager manager] startRequest:request];
}

- (void)startLoadTableView:(TCListItemResponse *)response {
    self.items = response.items;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - TCNetworkDelegate
- (void)successedWithResponse:(TCBaseResponse *)response {
    if ([response isKindOfClass:[TCListItemResponse class]]) {
        [self startLoadTableView:(TCListItemResponse *)response];
    }
}

- (void)failedWithError:(NSError *)error {
    [self showErrorView:error];
}

#pragma mark - Private Methods
- (void)showErrorView:(NSError *)error {
    NSLog(@"ERROR: %@",error.localizedDescription);
}

- (void)startScroll {
    [UIScrollView beginAnimations:@"scrollAnimation" context:nil];
    [UIScrollView setAnimationDuration:10];
    
    [self.tableView setContentOffset:CGPointMake(0, 1000)];
    
    [UIScrollView commitAnimations];
}


@end
