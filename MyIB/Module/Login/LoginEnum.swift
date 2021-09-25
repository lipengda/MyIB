//
//  LoginEnum.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/25.
//

import Foundation

enum NetStatus {
    case start
    case end
    case success(Any)
    case failed(Error)
    var isSuccess: Bool {
        if case NetStatus.success = self {
            return true
        }else{
            return false
        }
    }
}
