//
//  TCGoodTableViewController.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/14.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCGoodTableViewController.h"
#import "TCDemoTableViewCell.h"
#import "TCListItemRequest.h"
#import "TCListItemResponse.h"
#import "TCNetworkManager.h"


@interface TCGoodTableViewController ()<TCNetworkDelegate>

@end

@implementation TCGoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"A Good TableView";
    
    [[TCNetworkManager manager] setDelegate:self];

    [self startListRequest];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TCDemoTableViewCell class]) forIndexPath:indexPath];
 
    
    
    return cell;
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
    NSLog(@"%@", response);
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

@end
