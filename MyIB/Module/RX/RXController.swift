//
//  RXController.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/12/18.
//

import UIKit
import RxSwift
import RxRelay

class RXController: BaseViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLoginButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    let viewModel = RXViewModel()
    
    let bag = DisposeBag()
    
    var myListen: String?
    let relay = PublishRelay<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let isVaild = myTextField.rx.text.orEmpty.map { text in
//            text.count < 5
//        }
//        isVaild.bind(to: myLoginButton.rx.isHidden).disposed(by: bag)
        
        let _ = Observable<Int>.interval(RxTimeInterval.seconds(5), scheduler: MainScheduler())
            .subscribe(onNext: { [weak self] (state) in
                let num = Int(arc4random())
                self?.myLabel.text = "\(num)"
            })
            .disposed(by: bag)
        
        
        myTextField.rx.text.asObservable().bind(to: myLabel.rx.text).disposed(by: bag)
        
        relay
            .subscribe { print("Event:", $0) }
            .disposed(by: bag)
        
        relay.asObservable().bind(to: myLabel.rx.text).disposed(by: bag)
    }
    @IBAction func myAction(_ sender: Any) {
        
    }
    
}

class RXViewModel {
    var result: String?
}
