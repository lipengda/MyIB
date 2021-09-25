//
//  LoginViewModel.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/11.
//

import Foundation
import RxSwift
import RxCocoa

private let minimalUsernameLength = 5
private let minimalPasswordLength = 5

class LoginViewModel {
    let disposeBag = DisposeBag()
    
    var username: String?
    var pwd: String?
    
    // 输出
    let usernameValid: Observable<Bool>
    let passwordValid: Observable<Bool>
    let everythingValid: Observable<Bool>
    
    //登陆
//    let signingIn: Observable<Void>
    
    // 输入 -> 输出
    init(
        username: Observable<String>,
        password: Observable<String>,
        loginTap: Observable<Void>
        ) {
            
            usernameValid = username
                .map { $0.count >= minimalUsernameLength }

            passwordValid = password
                .map { $0.count >= minimalPasswordLength }

            everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            
            username.subscribe(onNext: { [weak self] text in
                self?.username = text
            }).disposed(by: disposeBag)
            
            loginTap.subscribe(onNext: {[weak self] _ in
                guard let username = self?.username else { return }
                print(username)
            }).disposed(by: disposeBag)

    }
}
