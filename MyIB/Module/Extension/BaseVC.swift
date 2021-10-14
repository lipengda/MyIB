//
//  BaseVC.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/10/14.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class BaseVC: UIViewController {
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myBtn)
        myBtn.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.center.equalToSuperview()
        }
        myBtn.backgroundColor = UIColor.red
    }
    
    lazy var myBtn: UIButton = {
        let btn = UIButton(type: .custom)
//        btn.rx.controlEvent(.touchUpInside).subscribe(onNext: {
//            print("点击了basevc")
//        }).disposed(by: bag)
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func tapped() {
        print("dianjile base")
    }
}
