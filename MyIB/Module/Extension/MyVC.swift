//
//  MyVC.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/10/14.
//

import Foundation
import UIKit
import SnapKit

class MyVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myBtn.rx.controlEvent(.touchUpInside).subscribe(onNext: {
//            print("点击了我的vc")
//        }).disposed(by: bag)
    }
    
    override func tapped() {
        print("23234234\(self.userID)")
    }
}
