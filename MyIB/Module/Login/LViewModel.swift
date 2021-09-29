//
//  LViewModel.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/29.
//

import Foundation

import RxSwift
import RxCocoa

enum LoginActionType {
    case back
    case goHome
    case showAlert(String)
}

class LViewModel {
    let disposeBag = DisposeBag()
    
    struct Output {
        let loginAction = PublishRelay<LoginActionType>()
    }
    
    let output = Output()
    
    struct Input {
        //用户名输入流
        let usernameObservable: Observable<String>
        //密码输入流
        let passwordObservable: Observable<String>
        //登陆点击事件输入流
        let loginObservable: Observable<Void>
    }
    
    init(input: Input) {
        let userInfo = Observable.combineLatest(input.usernameObservable, input.passwordObservable) { (username: $0, password: $1) }
        
//        input.loginObservable.subscribe(onNext: { [weak self] _ in
//            print("点击了登陆按钮")
//            self?.requestService1(userName: userInfo.user, password: "String")
//        }).disposed(by: disposeBag)
        
        input.loginObservable.withLatestFrom(userInfo).subscribe(onNext: {
            info in
            self.requestService1(userName: info.username, password: info.password)
        }).disposed(by: disposeBag)
    }
}

extension LViewModel {
    func requestService1(userName: String, password: String) {
        if userName.count < 3 {
            print("用户名太短")
            return
        }
        if password.count < 3 {
            print("密码太短")
            return
        }
        LoginService.service1(userName: userName, password: password).subscribe { [weak self] info in
            print("requestService1 next:\(info)")
            self?.output.loginAction.accept(.showAlert("显示一个alert"))
            self?.requestService2()
        } onError: { error in
            print("requestService1 error:\(error)")
        } onCompleted: {
            print("requestService1 onCompleted")
        }.disposed(by: disposeBag)

    }
    
    func requestService2() {
        LoginService.service2().subscribe { [weak self] info in
            print("requestService2 next:\(info)")
            self?.output.loginAction.accept(.goHome)
            self?.requestService3()
        } onError: { error in
            print("requestService2 error:\(error)")
        } onCompleted: {
            print("requestService2 onCompleted")
        }.disposed(by: disposeBag)

    }
    
    func requestService3() {
        LoginService.service3().subscribe { [weak self] info in
            print("requestService3 next:\(info)")
            self?.output.loginAction.accept(.back)
        } onError: { error in
            print("requestService3 error:\(error)")
        } onCompleted: {
            print("requestService3 onCompleted")
        }.disposed(by: disposeBag)

    }
}
