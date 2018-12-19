//
//  TCListItemResponse.m
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2018/12/19.
//  Copyright © 2018 Tianchi Wang. All rights reserved.
//

#import "TCListItemResponse.h"
#import "TCItemModel.h"

@implementation TCListItemResponse

+ (instancetype)resultFromResponseData:(NSDictionary *)responseData {
    TCListItemResponse *response = [super resultFromResponseData:responseData];
    if (response) {
        NSMutableArray *tempArray = [NSMutableArray array];

        NSArray *modelList = [responseData objectForKey:@"listArray"];
        
        for (NSDictionary *itemInfo in modelList) {
            TCItemModel *model = [[TCItemModel alloc] init];
            model.itemName = [itemInfo objectForKey:@"name"];
            model.itemDescription = [itemInfo objectForKey:@"description"];
            [tempArray addObject:model];
        }
        response.items = tempArray.copy;
        
        return response;
    }
    return  nil;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.items];
}


@end
