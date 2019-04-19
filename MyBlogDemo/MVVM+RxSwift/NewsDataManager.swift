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
    private let baseURLStr: String
    private init(baseURLStr: String) {
        self.baseURLStr = baseURLStr
    }
    
    static let shared = NewsDataManager(baseURLStr: "https://newsapi.org/v2/top-headlines")
    
    let apiKey = "14d76183090f423e8a36db70d9bc0aba"
    let country = "us"
    var page: Int = 0
    let pageSize: Int = 10

    typealias completionHandler = (Result<[NewsModel], Error>) -> Void
    
    func requestNewsData(completion:@escaping completionHandler) {
        let queryItemAppKey = URLQueryItem.init(name: "apiKey", value: apiKey)
        let queryItemCountry = URLQueryItem.init(name: "country", value: country)
        let queryItemPage = URLQueryItem.init(name: "page", value: "\(page)")
        let queryItemPageSize = URLQueryItem.init(name: "pageSize", value: "\(pageSize)")
        
        var components = URLComponents(string: baseURLStr)
        components?.queryItems = [queryItemAppKey, queryItemCountry, queryItemPage, queryItemPageSize]
        
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                self.didFinishGettingNewsData(data: data, response: response, error: error, completion: completion)
            }.resume()
        }
    }
    
    func didFinishGettingNewsData(data: Data?, response: URLResponse?, error: Error?, completion: completionHandler) {
        if let error = error {
            completion(Result.failure(error))
        }else if let data = data, let response = response as? HTTPURLResponse{
            if response.statusCode == 200 {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(Result.success(newsResponse.articles))
                }catch {
                    completion(Result.failure(NewsRequestError.invalidResponse))
                }
            }else {
                completion(Result.failure(NewsRequestError.failedRequest))
            }
        }
    }
}


