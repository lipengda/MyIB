//
//  LoginViewController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/9.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa
import PKHUD

let miniUsernameLength = 5
let miniPwdLength = 5;

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    
    @IBOutlet weak var login: UIButton!
    
    
    private var vm: LoginVM!
    private var viewModel: LoginViewModel!
    private var lvm: LVM!
    private var lViewModel: LViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mvc()
//        mvvm()
//        mvvmWithService()
//        setupVM()
        setupLViewModel()
        
    }
    
    deinit {
        print("释放了释放了")
    }
    
    /*------------------MVC------------------*/
    func mvc() {
        let usernameValid = userName.rx.text.orEmpty.map { text in
            return text.count >= miniUsernameLength
        }
        usernameValid.bind(to: usernameLabel.rx.isHidden).disposed(by: disposeBag)
        
        let pwdValid = pwd.rx.text.orEmpty.map { $0.count >= miniPwdLength }
        pwdValid.bind(to: pwdLabel.rx.isHidden).disposed(by: disposeBag)
        
        let everythingValid = Observable.combineLatest(usernameValid, pwdValid) {
            $0 && $1
        }
        everythingValid.bind(to: login.rx.isEnabled).disposed(by: disposeBag)
        
        login.rx.tap.subscribe(onNext: { [weak self] in
            HUD.flash(.success, onView: self?.view)
        }).disposed(by: disposeBag)

    }
    
    func mvvm() {
        vm = LoginVM.init(
            username: userName.rx.text.orEmpty.asObservable(),
            password: pwd.rx.text.orEmpty.asObservable()
        )
        
        vm.usernameValid
            .bind(to: pwd.rx.isEnabled)
            .disposed(by: disposeBag)

        vm.usernameValid
            .bind(to: usernameLabel.rx.isHidden)
            .disposed(by: disposeBag)

        vm.passwordValid
            .bind(to: pwdLabel.rx.isHidden)
            .disposed(by: disposeBag)

        vm.everythingValid
            .bind(to: login.rx.isEnabled)
            .disposed(by: disposeBag)

//        login.rx.tap
//            .subscribe(onNext: { [weak self] in
//                HUD.flash(.success, onView: self?.view)
//            }).disposed(by: disposeBag)
        login.rx.tap.asObservable().subscribe(onNext: { [weak self] in
            HUD.flash(.success, onView: self?.view)
        }).disposed(by: disposeBag)
        
    }
    
    func mvvmWithService() {
        viewModel = LoginViewModel.init(
            username: userName.rx.text.orEmpty.asObservable(),
            password: pwd.rx.text.orEmpty.asObservable(),
            loginTap: login.rx.tap.asObservable()
        )

        viewModel.usernameValid
            .bind(to: usernameLabel.rx.isHidden)
            .disposed(by: disposeBag)

        viewModel.passwordValid
            .bind(to: pwdLabel.rx.isHidden)
            .disposed(by: disposeBag)

        viewModel.everythingValid
            .bind(to: login.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    func setupVM() {
        lvm = LVM(input: LVM.Input(
            username: userName.rx.text.orEmpty.asObservable(),
            password: pwd.rx.text.orEmpty.asObservable(),
            signUpTap: login.rx.tap.asObservable())
        )
        
        lvm.output.signInResult.subscribe(onNext: { result in
            switch result {
            case .start:
                HUD.show(.progress)
            case .end:
                HUD.hide()
            case .success(let res):
                print("succ: \(res)")
            case .failed(let error):
                print("myerror: \(error.localizedDescription)")
            }
        }, onError: { (error) in
            print("error: \(error.localizedDescription)")
        }, onCompleted: {
            print("com")
        }).disposed(by: disposeBag)
        
//        lvm.output.signInResult.subscribe { (event: Event<NetStatus>) in
//            switch event {
//            case .completed:return
//            case .error(_):return
//            case .next(let s):return
//            }
//        }.disposed(by: disposeBag)


    }
    
    func setupLViewModel() {
        lViewModel = LViewModel(input: LViewModel.Input(
            usernameObservable: userName.rx.text.orEmpty.asObservable(),
            passwordObservable: pwd.rx.text.orEmpty.asObservable(),
            loginObservable: login.rx.tap.asObservable())
        )
        
        lViewModel.output.loginAction.observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] info in
            switch info {
            case .back:
                self?.navigationController?.popViewController(animated: true)
                print("backbackback")
            case .goHome:
                print("gogogo")
            case .showAlert(let text):
                print("show \(text)")
            }
        }).disposed(by: disposeBag)
        
        
        lViewModel.output.loginStatus.observe(on: MainScheduler.instance).subscribe(onNext: { status in
            switch status {
            case .show:
                HUD.show(.progress)
            case .hide:
                HUD.hide()
            }
        }).disposed(by: disposeBag)
    }
    
}
