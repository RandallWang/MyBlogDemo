//
//  NewsModel.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/16.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [NewsModel]
}

struct NewsModel: Codable {
    var title: String
    var description: String
    var urlToImage: String
    var url: String
}
