//
//  MyError.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/25.
//

import Foundation

struct MyError: LocalizedError {
    var desc = ""
    var errorDescription: String {
        return desc
    }
    
    init(_ desc: String) {
        self.desc = desc
    }
}
