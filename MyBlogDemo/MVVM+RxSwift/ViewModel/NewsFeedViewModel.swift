//
//  NewsFeedViewModel.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/20.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation

struct NewsFeedViewModel {
    var newsFeed: [NewsModel]

    var numberOfSections: Int {
        return 0
    }

    var numberOfRows: Int {
        return newsFeed.count
    }

    func viewModel(for index: Int) -> NewsViewModel {
        return NewsViewModel(newsData: newsFeed[index])
    }

    mutating func appendNewsModel (models: [NewsModel]) {
        newsFeed.append(contentsOf: models)
    }

    static let empty = NewsFeedViewModel(newsFeed: [])
}
