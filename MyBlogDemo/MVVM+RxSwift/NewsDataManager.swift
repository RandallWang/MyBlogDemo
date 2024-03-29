//
//  NewsDataManager.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/18.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

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
    var page: Int = 1
    let pageSize: Int = 10

    func requestNewsData() -> Observable<NewsResponse> {
        let queryItemAppKey = URLQueryItem(name: "apiKey", value: apiKey)
        let queryItemCountry = URLQueryItem(name: "country", value: country)
        let queryItemPage = URLQueryItem(name: "page", value: "\(page)")
        let queryItemPageSize = URLQueryItem(name: "pageSize", value: "\(pageSize)")

        var components = URLComponents(string: baseURLStr)
        components?.queryItems = [queryItemAppKey, queryItemCountry, queryItemPage, queryItemPageSize]

        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            return URLSession.shared.rx
                .data(request: request)
                .map {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: $0)
                    return newsResponse
                }
                .do(onNext: { print("onNext:\($0)") })
        }
        return Observable.create {
            $0.on(.completed)
            return Disposables.create {
                print("disposed")
            }
        }
    }
}
