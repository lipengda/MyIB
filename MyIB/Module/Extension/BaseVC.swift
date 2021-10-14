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
    var myurl: String?
    
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
    
    var userID: String?
    var gender: String?
    
    init(userID: String? = nil, gender: String) {
        self.userID = userID
        self.gender = gender
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var myBtn: UIButton = {
        let btn = UIButton(type: .custom)
//        btn.rx.controlEvent(.touchUpInside).subscribe(onNext: {
//            print("点击了basevc")
//        }).disposed(by: bag)
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        btn.setImage(UIImage(named: ""), for: .highlighted)
        return btn
    }()
    
    @objc func tapped() {
        print("dianjile base")
    }
}
