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
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
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
    
    static func appInfo() -> Observable<NetStatus> {
        
        return Observable<NetStatus>.create { (anyObserver) -> Disposable in
            anyObserver.onNext(.start)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                anyObserver.onNext(.end)
                anyObserver.onNext(.success("getINfo"))
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    
    static func service1() -> Observable<Any> {
        return Observable<Any>.create { (anyObserver) -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                anyObserver.onNext("service1")
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    static func service2() -> Observable<Any> {
        return Observable<Any>.create { (anyObserver) -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                anyObserver.onNext("service2")
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
    
    static func service3() -> Observable<Any> {
        return Observable<Any>.create { (anyObserver) -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                anyObserver.onNext("service3")
                anyObserver.onCompleted()
            })
            
            return Disposables.create()
        }
    }
}
