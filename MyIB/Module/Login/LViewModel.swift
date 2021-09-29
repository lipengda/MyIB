//
//  LViewModel.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/29.
//

import Foundation

import RxSwift
import RxCocoa

class LViewModel {
    let disposeBag = DisposeBag()
    
    struct Input {
        //用户名输入流
        let usernameObservable: Observable<String>
        //密码输入流
        let passwordObservable: Observable<String>
        //登陆点击事件输入流
        let loginObservable: Observable<Void>
    }
    
    let subject = PublishSubject<String>()
    
    init(input: Input) {
        input.loginObservable.subscribe(onNext: { [weak self] _ in
            print("点击了登陆按钮")
            self?.requestService1()
        }).disposed(by: disposeBag)
    }
}

extension LViewModel {
    func requestService1() {
        LoginService.service1().subscribe { [weak self] info in
            print("requestService1 next:\(info)")
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
            self?.subject.onNext("gotonextpage")
        } onError: { error in
            print("requestService3 error:\(error)")
        } onCompleted: {
            print("requestService3 onCompleted")
        }.disposed(by: disposeBag)

    }
}
