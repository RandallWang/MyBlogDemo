//
//  TCBlogModel.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/21.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import UIKit

@objc enum ModelType: Int {
    case StrongVsWeak
    case RuntimeDemo
    case RetainCycle
    case MemoryOptimization
    case Block
    case GCD
    case Mock
    case TableView
    case Swift
    case ResponderChain
    case RxSwift
    case TaskQueue
    case Crash
    case Codable
}


@objc class TCBlogModel: NSObject {
    @objc let type: ModelType
    
    @objc init(type: ModelType) {
        self.type = type
    }
    
    @objc var title: String {
        switch type {
        case .StrongVsWeak:
            return "Copy VS Strong,Deep Copy VS Shallow Copy"
        case .RuntimeDemo:
            return "Runtime Demo"
        case .RetainCycle:
            return "Retain Cycle"
        case .MemoryOptimization:
            return "Memory Optimization"
        case .Block:
            return "Block"
        case .GCD:
            return "GCD"
        case .Swift:
            return "Swift"
        case .Mock:
            return "Mock"
        case .TableView:
            return "tableView"
        case .ResponderChain:
            return "ResponderChain"
        case .RxSwift:
            return "RxSwift"
        case .Crash:
            return "Crash"
        case .TaskQueue:
            return "Task Queue"
        case .Codable:
            return "Codable"
//        default:
//            return "Error"
        }
    }
    
    @objc func targetVC() -> BaseViewController? {
        switch type {
        case .StrongVsWeak:
            return TCCopyViewController()
        case .RuntimeDemo:
            return TCRunTimeViewController()
        case .RetainCycle:
            return TCRetainCycleViewController()
        case .MemoryOptimization:
            return TCMemoryOptimizationViewController()
        case .Block:
            return TCBlockViewController()
        case .GCD:
            return TCGCDViewController()
        case .Swift:
            return SwiftDemo()
        case .Mock:
            return TCMockViewController()
        case .TableView:
            return TCGoodTableViewController()
        case .ResponderChain:
            return ResponderChainViewController()
        case .Crash:
            return TCCrashViewController()
        case .TaskQueue:
            return TCTaskQueueViewController()
        case .Codable:
            return SwiftCodableViewController()
        default://.RxSwift
            return nil
        }
    }
}
