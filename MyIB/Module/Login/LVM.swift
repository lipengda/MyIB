//
//  LVM.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/25.
//

import Foundation

import RxSwift
import RxCocoa

class LVM {
    let disposeBag = DisposeBag()
    
    struct Input {
        //用户名输入流
        let username: Observable<String>
        //密码输入流
        let password: Observable<String>
        //登陆点击事件输入流
        let signUpTap: Observable<Void>
    }
    struct Output {
        //登陆结果输出流
        var signInResult: Observable<NetStatus>!
//        var signInResult: Observable<Any>!
    }
    
    var output: Output
    
    var name: String {
        get {
            return "123"
        }
    }
    
    init(input: Input) {
        output = Output()
        
        let userInfo = Observable.combineLatest(input.username, input.password) { (username: $0, password: $1) }
        
        output.signInResult = input.signUpTap.withLatestFrom(userInfo).flatMapLatest({ userInfo -> Observable<NetStatus> in
            if (userInfo.username.count < 3) {
                return Observable<NetStatus>.create { observable in
                    observable.onNext(.success("长度不够了"))
                    return Disposables.create()
                }
            }
            return LoginService.signIn(username: userInfo.username, pwd: userInfo.password)
        })
        
        input.username.skip(1).subscribe(onNext: {text in
            print(text)
        }).disposed(by: disposeBag)

        
//        output.signInResult = input.signUpTap.flatMapLatest({ _ -> Observable<NetStatus> in
//            print("执行了")
//            return LoginService.signIn(username: "", pwd: "")
//        })
        
//        output.signInResult = input.signUpTap.flatMapLatest({ _ -> Observable in
//            return LoginService.signIn2(username: "", pwd: "")
//        })
    }
}
