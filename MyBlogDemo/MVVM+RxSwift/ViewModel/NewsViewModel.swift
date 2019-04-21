//
//  NewsViewModel.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/19.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation

struct NewsViewModel {
    let newsData: NewsModel
    
    var title: String {
        return newsData.title
    }
    
    var description: String{
        return newsData.description
    }
    
    var urlToImage: String{
        return newsData.urlToImage ?? ""
    }
    
    var newsUrlString: String{
        return newsData.url
    }

}
