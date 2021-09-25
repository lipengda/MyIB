//
//  LoginService.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/11.
//

import Foundation
import RxSwift

class LoginService {
    static func signIn(username: String, pwd: String) -> Observable<NetStatus> {
        print("userInfo: \(username) \(pwd)")
        return Observable<NetStatus>.create { (anyObserver) -> Disposable in
            anyObserver.onNext(.start)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10, execute: {
                anyObserver.onNext(.end)
                anyObserver.onNext(.success("123"))
                anyObserver.onNext(.failed(MyError("this is my error")))
//                anyObserver.onError(MyError("this is my error"))
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    static func signIn2(username: String, pwd: String) -> Observable<Any> {
        return Observable.create { (anyObserver) -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                anyObserver.onNext("baan succ")
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
}
