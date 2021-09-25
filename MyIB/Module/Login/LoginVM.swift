//
//  LoginVM.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/9.
//

import Foundation
import RxSwift

private let minimalUsernameLength = 5
private let minimalPasswordLength = 5;

class LoginVM {
    // 输出
    let usernameValid: Observable<Bool>
    let passwordValid: Observable<Bool>
    let everythingValid: Observable<Bool>
    
    // 输入 -> 输出
    init(
        username: Observable<String>,
        password: Observable<String>
        ) {

        usernameValid = username
            .map { $0.count >= minimalUsernameLength }

        passwordValid = password
            .map { $0.count >= minimalPasswordLength }

        everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }

    }
}
