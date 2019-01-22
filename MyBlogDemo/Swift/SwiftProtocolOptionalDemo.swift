//
//  SwiftProtocolOptionalDemo.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/10.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import Foundation

protocol printable {
    func canPrintSomething()
}

extension printable {
    func canPrintSomething() {
        print("Default result")
    }
}
