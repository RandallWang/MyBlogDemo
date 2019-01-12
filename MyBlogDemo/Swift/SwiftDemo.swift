//
//  SwiftDemo.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/8.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import UIKit


class SwiftDemo: UIViewController {
    
    let demoArray1 = [1,2,2,3,3,4,5,5]
    let demoArray2 = [1,nil,3,3,4,nil,6]
    let demoArray3 = [[1,2,2,4,5,5],[1,nil,3,3,4,nil,6]];
    let demoArray4 = [[1,2,2,4,5,5],[1,3,3,4,6]];


    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        map()
        flatMap()
        compactMap()
        filter()
        reduce()
    }
    
    func map() {
        let result = demoArray1.map({
            $0
        })
        print(result)
        let result2 = demoArray2.map { num -> Int? in
            num ?? 0 * 2
        }
        
        print(result2)
    }
    
    func reduce() {
        let sum = demoArray1.reduce(0) { (reuslt, next) -> Int in
            return reuslt + next
        }
        
        print(sum)
    }
    
    func filter() {
        let result = demoArray1.filter({$0>3})
        print(result)
    }
    
    func flatMap() {//To flat some array into one, Still use flatmap
        let result = demoArray4.flatMap({$0})
        print(result)
        
        
        let result2 = demoArray3.flatMap{$0}
        print(result2)
    }
    
    func compactMap() {//to remove option value ,use compact map,To flat some array into one, Still use flatmap
        let result = demoArray2.compactMap({$0})
        print(result)
        
        let result2 = demoArray3.compactMap{$0}
        print(result2)
        
        let result4 = demoArray3.flatMap{$0}.compactMap({$0}).map({$0*2})
        print(result4)
    }

}


