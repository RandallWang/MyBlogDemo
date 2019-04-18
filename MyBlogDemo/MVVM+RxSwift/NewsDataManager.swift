//
//  NewsDataManager.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/18.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation

enum NewsRequestError: Error {
    case failedRequest
    case invalidResponse
    case unknown
}


final class NewsDataManager {
    
    private let baseURL: URL
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    
    //    curl https://newsapi.org/v2/top-headlines -G \
    //    -d country=us \
    //    -d apiKey=14d76183090f423e8a36db70d9bc0aba

    static let shared = NewsDataManager(baseURL: URL(string: "https://newsapi.org/v2/top-headlines")!)
    
    typealias completionHandler = (Result<[NewsModel], NewsRequestError>) -> Void
    
    
}


